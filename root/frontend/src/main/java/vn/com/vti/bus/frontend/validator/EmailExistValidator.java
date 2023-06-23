package vn.com.vti.bus.frontend.validator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.MemberExample;
import vn.com.vti.bus.frontend.form.RegisterForm;
import vn.com.vti.bus.mapper.MemberMapper;

@Component
public class EmailExistValidator implements Validator {
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}

	@Override
	public void validate(Object target, Errors errors) {

		if(!(target instanceof RegisterForm)) {
			return;
		}

		RegisterForm registerForm = (RegisterForm) target;
		
		String email = registerForm.getEmail();
		
		MemberExample memberExample = new MemberExample();
		List<Member> members = memberMapper.selectByExample(memberExample);
		
		for (Member member : members) {
			if (member.getEmail().equals(email)) {
				errors.rejectValue("email", "error.alreadyExist",
						"メールアドレスは既に存在します。");
				break;
			}
		}
	}
}


