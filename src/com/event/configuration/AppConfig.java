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
		hashMap.put('á', 'a');
		hashMap.put('â', 'b');
		hashMap.put('ã', 'g');
		hashMap.put('ä', 'd');
		hashMap.put('å', 'e');
		hashMap.put('æ', 'z');
		hashMap.put('ç', 'i');
		hashMap.put('è', '8');
		hashMap.put('é', 'i');
		hashMap.put('ê', 'k');
		hashMap.put('ë', 'l');
		hashMap.put('ì', 'm');
		hashMap.put('í', 'n');
		hashMap.put('î', '3');
		hashMap.put('ï', 'o');
		hashMap.put('ð', 'p');
		hashMap.put('ñ', 'r');
		hashMap.put('ó', 's');
		hashMap.put('ô', 't');
		hashMap.put('õ', 'y');
		hashMap.put('ö', 'f');
		hashMap.put('÷', 'x');
		hashMap.put('ø', 'p');
		hashMap.put('ù', 'w');

	   return hashMap;
   }
	


}