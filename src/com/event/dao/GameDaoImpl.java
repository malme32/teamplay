package com.event.dao;

import java.util.Date;
import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.sport.model.Champion;
import com.sport.model.Game;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

@Repository("gameDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class GameDaoImpl extends AbstractDao implements GameDao{

	@Override
	public Game findById(int id) {
		// TODO Auto-generated method stub
		return (Game)getSession().get(Game.class, id);
	}

	@Override
	public List<Game> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Game> list = getSession().createQuery("FROM Game").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public List<Game> getUpcomingGames() {
		   @SuppressWarnings("unchecked")
		   List<Game> list = getSession().createQuery("select G FROM Game G inner join Champion C on G.champion = C.id where C.enabled = 1 AND (G.score1=null OR G.score2=null) AND G.date > :curdate ORDER BY G.date asc").setParameter("curdate", new Date()).setMaxResults(10).list(); 
		// TODO Auto-generated method stub
		return list;
	}
	@Override
	public List<Game> getUpcomingTeamGames(Team team) {
		   @SuppressWarnings("unchecked")
		   List<Game> list = getSession().createQuery("FROM Game G where (G.team1 = :team OR G.team2  =:team) AND G.date > :curdate ORDER BY date asc").setParameter("curdate", new Date()).setParameter("team", team).setMaxResults(10).list(); 
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public List<Game> getLastResults() {
		   @SuppressWarnings("unchecked")
		   List<Game> list = getSession().createQuery("select G FROM Game G inner join Champion C on G.champion = C.id where C.enabled = 1 AND (G.score1!=null AND G.score2!=null) AND G.date < :curdate ORDER BY G.date desc").setParameter("curdate", new Date()).setMaxResults(10).list(); 
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public List<Game> getCalendarGames() {
		// TODO Auto-generated method stub
		
		   @SuppressWarnings("unchecked")
	
		   List<Game> list = getSession().createQuery("FROM Game where Date > :curdate ORDER BY date desc").setParameter("curdate", new Date()).list(); 
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public List<Game> getUpcomingTeamgroupGames(Teamgroup teamgroup) {
		   @SuppressWarnings("unchecked")
		//   List<Game> list = getSession().createQuery("FROM Game G inner join Matchday M where (M.teamgroup = :teamgroup) AND G.date > :curdate ORDER BY date asc").setParameter("curdate", new Date()).setParameter("teamgroup", teamgroup).setMaxResults(8).list(); 
		   
		   
		     List<Game> list = getSession().createQuery("select G FROM Game G inner join Matchday M on M.id = G.matchday where M.teamgroup = :teamgroup AND G.date > :curdate ORDER BY date asc").setParameter("curdate", new Date()).setParameter("teamgroup", teamgroup).setMaxResults(8).list(); 
		   											//	select g from Game g inner join Matchday m on g.matchday = m.id where m.teamgroup= :teamgroup
		   return list;
	}

	@Override
	public List<Game> getUpcomingChampionGames(Champion champion) {
		  
	   @SuppressWarnings("unchecked")	
	   List<Game> list = getSession().createQuery("select G FROM Game G  where G.champion = :champion AND G.date > :curdate ORDER BY date asc").setParameter("curdate", new Date()).setParameter("champion", champion).setMaxResults(8).list(); 

	//List<Game> list = getSession().createQuery("select G FROM Game G, Teamgroup T, Matchday M where M.id = G.matchday AND M.teamgroup = T.id AND T.champion = :champion AND G.date > :curdate ORDER BY date asc").setParameter("curdate", new Date()).setParameter("champion", champion).setMaxResults(8).list(); 
	   											//	select g from Game g inner join Matchday m on g.matchday = m.id where m.teamgroup= :teamgroup
	   return list;
	}

}
