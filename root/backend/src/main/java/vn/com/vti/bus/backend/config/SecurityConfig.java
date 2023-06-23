package vn.com.vti.bus.backend.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import vn.com.vti.bus.backend.security.ManagerAuthenticationProvider;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private ManagerAuthenticationProvider authenticationProvider;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider);
	}


	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();

		http.authorizeRequests()
		.antMatchers("/login","/cart/*","/resources/css/*","/resources/js/*","/resources/imgs/*").permitAll()
		.anyRequest()
		.authenticated();

		http.formLogin()
		.loginPage("/login")
		.loginProcessingUrl("/auth")
		.defaultSuccessUrl("/route/list", true)
		;

		http.logout()
		.logoutUrl("/logout")
		.logoutSuccessUrl("/login");

	}

}
