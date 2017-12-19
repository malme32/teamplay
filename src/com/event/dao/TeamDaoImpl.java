package com.event.dao;

import java.util.ArrayList;
import java.util.List;


import org.hibernate.Hibernate;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.phonebook.model.Contact;
import com.sport.model.Champion;
import com.sport.model.Game;
import com.sport.model.Matchday;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

@Repository("teamDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class TeamDaoImpl extends AbstractDao implements TeamDao{
	@Override
	public Team findById(int id) {
		// TODO Auto-generated method stub
		return (Team)getSession().get(Team.class, id);
	}

	@Override
	public List<Team> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Team> list = getSession().createQuery("FROM Team").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public List<Game> findGames(int teamid) {
		// TODO Auto-generated method stub
		
		
		Team team =this.findById(teamid);
		Hibernate.initialize(team.getTeam1games());
		Hibernate.initialize(team.getTeam2games());
		List<Game> list = new ArrayList<Game>();
		for(Game game: team.getTeam1games())	
			list.add(game);
		for(Game game: team.getTeam2games())	
			list.add(game);
		return list;
	}

	@Override
	public List<Standing> findStandings(int teamid) {
		// TODO Auto-generated method stub
		Team team =this.findById(teamid);
		Hibernate.initialize(team.getStandings());
		for(Standing standing:team.getStandings())
			standing.setChampion(standing.getTeamgroup().getChampion());
		return team.getStandings();
	}

	@Override
	public List<Contact> findPlayers(int teamid) {
		// TODO Auto-generated method stub
		Team team =this.findById(teamid);
		Hibernate.initialize(team.getPlayers());
		return team.getPlayers();
	}





}
