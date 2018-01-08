package com.event.dao;

import java.util.List;


import com.sport.model.Playoff;

import com.sport.model.Team;
public interface PlayoffDao{
  
	public Playoff findById(int id);
	

	
	public List<Playoff> findAll();




	

}
