package vn.com.vti.bus.backend.validator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vn.com.vti.bus.backend.form.RouteForm;
import vn.com.vti.bus.entity.Reservation;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.mapper.ReservationCustomMapper;
import vn.com.vti.bus.mapper.RouteMapper;

@Component
public class CantChangeRouteValidator implements Validator {

	@Autowired
	private ReservationCustomMapper reservationCustomMapper;

	@Autowired
	private RouteMapper routeMapper;

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

		List<Reservation> reservation = reservationCustomMapper.selectByRouteId(routeForm.getRouteId());

		Route route = routeMapper.selectByPrimaryKey(routeForm.getRouteId());

		if (!reservation.isEmpty()) {
			if (!route.getDepartureBusStopId().equals(routeForm.getDepartureBusStopId())) {
				errors.rejectValue("departureBusStopId", "error.cantChangeRoute",
						"既に予約が存在しているため、運行終了日以外の項目を変更できません。");
			} else if (!route.getDepartureTime().equals(routeForm.getDepartureTime())) {
				errors.rejectValue("departureTime", "error.cantChangeRoute",
						"既に予約が存在しているため、運行終了日以外の項目を変更できません。");
			} else if (!route.getArrivalBusStopId().equals(routeForm.getArrivalBusStopId())) {
				errors.rejectValue("arrivalBusStopId", "error.cantChangeRoute",
						"既に予約が存在しているため、運行終了日以外の項目を変更できません。");
			} else if (!route.getArrivalTime().equals(routeForm.getArrivalTime())) {
				errors.rejectValue("arrivalTime", "error.cantChangeRoute",
						"既に予約が存在しているため、運行終了日以外の項目を変更できません。");
			} else if (!route.getPrice().equals(routeForm.getPrice())) {
				errors.rejectValue("price", "error.cantChangeRoute",
						"既に予約が存在しているため、運行終了日以外の項目を変更できません。");
			}
		}
	}
}

