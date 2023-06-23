package vn.com.vti.bus.frontend.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.entity.BookingCustomized;
import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.frontend.security.MemberDetails;
import vn.com.vti.bus.mapper.BookingHistoryMapper;
import vn.com.vti.bus.mapper.ReservationMapper;

@Controller
@RequestMapping("/bookingCancel")
public class BookingCancelController {

    private final BookingHistoryMapper bookingHistoryMapper;
    private final ReservationMapper reservationMapper;

    @Autowired
    public BookingCancelController(BookingHistoryMapper bookingHistoryMapper, ReservationMapper reservationMapper) {
        this.bookingHistoryMapper = bookingHistoryMapper;
        this.reservationMapper = reservationMapper;
    }

    @RequestMapping("/confirm")
    public String showCancelConfirmation(@RequestParam("reservationNo") Integer reservationNo, Model model,
                                         @AuthenticationPrincipal MemberDetails memberDetails) {
        Member member = memberDetails.getMember();
        int memberId = member.getMemberId();

        List<BookingCustomized> bookingHistory = bookingHistoryMapper.getBookingHistory(memberId);

        List<BookingCustomized> filteredHistory = bookingHistory.stream()
                .filter(booking -> booking.getReservationNo().equals(reservationNo))
                .collect(Collectors.toList());

        model.addAttribute("bookingHistory", filteredHistory);

        return "booking/bookingCancelConfirm";
    }

    @RequestMapping("/cancel")
    public String cancelExecute (@RequestParam Integer reservationNo, RedirectAttributes redirectAttributes, Model model) {
        bookingHistoryMapper.deleteReservationDetailByPrimaryKey(reservationNo);
        reservationMapper.deleteByPrimaryKey(reservationNo);
        
        redirectAttributes.addFlashAttribute("message", "予約番号" + reservationNo + "をキャンセルしました。");
        return "redirect:/booking/list";
    }
}
