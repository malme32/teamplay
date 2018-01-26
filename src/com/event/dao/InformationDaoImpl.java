package com.event.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.general.model.Information;
import com.general.model.Message;
import com.sport.model.Team;

@Repository("informationDao")

//@Cacheable(value = "entities", cacheManager = "springCM")
public class InformationDaoImpl extends AbstractDao implements InformationDao{
	
    @Autowired
    private SessionFactory sessionFactory;
    
	@Override
	public Information findById(int id) {
		// TODO Auto-generated method stub
		return (Information)getSession().get(Information.class, id);
	}
	

	@Override
	public List<Information> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Information> list = getSession().createQuery("FROM Information").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Information> getTeamInformations(Team team, Integer lastid) {
		// TODO Auto-generated method stub
		List<Information> list= null;

		Session session = sessionFactory.openSession();
		list = session.createQuery("FROM Information I where I.id > :lastid AND I.team= :team order by I.id").setParameter("team", team).setParameter("lastid", lastid).list(); 
		session.close();
		return list;
	}



}
