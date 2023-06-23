package vn.com.vti.bus.backend.validator;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ElementType.FIELD, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = RunStartDateAfterTodayValidator.class)

public @interface RunStartDateAfterToday {
	String message() default "The run start date must be after today";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
