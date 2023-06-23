package vn.com.vti.bus.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.MemberExample;
import vn.com.vti.bus.mapper.MemberMapper;
@Controller
@RequestMapping("/user")
public class UserListController {

	@Autowired
	private MemberMapper memberMapper;

	@RequestMapping("/search")
	public String search(Model model, @RequestParam(required = false) String memberId,
	                     @RequestParam(required = false) String name) {
	    MemberExample memberExample = new MemberExample();
	    memberExample.setOrderByClause("member_id");

	    if (memberId != null && !memberId.isEmpty()) {
	        try {
	            int memberIdInt = Integer.parseInt(memberId);
	            memberExample.createCriteria().andMemberIdEqualTo(memberIdInt);

	            if (name != null && !name.isEmpty()) {
	                memberExample.or().andMemberIdEqualTo(memberIdInt)
	                        .andFirstNameLike("%" + name + "%").andLastNameLike("%" + name + "%");
	            }
	        } catch (NumberFormatException e) {
	        }
	    } else {
	        if (name != null && !name.isEmpty()) {
	            memberExample.or().andFirstNameLike("%" + name + "%");
	            memberExample.or().andLastNameLike("%" + name + "%");
	        }
	    }

	    List<Member> memberList = memberMapper.selectByExample(memberExample);

	    model.addAttribute("memberList", memberList);

	    return "user/userList";
	}

	@RequestMapping("/list")
	public String index(Model model) {
		return search(model, null, null);
	}
}