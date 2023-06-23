package vn.com.vti.bus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import vn.com.vti.bus.entity.BookingCustomized;

public interface BookingHistoryMapper {
	List<BookingCustomized> getBookingHistory(Integer memberId);
	@Delete("DELETE FROM reservation_detail WHERE reservation_no = #{reservationNo}")
	void deleteReservationDetailByPrimaryKey(@Param("reservationNo") Integer reservationNo);
	
}


