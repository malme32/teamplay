package com.event.configuration;

import java.util.Properties;

import javax.sql.DataSource;
 
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.phonebook.service.MyProperty;
/*@PropertySource(value = { "classpath:application.properties" })*/

@Configuration
@EnableTransactionManagement
@ComponentScan({ "com.event.configuration"})
//@EnableCaching
public class HibernateConfiguration {
 
    @Autowired
    private Environment environment;

    @Autowired
    private MyProperty myProperty;
    
    
    @Bean	
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setPackagesToScan(new String[] { "com.event.model","com.phonebook.model","com.sport.model" ,"com.general.model" });
        sessionFactory.setHibernateProperties(hibernateProperties());
        return sessionFactory;
     }
     
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl(myProperty.getDbUrl());

     //   dataSource.setUrl("jdbc:mysql://localhost:3306/test?useUnicode=yes&characterEncoding=UTF-8");
      //  dataSource.setUrl("jdbc:mysql://aa90m04kh6jwab.cae7msh7iwae.eu-west-2.rds.amazonaws.com:3306/test?useUnicode=yes&characterEncoding=UTF-8");
        
        dataSource.setUsername(myProperty.getDbUsername());
        
        dataSource.setPassword(myProperty.getDbPassword());
       
        return dataSource;
    }
     
    private Properties hibernateProperties() {
        Properties properties = new Properties();
        //properties.put("hibernate.dialect","innodb");

        properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        properties.put("hibernate.show_sql", true);
        properties.put("hibernate.format_sql", false);
        properties.put("hibernate.hbm2ddl.auto", "update");
        properties.put("log4j.logger.org.hibernate", "info");
 

        return properties;        
    }
     
    @Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory s) {
       HibernateTransactionManager txManager = new HibernateTransactionManager();
       txManager.setSessionFactory(s);
       return txManager;
    }
    
/*    @Bean(name = "springCM")
    public CacheManager cacheManager() {
        return new ConcurrentMapCacheManager("entities");
    }*/
}