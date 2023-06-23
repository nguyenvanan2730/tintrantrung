package vn.com.vti.bus.backend.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.backend.form.RouteSearchForm;
import vn.com.vti.bus.entity.BookingCustomized;
import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.RouteCustomized;
import vn.com.vti.bus.mapper.BookingCustomMapper;
import vn.com.vti.bus.mapper.MemberMapper;
import vn.com.vti.bus.mapper.RouteListCustom;

@Controller
@RequestMapping("booking")
public class BookingController {
	@Autowired
	private BookingCustomMapper bookingCustomMapper;

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private RouteListCustom routeListCustom;

	@RequestMapping("list")
	public String bookingDetail(@RequestParam("memberId") Integer memberId, Model model) {

		Member member = memberMapper.selectByPrimaryKey(memberId);
		model.addAttribute("member", member);

		List<BookingCustomized> booking = bookingCustomMapper.selectByUserId(memberId);
		model.addAttribute("booking", booking);
		return "booking/bookingList";
	}

	@RequestMapping("dailyList")
	public String dailyList(
			@RequestParam("routeId") Integer routeId,
			@RequestParam("date") String reservationDateStr,
			@Valid RouteSearchForm routeSearchForm,
			BindingResult bindingResult, Model model) throws ParseException {

		if (bindingResult.hasErrors()) {
        	model.addAttribute("hasErrors", true);
        }
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date reservationDate = null;
		if (!reservationDateStr.isEmpty()) {
			reservationDate = sdf.parse(reservationDateStr);
		}
		model.addAttribute("reservationDate", reservationDateStr);

		BookingCustomized bus = bookingCustomMapper.getRouteAndBus(routeId, reservationDate);
		model.addAttribute("bus", bus);

		List<BookingCustomized> members = bookingCustomMapper.getMembers(routeId, reservationDate);

		for (BookingCustomized member : members) {
			List<String> reservedSeats = bookingCustomMapper.getReservedSeatsForMember(member.getUserId(), routeId,
					reservationDate);
			member.setSeatNames(reservedSeats);
		}
		model.addAttribute("members", members);

		List<RouteCustomized> routeList = routeListCustom.getReservedRoute();
		model.addAttribute("routeList", routeList);

		return "booking/searchResult";
	}
	}