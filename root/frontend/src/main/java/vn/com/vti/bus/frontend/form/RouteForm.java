package vn.com.vti.bus.frontend.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RouteForm {
	private Integer routeId;
	
	@NotNull
	private Integer year;
	
	@NotNull
	@Min(1)
	@Max(12)
	private Integer month;
	
	@NotNull
	@Min(1)
	@Max(31)
	private Integer day;
	
	
	private Integer departureBusStopId;
	
	private String departureTime;
	
	private Integer arrivalBusStopId;
	
	private String arrivalTime;
	
	private Date runStartDate;

	private Date runEndDate;
	
	private Integer busId;
	
	private Integer price;
	
	private List<Integer> busStoplist = new ArrayList<>();
	
	private List<Integer> busList = new ArrayList<>();


}