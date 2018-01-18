package com.event.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
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
	public Message findByIdNewSession(int id) {
		// TODO Auto-generated method stub

	 	Session session = sessionFactory.openSession();
		Message message = session.get(Message.class, id);
		 session.close();
			return message; 
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
		 System.out.println("MESSAGELISTSIZE "+friend.getId()+" "+contact.getId());
		 if(lastid!=null)  
		 {
			 	Session session = sessionFactory.openSession();
			  list = session.createQuery("FROM Message M where M.id > :lastid AND ((M.contact= :contact AND M.receiver= :friend) OR ( M.contact= :friend AND M.receiver= :contact )) ").setParameter("contact", contact).setParameter("friend", friend).setParameter("lastid", lastid).list(); 
			  session.close();
		 }
		 else
		  list = getSession().createQuery("FROM Message M where (M.contact= :contact AND M.receiver= :friend) OR ( M.contact= :friend AND M.receiver= :contact ) order by M.id DESC").setMaxResults(30).setParameter("contact", contact).setParameter("friend", friend).list(); 
		 System.out.println("MESSAGELISTSIZE "+list.size());
		//List<Message> list = getSession().createQuery("FROM Message").list(); 

		return list;
	}
	@Transactional
	@Modifying
	@Override
	public void setSeenMessages(Contact contact, Contact sender) {
		// TODO Auto-generated method stub
	 	//Session session = sessionFactory.openSession();/*AND M.status!= :status  AND M.contact= :sender setParameter("sender", sender).*/
		getSession().createQuery("update Message M set  M.status= :status where (M.receiver= :contact AND M.contact= :sender AND M.status!= :status)").setParameter("contact", contact).setParameter("sender", sender).setParameter("status", "Seen").executeUpdate();
		//  session.close();
	}
	
	@Transactional
	@Modifying
	@Override
	public void setDeliveredMessages(Contact contact, Contact sender) {
		// TODO Auto-generated method stub
	 	//Session session = sessionFactory.openSession();/*AND M.status!= :status  AND M.contact= :sender setParameter("sender", sender).*/
		getSession().createQuery("update Message M set  M.status= :status where (M.receiver= :contact AND M.contact= :sender AND M.status= :status1)").setParameter("contact", contact).setParameter("sender", sender).setParameter("status", "Delivered").setParameter("status1", "Sent").executeUpdate();
		//  session.close();
	}
	
	@Transactional
	@Modifying
	@Override
	public void setAllDeliveredMessages(Contact contact) {
		// TODO Auto-generated method stub
	 	//Session session = sessionFactory.openSession();/*AND M.status!= :status  AND M.contact= :sender setParameter("sender", sender).*/
		getSession().createQuery("update Message M set  M.status= :status where (M.receiver= :contact AND M.status= :status1)").setParameter("contact", contact).setParameter("status", "Delivered").setParameter("status1", "Sent").executeUpdate();
		//  session.close();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getUnseenMessages(Contact contact, Integer lastid) {
		// TODO Auto-generated method stub
			List<Message> list= null;
	 		Session session = sessionFactory.openSession();
	 		list = session.createQuery("FROM Message M where M.id > :lastid AND M.receiver= :contact AND M.status != :status").setParameter("contact", contact).setParameter("lastid", lastid).setParameter("status", "Seen").list(); 
	 		session.close();
	 		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getUdeliveredMessages(Contact contact, Integer lastid) {
		List<Message> list= null;
 		Session session = sessionFactory.openSession();
 		list = session.createQuery("FROM Message M where M.id > :lastid AND M.receiver= :contact AND M.status = :status").setParameter("contact", contact).setParameter("lastid", lastid).setParameter("status", "Sent").list(); 
 		session.close();
 		return list;
	}

}
