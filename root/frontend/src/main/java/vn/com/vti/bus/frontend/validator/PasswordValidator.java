package vn.com.vti.bus.frontend.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vn.com.vti.bus.frontend.form.RegisterForm;

@Component
public class PasswordValidator implements Validator {

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
		String password = registerForm.getPassword();
		String matchingPassword = registerForm.getMatchingPassword();

		if (!password.equals(matchingPassword)) {
			errors.rejectValue("matchingPassword", "error.passwordNotMatch",
					"パスワードとパスワード確認は同一にしてください。");
		}	
	}
}

