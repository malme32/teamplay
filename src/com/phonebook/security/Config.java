package com.phonebook.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.concurrent.ConcurrentTaskScheduler;
import org.springframework.session.jdbc.config.annotation.web.http.EnableJdbcHttpSession;
import org.springframework.transaction.PlatformTransactionManager;
@Configuration
@ComponentScan({ "com.event.configuration"})
@EnableJdbcHttpSession 
public class Config {

	@Autowired DataSource dataSource;
	
/*	@Bean
	public EmbeddedDatabase dataSource() {
		return new EmbeddedDatabaseBuilder() 
				.setType(EmbeddedDatabaseType.H2)
				.addScript("org/springframework/session/jdbc/schema-h2.sql").build();
	}
*/
	@Bean
	public PlatformTransactionManager transactionManager(DataSource dataSource) {
		return new DataSourceTransactionManager(dataSource); 
	}
	 @Bean
	    public TaskScheduler taskScheduler() {
	        return new ConcurrentTaskScheduler();
	    }
}