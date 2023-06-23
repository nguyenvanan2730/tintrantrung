package vn.com.vti.bus.frontend.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.frontend.form.RegisterForm;
import vn.com.vti.bus.frontend.validator.EmailExistValidator;
import vn.com.vti.bus.frontend.validator.PasswordValidator;
import vn.com.vti.bus.mapper.MemberMapper;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordValidator passwordValidator;
	
	@Autowired
	private EmailExistValidator emailExistValidator;
	
	@InitBinder
	public void validatorBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(passwordValidator);
		webDataBinder.addValidators(emailExistValidator);
	}
	
	@ModelAttribute
	public RegisterForm createForm() {
		return new RegisterForm();
	}

	@RequestMapping("/input")
	public String input(RegisterForm registerForm) {

		return "register/registerInput";
	}
	
	@RequestMapping("/confirm")
	public String confirm(@Valid RegisterForm registerForm, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return input(registerForm);
		}
		return "register/registerConfirm";
	}
	
	@RequestMapping("insert")
	public String insert(RegisterForm registerForm, RedirectAttributes redirectAttributes) {
		Member member = new Member();
		member.setFirstName(registerForm.getFirstName());
		member.setLastName(registerForm.getLastName());
		member.setTel(registerForm.getTel());
		member.setEmail(registerForm.getEmail());
		member.setPassword(registerForm.getPassword());
		
		memberMapper.insertSelective(member);

		redirectAttributes.addFlashAttribute("message","会員登録完了！ご登録ありがとうございます！");

		return "redirect:/login";
	}
}
