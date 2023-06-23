package vn.com.vti.bus.frontend.form;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class RegisterForm {
	@NotBlank
    private String firstName;

	@NotBlank
    private String lastName;
    
	@NotBlank
	@Size(max = 13, message = "{error.telSize}")
    private String tel;

	@NotBlank
    @Email(message = "有効なEメールアドレスを入力してください。")
    private String email;

    @NotNull
    @Size(min = 8, message = "{error.passwordSize}")
    private String password;
    
    private String matchingPassword;

}
