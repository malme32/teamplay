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
import com.sport.model.Playoff;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

@Repository("playoffDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class PlayoffDaoImpl extends AbstractDao implements PlayoffDao{
	@Override
	public Playoff findById(int id) {
		// TODO Auto-generated method stub
		return (Playoff)getSession().get(Playoff.class, id);
	}

	@Override
	public List<Playoff> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Playoff> list = getSession().createQuery("FROM Playoff").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}



}
