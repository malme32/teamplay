package com.event.dao;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.sport.model.Standing;



@Repository("standingDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class StandingDaoImpl extends AbstractDao implements StandingDao{

	@Override
	public Standing findById(int id) {
		// TODO Auto-generated method stub
		return (Standing)getSession().get(Standing.class, id);
	}

	@Override
	public List<Standing> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Standing> list = getSession().createQuery("FROM Standing").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}

}
