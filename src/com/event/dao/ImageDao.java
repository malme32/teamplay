package com.event.dao;

import java.util.List;

import com.sport.model.Image;

public interface ImageDao{
  
	public Image findById(int id);

	public List<Image> findAll();

}
