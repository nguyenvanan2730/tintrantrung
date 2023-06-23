package vn.com.vti.bus.backend.form;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RouteSearchForm {
	
	@NotNull
	private Integer routeId;
	
	@NotBlank
	private String date;
	
}