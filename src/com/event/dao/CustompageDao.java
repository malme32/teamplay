package com.event.dao;

import java.util.List;

import com.sport.model.Custompage;



public interface CustompageDao{
  
	public Custompage findById(int id);
	
	public List<Custompage> findAll();
	
}
