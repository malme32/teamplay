package com.event.dao;

import java.util.List;

import com.sport.model.Standing;



public interface StandingDao{
  
	public Standing findById(int id);
	
	public List<Standing> findAll();
	
}
