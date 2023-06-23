package vn.com.vti.bus.mapper;

import java.util.List;

import vn.com.vti.bus.entity.Reservation;

public interface ReservationCustomMapper {
	List<Reservation> selectByRouteId(Integer routeId);
}
