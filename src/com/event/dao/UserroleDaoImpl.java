package com.event.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import org.hibernate.Hibernate;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.phonebook.model.Contact;
import com.phonebook.model.Userrole;
import com.sport.model.Champion;
import com.sport.model.Game;
import com.sport.model.Matchday;
import com.sport.model.Playoff;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

@Repository("userroleDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class UserroleDaoImpl extends AbstractDao implements UserroleDao{
	@Override
	public Userrole findById(int id) {
		// TODO Auto-generated method stub
		return (Userrole)getSession().get(Userrole.class, id);
	}

	@Override
	public List<Userrole> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Userrole> list = getSession().createQuery("FROM Userrole").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public boolean hasRole(Contact contact, String role) {
		// TODO Auto-generated method stub
		   @SuppressWarnings("unchecked")
		   List<Userrole> list = getSession().createQuery("FROM Userrole U where U.contact = :contact and U.role = :role").setParameter("contact", contact).setParameter("role", role).list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return !list.isEmpty();
	}
	

}
