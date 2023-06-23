package vn.com.vti.bus.backend.validator;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vn.com.vti.bus.backend.form.RouteForm;
import vn.com.vti.bus.entity.Reservation;
import vn.com.vti.bus.mapper.ReservationCustomMapper;

@Component
public class ExistReserveOutsideValidator implements Validator {

	@Autowired
	private ReservationCustomMapper reservationCustomMapper;

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
		if (routeForm.getRunEndDate()== null) {
			return;
		}

		List<Reservation> reservations = reservationCustomMapper.selectByRouteId(routeForm.getRouteId());

		Date maxDateTime = new Date(Long.MIN_VALUE);

		for (Reservation reservation : reservations) {
			Date reservationDateTime = reservation.getReservationDatetime();
			if (reservationDateTime.after(maxDateTime)) {
				maxDateTime = reservationDateTime;
			}
		}

		if (!reservations.isEmpty()) {
			if (maxDateTime.after(routeForm.getRunEndDate())) {
				errors.rejectValue("runEndDate", "error.existReserveOutside",
						"指定された運行開始日から運行終了日の範囲外に予約が存在します。");
			}
		}
	}
}

