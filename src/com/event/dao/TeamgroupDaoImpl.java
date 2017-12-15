package com.event.dao;

import java.util.List;



import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.sport.model.Game;
import com.sport.model.Matchday;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

@Repository("TeamgroupDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class TeamgroupDaoImpl extends AbstractDao implements TeamgroupDao{
	
	
    @Autowired
    private SessionFactory sessionFactory;
    
	@Override
	public Teamgroup findById(int id) {
		// TODO Auto-generated method stub
		return (Teamgroup)getSession().get(Teamgroup.class, id);
	}

	@Override
	public List<Teamgroup> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Teamgroup> list = getSession().createQuery("FROM Teamgroup").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}

	
	@Override
	public List<Matchday> getMatchdays(int matchdayid) {
		// TODO Auto-generated method stub
		Teamgroup teamgroup = getSession().get(Teamgroup.class, matchdayid);
		Hibernate.initialize(teamgroup.getMatchdays());
		for(Matchday matchday : teamgroup.getMatchdays())
			Hibernate.initialize(matchday.getGames());
		return teamgroup.getMatchdays();
	}

	@Override
	public List<Standing> getStandings(int teamgroupid) {
		Teamgroup teamgroup = getSession().get(Teamgroup.class, teamgroupid);
		Hibernate.initialize(teamgroup.getStandings());
		return teamgroup.getStandings();
	}

	@Override
	public List<Game> getGames(Team team,Teamgroup teamgroup) {
		//AND Matchday.teamgroup= :teamgroup  (Game.team1 = :team or Game.team2 = :team)    .setParameter("teamgroup", teamgroup)
		   
		   Session session = sessionFactory.openSession();
		   @SuppressWarnings("unchecked")
		   List<Game> list = session.createQuery("select g from Game g inner join Matchday m on g.matchday = m.id where (g.team1 = :team or g.team2 = :team) AND m.teamgroup= :teamgroup ").setParameter("teamgroup", teamgroup).setParameter("team", team).list(); 
		   session.close();
		return list;
	}
}
