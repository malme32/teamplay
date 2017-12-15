package com.event.configuration;


import java.util.HashMap;
import java.util.Map;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import org.springframework.web.servlet.config.annotation.EnableWebMvc;
 

//@ComponentScan(basePackages = "com.phonebook")


/*@ComponentScan(basePackages = "com.phonebook")*/
/*@ImportResource("classpath:/spring.xml")*/

@Configuration
@EnableWebMvc
@ComponentScan(basePackages={"com.event","com.phonebook","com.sport"})
public class AppConfig{
 
	@Bean
	public StringBuilder stringBuilder() {
		return new StringBuilder();
	}
	
	@Bean
	public Map<Character, Character> greeklishMap(){
		HashMap<Character, Character> hashMap = new HashMap<Character, Character>();
		hashMap.put('�', 'a');
		hashMap.put('�', 'b');
		hashMap.put('�', 'g');
		hashMap.put('�', 'd');
		hashMap.put('�', 'e');
		hashMap.put('�', 'z');
		hashMap.put('�', 'i');
		hashMap.put('�', '8');
		hashMap.put('�', 'i');
		hashMap.put('�', 'k');
		hashMap.put('�', 'l');
		hashMap.put('�', 'm');
		hashMap.put('�', 'n');
		hashMap.put('�', '3');
		hashMap.put('�', 'o');
		hashMap.put('�', 'p');
		hashMap.put('�', 'r');
		hashMap.put('�', 's');
		hashMap.put('�', 't');
		hashMap.put('�', 'y');
		hashMap.put('�', 'f');
		hashMap.put('�', 'x');
		hashMap.put('�', 'p');
		hashMap.put('�', 'w');

	   return hashMap;
   }
	


}