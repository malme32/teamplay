package com.event.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.general.model.Message;
import com.phonebook.model.Contact;


@Repository("messageDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class MessageDaoImpl extends AbstractDao implements MessageDao{
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

	@Override
	public List<Message> getMessages(Contact contact) {
		   System.out.println(contact.getName()+"xaxaxa");
		   @SuppressWarnings("unchecked")
		  List<Message> list = getSession().createQuery("FROM Message M where M.contact= :contact OR M.receiver= :contact ").setParameter("contact", contact).list(); 
		   //List<Message> list = getSession().createQuery("FROM Message").list(); 

		return list;
	}




}
