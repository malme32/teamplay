package com.event.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.general.model.Information;
import com.general.model.Message;
import com.phonebook.model.Contact;
import com.sport.model.MySession;
import com.sport.model.Team;

@Repository("mySessionDao")

//@Cacheable(value = "entities", cacheManager = "springCM")
public class MySessionDaoImpl extends AbstractDao implements MySessionDao{
	
    @Autowired
    private SessionFactory sessionFactory;
    
	@Override
	public MySession findById(int id) {
		// TODO Auto-generated method stub
		return (MySession)getSession().get(MySession.class, id);
	}
	

	@Override
	public List<MySession> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<MySession> list = getSession().createQuery("FROM MySession").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}


	@Override
	public Contact getContactByToken(String token) {
		// TODO Auto-generated method stub
		System.out.println("Getting contact from token: "+token);
		 @SuppressWarnings("unchecked")
		 List<MySession> list = getSession().createQuery("FROM MySession S where S.token = :token").setParameter("token",token ).list();
		if(list.isEmpty())
			return null;
		 System.out.println("Token Contact: "+list.get(0).getContact());

		 return list.get(0).getContact();
	}


	@Override
	public MySession findSessionByToken(String token) {
		System.out.println("Getting contact from token: "+token);
		 @SuppressWarnings("unchecked")
		 List<MySession> list = getSession().createQuery("FROM MySession S where S.token = :token").setParameter("token",token ).list();
		if(list.isEmpty())
			return null;
		 System.out.println("Token Contact: "+list.get(0).getContact());

		 return list.get(0);
	}


/*	@SuppressWarnings("unchecked")
	@Override
	public List<MySession> getTeamInformations(Team team, Integer lastid) {
		// TODO Auto-generated method stub
		List<Information> list= null;

		Session session = sessionFactory.openSession();
		list = session.createQuery("FROM Information I where I.id > :lastid AND I.team= :team order by I.id").setParameter("team", team).setParameter("lastid", lastid).list(); 
		session.close();
		return list;
	}

*/

}
