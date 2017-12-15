package com.event.dao;

import java.util.List;

import com.sport.model.Game;
import com.sport.model.Matchday;

public interface MatchdayDao{
  
	public Matchday findById(int id);
	
	public List<Matchday> findAll();
	
	public List<Game> getGames(int matchdayid);
}
