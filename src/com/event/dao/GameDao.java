package com.event.dao;

import java.util.List;

import com.sport.model.Champion;
import com.sport.model.Game;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

public interface GameDao{
  
	public Game findById(int id);
	
	public List<Game> findAll();
	
	public List<Game> getUpcomingGames();
	
	public List<Game> getLastResults();

	public List<Game> getCalendarGames();

	List<Game> getUpcomingTeamGames(Team team);

	public List<Game> getUpcomingTeamgroupGames(Teamgroup teamgroup);

	public List<Game> getUpcomingChampionGames(Champion champion);
}
