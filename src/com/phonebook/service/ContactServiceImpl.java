package com.phonebook.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.Cookie;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.hibernate.Hibernate;
import org.hibernate.Query;
//import org.apache.lucene.search.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.hibernate.type.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.event.controller.SportController;
import com.event.dao.MySessionDao;
import com.event.dao.UserroleDao;
import com.event.model.Event;
import com.event.service.GeneralDaoService;
import com.phonebook.model.Contact;
import com.phonebook.model.Position;
import com.phonebook.model.Userrole;
import com.sport.model.MySession;
@Transactional
@Service("contactService")
public class ContactServiceImpl implements ContactService{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private GeneralService generalService;
	
	@Autowired
	private MySessionDao mySessionDao;

	@Autowired
	private UserroleDao userroleDao;

	@Autowired
	private GeneralDaoService generalDaoService;
	
	private static Contact loggedInContact=null;
	
    public void setGeneralService(GeneralService generalService) {
		this.generalService = generalService;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
        
//        Session session =sessionFactory.getCurrentSession();
//        FullTextSession fullTextSession = Search.getFullTextSession(session);
//    	Transaction tx = fullTextSession.beginTransaction();
//    	try {
//			fullTextSession.createIndexer().startAndWait();
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//        tx.commit();
//		session.close(); 
        
    }
  
    
//    @PersistenceContext
    public void setEntityManager(EntityManager entityManager) {
    }

	PaintService paintService;
	//private static 	Contact[] contacts=new Contact[20];	
	ArrayList<Contact> list=new ArrayList<Contact>();  
	@Override
	public List<Contact> getContacts() {
		Session session = this.sessionFactory.getCurrentSession();
		//Transaction tx = session.beginTransaction();
         List<Contact> contacts = session.createQuery("FROM Contact").list(); 
	 	//	tx.commit();
	 		//session.close();
	 		
         return contacts;
/*		for(int i=0;i<contacts.length;i++)
			list.add(contacts[i]);*/
		// TODO Auto-generated method stub
	
	}
	@Autowired
	public
	ContactServiceImpl(PaintService paintService) {

	// TODO Auto-generated method stub
		this.paintService=paintService;
	}

	@Override
	public String paint(Contact contact) {
		return paintService.paint(contact.getName());
		// TODO Auto-generated method stub
		
	}
	@Override
	//@Transactional
	public void addContact(Contact contact) {
		
//		
//		contact.setId(list.get(list.size()-1).getId()+1);
//		list.add(contact);
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		//Transaction tx = session.beginTransaction();
		session.persist(contact);
	//	tx.commit();
		//session.close();
		
	}
	@Override
	public void deleteContact(Contact contact) {
		Session session = this.sessionFactory.getCurrentSession();
		//Transaction tx = session.beginTransaction();
		session.delete(contact);
		//tx.commit();
		//getCurrentSessionse();
		// TODO Auto-generated method stub
//	    for(Contact ce : list)
//	    {
//	        if(ce.getId() == contact.getId())
//	        {
//	            list.remove(ce);
//	            return;
//	        }
//	    }  
		
	}
	@Override
	public void updateContact(Contact contact) {
		Session session = this.sessionFactory.getCurrentSession();
		//Transaction tx = session.beginTransaction();
		session.saveOrUpdate(contact);
		//tx.commit();
		//session.close();
		
		// TODO Auto-generated method stub
//	    for(int i =0;i<list.size();i++)
//	    {
//	    	Contact ce = list.get(i);
//	        if(ce.getId() == contact.getId())
//	        {
//	            list.set(i, contact);
//	            return;
//	        }
//	    }  
	}

	@Override
	//@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.DEFAULT)
	public List<Contact> searchContact(String str) {
		// TODO Auto-generated method stub

		try
	      {
	         Session session =sessionFactory.getCurrentSession();
	         
	         FullTextSession fullTextSession = Search.getFullTextSession(session);
	     	//Transaction tx = fullTextSession.beginTransaction();
	     	//llTextSession.createIndexer().startAndWait();
	         QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(Contact.class).get();
	         org.apache.lucene.search.Query query = qb .keyword().onFields("name").matching(str).createQuery();

	         org.hibernate.Query hibQuery = 
	            fullTextSession.createFullTextQuery(query, Contact.class);

	         List<Contact> results = hibQuery.list();
	         //tx.commit();
	         //session.close();  
	         return results;
	      }
	      catch(Exception e)
	      {
	         throw e;
	      }
		    
	}

	@Override
	//@Transactional
	public List<Contact> searchContactQuery(String str) {
		// TODO Auto-generated method stub

		str=generalService.toGreekLish(str);

		try
	      {
	        Session session =sessionFactory.getCurrentSession();
	     //	Transaction tx = session.beginTransaction();
	     	Query myQuery = (Query) session.createQuery("from Contact where CONCAT(name, phonenumber, mobilenumber, email)  like '%"+str+"%'");
	         List results = myQuery.list();
	      //   tx.commit();
	        // session.close();  
	         return results;
	      }
	      catch(Exception e)
	      {
	         throw e;
	      }
		    
	}
	@Override
	public void deleteAllContacts() {
		// TODO Auto-generated method stub
		try
	      {
	         Session session =sessionFactory.getCurrentSession();
	         
	   
	     //	Transaction tx = session.beginTransaction();
	     	
	     	Query myQuery = (Query) session.createQuery("delete from Contact");
	     	myQuery.executeUpdate();
	         //tx.commit();
	         //session.close();  
	         return ;
	      }
	      catch(Exception e)
	      {
	         throw e;
	      }
	}
	@Override
	public Contact getContact(int id) {
		return sessionFactory.getCurrentSession().get(Contact.class, id);
		/*// TODO Auto-generated method stub
		try
	      {
	         Session session =sessionFactory.getCurrentSession();
	         
	   
	     	//Transaction tx = session.beginTransaction();
	     	
	     	Query myQuery = (Query) session.createQuery("from Contact where id  = '"+id+"'");
	         List results = myQuery.list();
	        // tx.commit();
	         //session.close();  
	         return (Contact) results.get(0);
	      }
	      catch(Exception e)
	      {
	         throw e;
	      }*/
	}
	@Override
	public void addPosition(Position position) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		//Transaction tx = session.beginTransaction();
		session.persist(position);
	//	tx.commit();
		//session.close();
	}
	@Override
	public void setPositionToContact(Contact contact, Position position) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void addObject(Object object) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		//Transaction tx = session.beginTransaction();
		session.persist(object);
		//tx.commit();
		//session.close();
	}
	@Override
	public Position getPosition(int position_id) {
		// TODO Auto-generated method stub
		try
	      {
	         Session session =sessionFactory.getCurrentSession();
	         
	   
	     	//Transaction tx = session.beginTransaction();
	     	
	     	Query myQuery = (Query) session.createQuery("from Position where id  = '"+position_id+"'");
	         List results = myQuery.list();
	        // tx.commit();
	         //session.close();  
	         return (Position) results.get(0);
	      }
	      catch(Exception e)
	      {
	         throw e;
	      }
	}

	
	//////GENERAL/////////////
	
	@Override
	public Type[] getColumns() {
		String[] columnNames = sessionFactory.getClassMetadata(Contact.class).getPropertyNames();
		org.hibernate.type.Type[] columnTypes = sessionFactory.getClassMetadata("com.phonebook.model.contact").getPropertyTypes();
		 // org.hibernate.type.Type[] columnTypes = getSessionFactory().getClassMetadata(Employee.class).getPropertyTypes();
		// TODO Auto-generated method stub
	
		return columnTypes;
	}

	@Override
	public List<String> getTableNames() {
		Session session = this.sessionFactory.getCurrentSession();
		//Transaction tx = session.beginTransaction();
		List list = session.createSQLQuery("show tables from test").list(); 
 		//tx.commit();
 		//session.close();
	 		
         return list;
/*		for(int i=0;i<contacts.length;i++)
			list.add(contacts[i]);*/
		// TODO Auto-generated method stub
	
	}
	@SuppressWarnings("unchecked")
//	@Override
//	public Contact findByUserName(String username) {
//		List<Contact> users = new ArrayList<Contact>();
//
//		System.out.println("XOXO"+username);
//		if(sessionFactory!=null)
//		{
//
//			System.out.println("PEPE"+username);
//			return  getContact(2);
//		}
//		users = sessionFactory.getCurrentSession()
//			.createQuery("from Contact where username=?")
//			.setParameter(0, username)
//			.list();
//		System.out.println("XEXE"+username);
//		System.out.println(users.get(0));
//		if (users.size() > 0) {
//			return users.get(0);
//		} else {
//			return null;
//		}
//	}

	@Override
	public Contact findByUserName(String username) {
		try
	      {
	         Session session =sessionFactory.getCurrentSession();
	         
	   
	     	//Transaction tx = session.beginTransaction();
	     	
	     	Query myQuery = (Query) session.createQuery("from Contact where username  = '"+username+"'");
	         List results = myQuery.list();
	        //tx.commit();
	         //session.close();  
	         if (results.isEmpty())
	        	 return null;
	         Contact tmpcontact = (Contact) results.get(0);
	         return (Contact) results.get(0);
	      }
	      catch(Exception e)
	      {
	         throw e;
	      }
	}

	
	@Override
	public List<Event> getContactEvents(int contactid) {
		
		Contact contact = sessionFactory.getCurrentSession().get(Contact.class, contactid);
		Hibernate.initialize(contact.getEvents());
		return contact.getEvents();
		
	}
	@Override
	public Contact getLoggedIn() {
		// TODO Auto-generated method stub
		// keep this.. it should use if spring security is followed;
/*		User user =null; 
	 try{user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();}
	 catch(Exception e){}
	 ModelAndView model = new ModelAndView("theme1/index");
	 if(user!=null)
	 {
		 String username = user.getUsername();
		 Contact contact = this.findByUserName(username);
		 return contact;
	 }
	 else return null;*/
		System.out.println("getting cookie");
		Cookie cookie = WebUtils.getCookie(SportController.request,"token");
		System.out.println(cookie);
		Contact contact=null;
		if(cookie!=null)
			contact = mySessionDao.getContactByToken(cookie.getValue());
		return contact;
    	
    	
    			
   	}
	@Override
	public void setLoggedIn(Contact contact) {
		// TODO Auto-generated method stub
		System.out.println("SETTING LOGGED IN CONTACT"+ contact);
		loggedInContact = contact;
		return;
	}
	@Override
	public boolean hasRole(Contact contact, String role) {
		return userroleDao.hasRole(contact,role);
/*      	Hibernate.initialize(contact.getUserroles());
    	List<Userrole> userroles = contact.getUserroles();
    	for(Userrole userrole:userroles)
    	{
    		if(userrole.getRole().equals("ROLE_ADMIN"))
    		{
    			return true;
    
    		}
    	}
    	return false;*/
	}
	@Override
	public void deleteSession() {
		// TODO Auto-generated method stub
		Cookie cookie = WebUtils.getCookie(SportController.request,"token");
		System.out.println(cookie);
		if(cookie!=null)
		{
			MySession mySession =mySessionDao.findSessionByToken(cookie.getValue());
			if(mySession!=null)
			{
				generalDaoService.delete(mySession);
			}
				
		}
	}


}
