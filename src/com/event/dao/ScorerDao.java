package com.event.dao;

import java.util.List;

import com.sport.model.Game;
import com.sport.model.Matchday;
import com.sport.model.Scorer;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

public interface ScorerDao{
  
	public Scorer findById(int id);
	
	public List<Scorer> findAll();
	
}
