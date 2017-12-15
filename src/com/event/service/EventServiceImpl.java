package com.event.service;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.event.dao.AbstractDao;
import com.event.dao.EventDao;

import com.event.model.Event;
import com.event.model.Message;
import com.phonebook.model.Contact;


@Service("eventService")
@Transactional
public class EventServiceImpl extends AbstractDao implements  EventService {
    @Autowired
    private EventDao eventDao;

/*    @Autowired
    private PlayerDao playerDao;*/
    

	@Override
	public List<Event> findAllEvents() {
		return eventDao.findAllEvents();
		// TODO Auto-generated method stub
	
	}



/*	@Override
	public Player findPlayerById(int id) {
		// TODO Auto-generated method stub
		return playerDao.findPlayerById(id);

	}*/



	@Override
	public Event findEventById(int id) {
		// TODO Auto-generated method stub
		return eventDao.findEventById(id);
	}



	@Override
	public void persist(Object entity) {
		// TODO Auto-generated method stub
		eventDao.persist(entity);
	}


/*
	@Override
	public void addPlayerToEvent(Event event, Player player) {
		eventDao.addPlayerToEvent(event, player);
		// TODO Auto-generated method stub
		//eventDao.
		return;
	}
*/


	@Override
	public void addPlayerToEvent(Event event, Contact player) {
		// TODO Auto-generated method stub
		eventDao.addPlayerToEvent(event, player);
	}





@Override
public List<Message> getMessages(int eventid) {
	// TODO Auto-generated method stub

	//System.out.println("XAXAXA"+event.getMessages().get(0));
	return eventDao.getMessages(eventid);
}



@Override
public List<Contact> getPlayers(int eventid) {
	return eventDao.getPlayers(eventid);
	// TODO Auto-generated method stub

}
	

}
