package com.event.dao;

import java.util.List;

import com.sport.model.Game;
import com.sport.model.Team;

public interface GameDao{
  
	public Game findById(int id);
	
	public List<Game> findAll();
	
	public List<Game> getUpcomingGames();
	
	public List<Game> getLastResults();

	public List<Game> getCalendarGames();

	List<Game> getUpcomingTeamGames(Team team);
}
