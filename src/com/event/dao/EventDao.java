package com.event.dao;


import java.util.List;

import com.event.model.Event;
import com.general.model.Message;
import com.phonebook.model.Contact;

public interface EventDao {
 

     
    List<Event> findAllEvents();
     
    void deleteEventBySsn(String ssn);
     
    Event findEventById(int id);
    void persist(Object entity);
    
    void addPlayerToEvent(Event event, Contact player);

    List<Message> getMessages(int eventid);
    
    List<Contact> getPlayers(int eventid);
    
}