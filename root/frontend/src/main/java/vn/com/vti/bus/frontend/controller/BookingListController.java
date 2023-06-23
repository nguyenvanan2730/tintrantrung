package vn.com.vti.bus.frontend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bus.entity.BookingCustomized;
import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.frontend.security.MemberDetails;
import vn.com.vti.bus.mapper.BookingHistoryMapper;

@Controller
@RequestMapping("/booking")
public class BookingListController {

    @Autowired
    private BookingHistoryMapper bookingHistoryMapper;
   
    @RequestMapping("/list")
    public String list(Model model, @AuthenticationPrincipal MemberDetails memberDetails) {
        Member member = memberDetails.getMember();
        int memberId = member.getMemberId();
        
        List<BookingCustomized> bookingHistory = bookingHistoryMapper.getBookingHistory(memberId);
        model.addAttribute("bookingHistory", bookingHistory);
        
        return "booking/bookingHistory";
    }

    
}
