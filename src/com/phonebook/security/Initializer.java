package com.phonebook.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.session.jdbc.config.annotation.web.http.EnableJdbcHttpSession;
import org.springframework.session.web.context.AbstractHttpSessionApplicationInitializer;


/*@EnableRedisHttpSession
*/
@Configuration
public class Initializer extends AbstractHttpSessionApplicationInitializer {
  /*  @Bean
    public JedisConnectionFactory connectionFactory() {
        return new JedisConnectionFactory();
    }*/
	
	public Initializer() {
		super(Config.class); 
	}
}