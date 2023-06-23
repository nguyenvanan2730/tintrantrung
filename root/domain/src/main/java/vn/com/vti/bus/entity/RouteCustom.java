package vn.com.vti.bus.entity;

import java.sql.Timestamp;

public class RouteCustom {
    private Integer routeId;
    
    private Integer departureBusStopId;
    
    private String departureBusStopName;
    
    private String departureTime;
    
    private Integer arrivalBusStopId;
    
    private String arrivalBusStopName;
    
    private String arrivalTime;
    
    private Timestamp runStartDate;
    
    private Timestamp runEndDate;
    
    private Integer price;
    
    private Integer busId;
    
    private Integer columnNum;
    
    private String seatName;
    
    private Integer totalSeat;
    
    private Integer availableSeats;
    
    private Integer rowNumber;

	public Integer getRouteId() {
		return routeId;
	}

	public void setRouteId(Integer routeId) {
		this.routeId = routeId;
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

	public Timestamp getRunStartDate() {
		return runStartDate;
	}

	public void setRunStartDate(Timestamp runStartDate) {
		this.runStartDate = runStartDate;
	}

	public Timestamp getRunEndDate() {
		return runEndDate;
	}

	public void setRunEndDate(Timestamp runEndDate) {
		this.runEndDate = runEndDate;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getBusId() {
		return busId;
	}

	public void setBusId(Integer busId) {
		this.busId = busId;
	}

	public Integer getColumnNum() {
		return columnNum;
	}

	public void setColumnNum(Integer columnNum) {
		this.columnNum = columnNum;
	}

	public String getSeatName() {
		return seatName;
	}

	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}

	public Integer getTotalSeat() {
		return totalSeat;
	}

	public void setTotalSeat(Integer totalSeat) {
		this.totalSeat = totalSeat;
	}

	public Integer getAvailableSeats() {
		return availableSeats;
	}

	public void setAvailableSeats(Integer availableSeats) {
		this.availableSeats = availableSeats;
	}

	public Integer getRowNumber() {
		return rowNumber;
	}

	public void setRowNumber(Integer rowNumber) {
		this.rowNumber = rowNumber;
	}
}