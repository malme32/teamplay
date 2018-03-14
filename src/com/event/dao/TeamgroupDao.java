package com.event.dao;

import java.util.List;

import com.sport.model.Game;
import com.sport.model.Matchday;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

public interface TeamgroupDao{
  
	public Teamgroup findById(int id);
	
	public List<Teamgroup> findAll();
	
	public  List<Matchday> getMatchdays(int matchdayid);
	
	public  List<Standing> getStandings(int teamgroupid);
	
	public  List<Game> getGames(Team team,Teamgroup teamgroup);

	public List<Game> getAllGames(Teamgroup teamgroup);
}
