package vn.com.vti.bus.backend.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RouteForm {
	
	@NotNull
	private Integer departureBusStopId;
	
	@NotBlank
	@Pattern(regexp = "^(?:[01]\\d|2[0-3]):[0-5]\\d$", message = "{error.timeFormat}")
	private String departureTime;
	
	@NotNull
	private Integer arrivalBusStopId;
	
	@NotBlank
	@Pattern(regexp = "^(?:[01]\\d|2[0-3]):[0-5]\\d$", message = "{error.timeFormat}")
	private String arrivalTime;
	
	@NotNull
	@DateTimeFormat(pattern = "yyyyMMdd")
//	@RunStartDateAfterToday(message = "{error.runStartDatePast}")
	private Date runStartDate;
	
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date runEndDate;
	
	@NotNull
	private Integer busId;
	
	@NotNull
	private Integer price;
	
	private List<Integer> busStoplist = new ArrayList<>();
	
	private List<Integer> busList = new ArrayList<>();


}