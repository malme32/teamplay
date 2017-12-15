package com.event.dao;

import java.util.List;



import org.hibernate.Hibernate;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.event.model.Event;
import com.sport.model.Champion;
import com.sport.model.Teamgroup;

@Repository("championDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class ChampionDaoImpl extends AbstractDao implements ChampionDao{

	@Override
	public Champion findChampionsById(int id) {
		// TODO Auto-generated method stub
		return (Champion)getSession().get(Champion.class, id);
	}

	@Override
	public List<Champion> findAllChampions() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Champion> champions = getSession().createQuery("FROM Champion").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return champions;
	}

	@Override
	public List<Teamgroup> getTeamgroups(int championid) {
		// TODO Auto-generated method stub
		Champion champion = getSession().get(Champion.class, championid);
		Hibernate.initialize(champion.getTeamgroups());
		return champion.getTeamgroups();
	}

}
