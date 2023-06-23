package vn.com.vti.bus.backend.form;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class BusForm {
	private Integer busId;
	
	@NotNull
	@Min(1)
	@Max(999)
	private Integer rowNum;
	@NotNull
	@Min(1)
	private Integer columnNum;
	@NotBlank
	private String numberPlace;
	@NotBlank
	@Pattern(regexp = "^\\d\\d$",message = "{error.num2digit}")
	private String numberDivision;
	@NotBlank
	@Pattern(regexp = "^[\\u3041-\\u3096]$",message = "{error.hiragana1digit}")
	private String numberKana;
	@NotBlank
	@Pattern(regexp = "^\\d\\d$",message = "{error.num2digit}")
	private String numberFirstHalf;
	@NotBlank
	@Pattern(regexp = "^\\d\\d$",message = "{error.num2digit}")
	private String numberLatterHalf;
}
