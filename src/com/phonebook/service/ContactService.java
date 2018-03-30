package com.phonebook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.type.Type;
import org.springframework.stereotype.Service;

import com.event.model.Event;
import com.phonebook.model.Contact;
import com.phonebook.model.Position;


public interface ContactService {
	   
       
	   public Contact getLoggedIn();
	   public void setLoggedIn(Contact contact);
	   
	   public List<Contact> getContacts();
	   public String paint(Contact contact);
	   public void addContact (Contact contact);
	   public void deleteContact (Contact contact);
	   public void updateContact (Contact contact);
	   public List<Contact> searchContact (String str);
	   public List<Contact> searchContactQuery (String str);
	   public Contact getContact (int id);
	   public void deleteAllContacts ();
	   
	   public Type[] getColumns();
	   public Contact  findByUserName(String username);
	   
	   //position
	   public void addPosition (Position position);
	   public Position getPosition (int position_id);
	   public void setPositionToContact (Contact contact,  Position position);
	   public void addObject (Object object);

	 //GENERAL
	   public List<String> getTableNames();
	   
	   public List<Event> getContactEvents(int contactid) ;
	public boolean hasRole(Contact contact, String role);
	public void deleteSession();
	   
}
