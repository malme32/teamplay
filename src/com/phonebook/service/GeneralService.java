package com.phonebook.service;

import java.io.File;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public interface GeneralService {
	public String toGreekLish(String str);
	
	public void compressImgSave(CommonsMultipartFile file, String imagepath, String extension, int width, int height);
}
