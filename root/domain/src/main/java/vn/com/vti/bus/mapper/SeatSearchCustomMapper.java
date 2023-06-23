package vn.com.vti.bus.mapper;

import java.util.Date;
import java.util.List;

import vn.com.vti.bus.entity.SeatSearchCustomized;

public interface SeatSearchCustomMapper {

	List<SeatSearchCustomized> getReservedSeats (Integer routeId,Date reservationDatetime);
 
}