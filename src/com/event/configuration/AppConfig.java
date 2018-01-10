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
		hashMap.put('α', 'a');
		hashMap.put('β', 'b');
		hashMap.put('γ', 'g');
		hashMap.put('δ', 'd');
		hashMap.put('ε', 'e');
		hashMap.put('ζ', 'z');
		hashMap.put('η', 'i');
		hashMap.put('θ', '8');
		hashMap.put('ι', 'i');
		hashMap.put('κ', 'k');
		hashMap.put('λ', 'l');
		hashMap.put('μ', 'm');
		hashMap.put('ν', 'n');
		hashMap.put('ξ', '3');
		hashMap.put('ο', 'o');
		hashMap.put('π', 'p');
		hashMap.put('ρ', 'r');
		hashMap.put('σ', 's');
		hashMap.put('τ', 't');
		hashMap.put('υ', 'y');
		hashMap.put('φ', 'f');
		hashMap.put('χ', 'x');
		hashMap.put('π', 'p');
		hashMap.put('ω', 'w');

	   return hashMap;
   }
	


}