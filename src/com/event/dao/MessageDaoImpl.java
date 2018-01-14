package com.event.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.general.model.Message;
import com.phonebook.model.Contact;


@Repository("messageDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class MessageDaoImpl extends AbstractDao implements MessageDao{
	
    @Autowired
    private SessionFactory sessionFactory;
    
	@Override
	public Message findById(int id) {
		// TODO Auto-generated method stub
		return (Message)getSession().get(Message.class, id);
	}

	@Override
	public List<Message> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Message> list = getSession().createQuery("FROM Message").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getMessages(Contact contact, Contact friend, Integer lastid) {
		 List<Message> list= null;
		 if(lastid!=null)  
		 {
			 	Session session = sessionFactory.openSession();
			  list = session.createQuery("FROM Message M where M.id > :lastid AND ((M.contact= :contact AND M.receiver= :friend) OR ( M.contact= :friend AND M.receiver= :contact )) ").setParameter("contact", contact).setParameter("friend", friend).setParameter("lastid", lastid).list(); 
			  session.close();
		 }
		 else
		  list = getSession().createQuery("FROM Message M where (M.contact= :contact AND M.receiver= :friend) OR ( M.contact= :friend AND M.receiver= :contact ) order by M.id DESC").setMaxResults(30).setParameter("contact", contact).setParameter("friend", friend).list(); 
		 System.out.println("XEXEXEXE"+list.size());
		//List<Message> list = getSession().createQuery("FROM Message").list(); 

		return list;
	}




}
