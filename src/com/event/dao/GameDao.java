package com.event.dao;

import java.util.List;

import com.sport.model.Game;

public interface GameDao{
  
	public Game findById(int id);
	
	public List<Game> findAll();
	
}
