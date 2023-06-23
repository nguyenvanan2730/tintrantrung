package vn.com.vti.bus.backend.validator;

import java.util.Date;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class RunStartDateAfterTodayValidator implements ConstraintValidator<RunStartDateAfterToday, Date> {

    @Override
    public boolean isValid(Date runStartDate, ConstraintValidatorContext context) {
        if (runStartDate == null) {
            return true; 
        }

        Date currentDate = new Date();
        return runStartDate.equals(currentDate)||runStartDate.before(currentDate);
    }
}
