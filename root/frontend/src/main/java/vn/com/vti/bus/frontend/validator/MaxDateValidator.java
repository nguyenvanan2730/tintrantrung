package vn.com.vti.bus.frontend.validator;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vn.com.vti.bus.frontend.form.RegisterForm;
import vn.com.vti.bus.frontend.form.RouteSearchForm;

@Component
public class MaxDateValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}

	@Override
	public void validate(Object target, Errors errors) {

		if (!(target instanceof RegisterForm)) {
			return;
		}

		RouteSearchForm routeSearchForm = (RouteSearchForm) target;
		String date = routeSearchForm.getDate();

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date selectedDate = null;
		
		try {
			selectedDate = dateFormat.parse(date);
		} catch (ParseException e) {
			 e.printStackTrace();
		}

		Date currentDate = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(currentDate);

		calendar.add(Calendar.DAY_OF_MONTH, 90);
		Date maxDate = calendar.getTime();

		if (selectedDate.after(maxDate)) {
			errors.rejectValue("date", "error.maxDate", "90日先まで選択してください。");
		}
	}
}
