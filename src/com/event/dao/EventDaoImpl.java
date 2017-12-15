package com.event.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.event.model.Event;
import com.event.model.Message;
import com.phonebook.model.Contact;

@Repository("eventDao")
public class EventDaoImpl extends AbstractDao implements EventDao {
/*
    @Autowired
    private SessionFactory sessionFactory1;*/
 
	

	@Override
	public List<Event> findAllEvents() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Event> events = getSession().createQuery("FROM Event").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return events;
	}

	@Override
	public void deleteEventBySsn(String ssn) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Event findEventById(int id) {
		return (Event)getSession().get(Event.class, id);
		// TODO Auto-generated method stub
	}

	@Override
	public void addPlayerToEvent(Event event, Contact player) {
		// TODO Auto-generated method stub
		//List<Player> tmp = ;
	//	tmp.add(player);
		
		event.getPlayers().add(player);
		player.getEvents().add(event);
		getSession().update( event );
		
	}

	@Override
	public List<Message> getMessages(int eventid) {
		// TODO Auto-generated method stub
		Event event = getSession().get(Event.class, eventid);
		Hibernate.initialize(event.getMessages());
		return event.getMessages();
	}

	@Override
	public List<Contact> getPlayers(int eventid) {
		// TODO Auto-generated method stub
		Event event = getSession().get(Event.class, eventid);
		Hibernate.initialize(event.getPlayers());
		return event.getPlayers();
	}



}
