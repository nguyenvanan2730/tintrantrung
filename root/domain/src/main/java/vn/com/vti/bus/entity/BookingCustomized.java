package vn.com.vti.bus.entity;

import java.sql.Date;
import java.util.List;

public class BookingCustomized {

	private Integer reservationNo;
	private Date reservationDatetime;
	private Integer routeId;
	private Integer userId;
	private Integer busId;
	private Integer departureBusStopId;
	private String departureBusStopName;
	private String departureTime;
	private Integer arrivalBusStopId;
	private String arrivalBusStopName;
	private String arrivalTime;
	private Integer totalPrice;
	private Integer price;
	private Integer totalSeats;
	private String fullName;
	private String tel;
	private String busFullName;
	private Integer reservedSeats;
	private String seatName;
	private List<String> seatNames;
	@Override
    public String toString() {
        return seatName;
    }
	public Integer getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(Integer reservationNo) {
		this.reservationNo = reservationNo;
	}
	public Date getReservationDatetime() {
		return reservationDatetime;
	}
	public void setReservationDatetime(Date reservationDatetime) {
		this.reservationDatetime = reservationDatetime;
	}
	public Integer getRouteId() {
		return routeId;
	}
	public void setRouteId(Integer routeId) {
		this.routeId = routeId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getBusId() {
		return busId;
	}
	public void setBusId(Integer busId) {
		this.busId = busId;
	}
	public Integer getDepartureBusStopId() {
		return departureBusStopId;
	}
	public void setDepartureBusStopId(Integer departureBusStopId) {
		this.departureBusStopId = departureBusStopId;
	}
	public String getDepartureBusStopName() {
		return departureBusStopName;
	}
	public void setDepartureBusStopName(String departureBusStopName) {
		this.departureBusStopName = departureBusStopName;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public Integer getArrivalBusStopId() {
		return arrivalBusStopId;
	}
	public void setArrivalBusStopId(Integer arrivalBusStopId) {
		this.arrivalBusStopId = arrivalBusStopId;
	}
	public String getArrivalBusStopName() {
		return arrivalBusStopName;
	}
	public void setArrivalBusStopName(String arrivalBusStopName) {
		this.arrivalBusStopName = arrivalBusStopName;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getTotalSeats() {
		return totalSeats;
	}
	public void setTotalSeats(Integer totalSeats) {
		this.totalSeats = totalSeats;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBusFullName() {
		return busFullName;
	}
	public void setBusFullName(String busFullName) {
		this.busFullName = busFullName;
	}
	public Integer getReservedSeats() {
		return reservedSeats;
	}
	public void setReservedSeats(Integer reservedSeats) {
		this.reservedSeats = reservedSeats;
	}
	public String getSeatName() {
		return seatName;
	}
	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}
	public List<String> getSeatNames() {
		return seatNames;
	}
	public void setSeatNames(List<String> seatNames) {
		this.seatNames = seatNames;
	}
}