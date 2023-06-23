package vn.com.vti.bus.backend.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vn.com.vti.bus.backend.form.RouteForm;

@Component
public class DifferentBusStopsValidator implements Validator {

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

        if (routeForm.getArrivalBusStopId() != null && routeForm.getDepartureBusStopId() != null &&
                routeForm.getArrivalBusStopId().equals(routeForm.getDepartureBusStopId())) {
            errors.rejectValue("arrivalBusStopId", "mustDifferentBusStop", "出発停留所と到着停留所は異なるものを選択してください。");
        }
    }
}

