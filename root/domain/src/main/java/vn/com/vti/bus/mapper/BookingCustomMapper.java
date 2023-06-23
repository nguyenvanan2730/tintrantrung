package vn.com.vti.bus.mapper;

import java.util.Date;
import java.util.List;

import vn.com.vti.bus.entity.BookingCustomized;

public interface BookingCustomMapper {
	List<BookingCustomized> selectByUserId(Integer memberId);
	
	List<BookingCustomized> getMembers(Integer routeId, Date reservationDate);
	
	List<String> getReservedSeatsForMember(Integer userId,Integer routeId, Date reservationDate);
	
	BookingCustomized getRouteAndBus(Integer routeId, Date reservationDate);
	
	
}
