package vn.com.vti.bus.frontend.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RouteSearchForm {
	private Integer routeId;
	
	@NotBlank
	private String date;
	
	private Integer departureBusStopId;
	
	private String departureTime;
	
	private String departureBusStopName;
	
	private Integer arrivalBusStopId;
	
	private String arrivalBusStopName;
	
	private String arrivalTime;
	
	private Date runStartDate;

	private Date runEndDate;
	
	private Integer busId;
	
	private Integer price;
	
	private List<Integer> busStoplist = new ArrayList<>();
	
	private List<Integer> busList = new ArrayList<>();


}