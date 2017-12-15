package com.phonebook.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("generalService")
public class GeneralServiceImpl  implements GeneralService{


	@Autowired
	private StringBuilder stringBuilder;
	@Autowired
    private Map<Character, Character> greeklishMap;
    
    
/*	public void setStringBuilder(StringBuilder stringBuilder) {
		this.stringBuilder = stringBuilder;
	}*/
/*    public Map<Character, Character> getGreeklishMap() {
		return greeklishMap;
	}
	public void setGreeklishMap(Map<Character, Character> greeklishMap) {
		this.greeklishMap = greeklishMap;
	}
	*/
	
	@Override
	public String toGreekLish(String str) {

		// TODO Auto-generated method stub
		
		stringBuilder = new StringBuilder(str);
		
		
		  for (int i=0;i<stringBuilder.length();i++) {
			//  System.out.println(this.greeklishMap.get(tmpstr.charAt(i)));
			  Character a = this.greeklishMap.get(Character.toLowerCase(stringBuilder.charAt(i)));
			  if(a!=null)
				  stringBuilder.setCharAt(i,a );	
		  }
		return stringBuilder.toString();
	}

}
