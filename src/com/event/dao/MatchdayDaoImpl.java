package com.event.dao;

import java.util.List;



import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.sport.model.Game;
import com.sport.model.Matchday;

@Repository("matchdayDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class MatchdayDaoImpl extends AbstractDao implements MatchdayDao{
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
	
	@Override
	public Matchday findById(int id) {
		// TODO Auto-generated method stub
		return (Matchday)getSession().get(Matchday.class, id);
	}

	@Override
	public List<Matchday> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Matchday> list = getSession().createQuery("FROM Matchday").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public List<Game> getGames(int matchdayid){
		//sessionFactory.openSession().get(Matchday.class, matchdayid);
		Matchday matchday = getSession().get(Matchday.class, matchdayid);
		Hibernate.initialize(matchday.getGames());
		return matchday.getGames();
	}
}
