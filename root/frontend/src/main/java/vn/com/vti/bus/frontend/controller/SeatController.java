package vn.com.vti.bus.frontend.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.entity.BusCustomized;
import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.Reservation;
import vn.com.vti.bus.entity.ReservationDetail;
import vn.com.vti.bus.entity.RouteCustom;
import vn.com.vti.bus.entity.SeatSearchCustomized;
import vn.com.vti.bus.frontend.security.MemberDetails;
import vn.com.vti.bus.mapper.BusCustomMapper;
import vn.com.vti.bus.mapper.ReservationDetailMapper;
import vn.com.vti.bus.mapper.ReservationMapper;
import vn.com.vti.bus.mapper.RouteCustomMapper;
import vn.com.vti.bus.mapper.SeatSearchCustomMapper;

@Controller
@RequestMapping("/seat")
public class SeatController {

	@Autowired
	private SeatSearchCustomMapper seatSearchCustomMapper;

	@Autowired
	private BusCustomMapper busCustomMapper;

	@Autowired
	private RouteCustomMapper routeCustomMapper;

	@Autowired
	private ReservationMapper reservationMapper;

	@Autowired
	private ReservationDetailMapper reservationDetailMapper;

	@RequestMapping("select")
	public String select(
			@RequestParam(value = "reservationDatetime", required = true) String reservationDateStr,
			@RequestParam(value = "routeId", required = true) Integer routeId,
			Model model,
			RedirectAttributes redirectAttributes) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date reservationDatetime = sdf.parse(reservationDateStr);
		model.addAttribute("reservationDatetime", reservationDatetime);

		RouteCustom route = routeCustomMapper.selectByRouteId(routeId);
		model.addAttribute("route", route);

		List<String> reservedSeatsList = new ArrayList<>();

		List<SeatSearchCustomized> reservedSeats = new ArrayList<>();
		reservedSeats = seatSearchCustomMapper.getReservedSeats(routeId, reservationDatetime);
		for (SeatSearchCustomized seat : reservedSeats) {
			reservedSeatsList.add(seat.getSeatName());
		}
		model.addAttribute("reservedSeatsList", reservedSeatsList);

		BusCustomized bus = busCustomMapper.selectByRouteId(routeId);
		Integer rowNum = bus.getRowNum();
		Integer colNum = bus.getColumnNum();

		List<String> allSeatNames = generateSeatNames(rowNum, colNum);
		model.addAttribute("allSeatNames", allSeatNames);
		model.addAttribute("colNum", colNum);

		return "seat/select";
	}

	@RequestMapping("confirm")
	public String confirm(
			@RequestParam(value = "reservationDatetime", required = true) String reservationDateStr,
			@RequestParam(value = "routeId", required = true) Integer routeId,
			@RequestParam(value = "selectedSeats", required = true) List<String> selectedSeats,
			Model model,
			RedirectAttributes redirectAttributes) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date reservationDatetime = sdf.parse(reservationDateStr);
		model.addAttribute("reservationDatetime", reservationDatetime);

		RouteCustom route = routeCustomMapper.selectByRouteId(routeId);
		model.addAttribute("route", route);

		model.addAttribute("selectedSeats", selectedSeats);

		List<String> reservedSeatsList = new ArrayList<>();

		List<SeatSearchCustomized> reservedSeats = seatSearchCustomMapper.getReservedSeats(routeId,
				reservationDatetime);
		for (SeatSearchCustomized seat : reservedSeats) {
			reservedSeatsList.add(seat.getSeatName());
		}
		model.addAttribute("reservedSeatsList", reservedSeatsList);

		if (reservedSeatsList.size() == route.getTotalSeat()) {
			redirectAttributes.addFlashAttribute("errorAllReserved", "指定された路線は満席になりました。別の路線を検索しなおしてください。");
			String redirectUrl = "redirect:/seat/select?reservationDatetime=" + reservationDateStr +
					"&routeId=" + routeId;
			return redirectUrl;
		}

		List<String> conflictingSeats = getConflictingSeats(selectedSeats, reservedSeatsList);
		if (!conflictingSeats.isEmpty()) {
			redirectAttributes.addFlashAttribute("errorReservedSeat",
					"選択した座席" + String.join(", ", conflictingSeats) + "が他の利用者によって予約されています。再度指定しなおしてください。");
			String redirectUrl = "redirect:/seat/select?reservationDatetime=" + reservationDateStr +
					"&routeId=" + routeId;
			return redirectUrl;
		}

		return "seat/confirm";

	}

	@RequestMapping("finish")
	public String finish(
			@RequestParam(value = "reservationDatetime", required = true) String reservationDateStr,
			@RequestParam(value = "routeId", required = true) Integer routeId,
			@RequestParam(value = "selectedSeats", required = true) List<String> selectedSeats,
			Model model,
			RedirectAttributes redirectAttributes,
			@AuthenticationPrincipal MemberDetails memberDetails) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date reservationDatetime = sdf.parse(reservationDateStr);
		model.addAttribute("reservationDatetime", reservationDatetime);

		RouteCustom route = routeCustomMapper.selectByRouteId(routeId);
		model.addAttribute("route", route);
		model.addAttribute("selectedSeats", selectedSeats);

		List<String> reservedSeatsList = new ArrayList<>();
		List<SeatSearchCustomized> reservedSeats = seatSearchCustomMapper.getReservedSeats(routeId,
				reservationDatetime);
		for (SeatSearchCustomized reservedseat : reservedSeats) {
			reservedSeatsList.add(reservedseat.getSeatName());
		}
		model.addAttribute("reservedSeatsList", reservedSeatsList);

		if (reservedSeatsList.size() == route.getTotalSeat()) {
			redirectAttributes.addFlashAttribute("errorAllReserved", "指定された路線は満席になりました。別の路線を検索しなおしてください。");
			String redirectUrl = "redirect:/seat/select?reservationDatetime=" + reservationDateStr +
					"&routeId=" + routeId;
			return redirectUrl;
		}

		List<String> conflictingSeats = getConflictingSeats(selectedSeats, reservedSeatsList);
		if (!conflictingSeats.isEmpty()) {
			redirectAttributes.addFlashAttribute("errorReservedSeat",
					"選択した座席" + String.join(", ", conflictingSeats) + "が他の利用者によって予約されています。再度指定しなおしてください。");
			String redirectUrl = "redirect:/seat/select?reservationDatetime=" + reservationDateStr + "&routeId="
					+ routeId;
			return redirectUrl;
		}
		Member member = memberDetails.getMember();
		int memberId = member.getMemberId();

		Reservation reservation = new Reservation();
		reservation.setReservationDatetime(reservationDatetime);
		reservation.setRouteId(routeId);
		reservation.setUserId(memberId);

		reservationMapper.insertSelective(reservation);

		for (String seat : selectedSeats) {
			ReservationDetail reservationDetail = new ReservationDetail();
			reservationDetail.setSeatName(seat);
			reservationDetail.setReservationNo(reservation.getReservationNo());
			reservationDetailMapper.insertSelective(reservationDetail);
		}
		model.addAttribute("reservation",reservation);

		return "seat/finish";

	}

	private List<String> generateSeatNames(Integer rowNum, Integer colNum) {
		List<String> seatNames = new ArrayList<>();
		for (int row = 1; row <= rowNum; row++) {
			for (int column = 1; column <= colNum; column++) {
				String seatName = row + "" + (char) ('A' + column - 1);
				seatNames.add(seatName);
			}
		}
		return seatNames;
	}

	private List<String> getConflictingSeats(List<String> selectedSeats, List<String> reservedSeatsList) {
		List<String> conflictingSeats = new ArrayList<>();
		for (String seat : selectedSeats) {
			if (reservedSeatsList.contains(seat)) {
				conflictingSeats.add(seat);
			}
		}
		return conflictingSeats;
	}
}
