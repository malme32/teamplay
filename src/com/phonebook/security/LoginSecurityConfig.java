package com.phonebook.security;



import java.util.concurrent.TimeUnit;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.ObjectPostProcessor;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.authentication.rememberme.RememberMeAuthenticationFilter;
import org.springframework.security.web.authentication.rememberme.TokenBasedRememberMeServices;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;


@Configuration
@ComponentScan(basePackages={"com.event","com.phonebook"})
@EnableGlobalMethodSecurity(securedEnabled = true)
@EnableWebSecurity
public class LoginSecurityConfig extends WebSecurityConfigurerAdapter {

	protected static final RememberMeAuthenticationFilter PersistentTokenBasedRememberMeServices = null;

	@Autowired
	@Qualifier("userDetailsService")
	UserDetailsService userDetailsService;
	
	@Autowired 
	DataSource dataSource;
//	@Autowired
//	public void configureGlobal(AuthenticationManagerBuilder authenticationMgr) throws Exception {
//		authenticationMgr.inMemoryAuthentication()
//			.withUser("journaldev")
//			.password("jd@123")
//			.authorities("ROLE_USER");
//	}
//	
	
	
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}

	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.addFilterAfter(new SecurityFilter(), BasicAuthenticationFilter.class);
		
		http.authorizeRequests()
		 .antMatchers("/**")
         .permitAll();
         
		/*http.authorizeRequests()
		.antMatchers("/main").access("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
		 .antMatchers("/resources/**")
         .permitAll()
			.and()
				.formLogin().loginPage("/loginPage")
				.defaultSuccessUrl("/soccer#!/home")
				.failureUrl("/loginPage?error")
				.usernameParameter("username").passwordParameter("password")				
			.and()
				.logout().logoutSuccessUrl("/soccer#!/home")
				.and()
				
				
				.rememberMe().key("remember-me").rememberMeParameter("remember-me").rememberMeServices(rememberMeServices() );*/
		http.csrf().disable(); /// this should normally be removed  to allow post to have csrf tokens
		
	}
	
	  @Bean()
	    public PersistentTokenBasedRememberMeServices rememberMeServices() {
		  PersistentTokenBasedRememberMeServices rememberMeServices = new PersistentTokenBasedRememberMeServices("remember-me", userDetailsService,persistentTokenRepository());
	        rememberMeServices.setAlwaysRemember(true);
	        rememberMeServices.setTokenValiditySeconds(115522211);
	       
	        return rememberMeServices;
	    }
	@Bean PersistentTokenRepository persistentTokenRepository()
	{
		final JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(dataSource);
		return jdbcTokenRepository;
	}
	@Bean
	public PasswordEncoder passwordEncoder(){
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
	
	@Bean
	@Override
	public AuthenticationManager authenticationManager() throws Exception {
	return super.authenticationManagerBean();
	}
}