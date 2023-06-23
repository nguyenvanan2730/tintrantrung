package vn.com.vti.bus.backend.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vn.com.vti.bus.backend.form.RouteForm;

@Component
public class RunDateReverseValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return true;
    }

    @Override
    public void validate(Object target, Errors errors) {
        
        if(!(target instanceof RouteForm)) {
			return;
		}
        
        RouteForm routeForm = (RouteForm) target;
        
        if (routeForm.getRunStartDate() == null || routeForm.getRunEndDate() == null) {
            return;
        }

        if (routeForm.getRunEndDate().before(routeForm.getRunStartDate())) {
            errors.rejectValue("runStartDate", "runDateReverse", "運航開始日は運行終了日より前の日付を入力してください。");
        }
    }
}

