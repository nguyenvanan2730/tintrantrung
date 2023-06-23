package vn.com.vti.bus.frontend.form;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchForm {
	
	@NotNull
	private Integer year;
	@NotNull
	private Integer month;
	@NotNull
	private Integer day;
	
	private Integer departureBusStopId;
	
	private Integer arrivalBusStopId;
	
	private List<Integer> busStoplist = new ArrayList<>();

}