package com.event.service;

import java.util.List;
import java.util.Set;

import com.event.model.Event;
import com.event.model.Message;
import com.phonebook.model.Contact;

public interface EventService {

     
    List<Event> findAllEvents();
    
    //Contact findPlayerById(int id);
    
    Event findEventById(int id);
    public void persist(Object entity);
    
    public void addPlayerToEvent(Event event, Contact player);


    List<Message> getMessages(int eventid);
    List<Contact> getPlayers(int eventid);
}