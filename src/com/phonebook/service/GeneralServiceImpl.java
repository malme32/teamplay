package com.phonebook.service;

import java.awt.Dimension;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

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


	@Override
	public void compressImgSave(CommonsMultipartFile file,String imagepath, String extension, int width, int height) {
		// TODO Auto-generated method stub
	
		byte barr[]=file.getBytes();
        ByteArrayInputStream bais = new ByteArrayInputStream(barr);
        BufferedImage resizeMe;
		try {
			resizeMe = ImageIO.read(bais);
	        Dimension newMaxSize = new Dimension(width, height);
	        BufferedImage resizedImg = Scalr.resize(resizeMe, Method.QUALITY, newMaxSize.width, newMaxSize.height);
	        
	        BufferedOutputStream bout1=new BufferedOutputStream(  
	                 new FileOutputStream(imagepath));  
	        
	        ImageIO.write(resizedImg, extension, bout1);
	    
	        bout1.flush();  
	        bout1.close(); 
	        System.out.println("EXTRA - Compressed image: "+imagepath+extension+" saved!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	        System.out.println("EXTRA - ERROR in saving compressed image: "+imagepath+extension);
	        System.out.println(e.getMessage());
		}
 
	}

}
