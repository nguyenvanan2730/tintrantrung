package vn.com.vti.bus.backend.validator;

import java.util.Date;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class RunStartDateAfterTodayValidator implements ConstraintValidator<RunStartDateAfterToday, Date> {

    @Override
    public boolean isValid(Date runStartDate, ConstraintValidatorContext context) {
    	Date currentDate = new Date();
    	Date currentDay = new Date(currentDate.getYear(), currentDate.getMonth(), currentDate.getDate());
    	
    	if (runStartDate == null) {
            return true; 
        }   
        return runStartDate.after(currentDay)||runStartDate.equals(currentDay);
    }
}


