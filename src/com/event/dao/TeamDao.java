package com.event.dao;

import java.util.List;

import com.phonebook.model.Contact;
import com.sport.model.Champion;
import com.sport.model.Game;
import com.sport.model.Matchday;
import com.sport.model.Standing;
import com.sport.model.Team;
public interface TeamDao{
  
	public Team findById(int id);
	

	
	public List<Team> findAll();



	public List<Game> findGames(int teamid);



	public List<Standing> findStandings(int teamid);



	public List<Contact> findPlayers(int teamid);


	

}
