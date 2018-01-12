package com.event.dao;

import java.util.Date;
import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.sport.model.Game;

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
		   List<Game> list = getSession().createQuery("FROM Game where (Score1=null OR Score2=null) AND Date > :curdate ORDER BY date asc").setParameter("curdate", new Date()).setMaxResults(10).list(); 
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public List<Game> getLastResults() {
		   @SuppressWarnings("unchecked")
		   List<Game> list = getSession().createQuery("FROM Game where (Score1!=null AND Score2!=null) AND Date < :curdate ORDER BY date desc").setParameter("curdate", new Date()).setMaxResults(10).list(); 
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

}
