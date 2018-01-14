package com.event.dao;

import java.util.List;

import com.general.model.Message;
import com.phonebook.model.Contact;

public interface MessageDao{
  
	public Message findById(int id);

	public List<Message> findAll();

	public List<Message> getMessages(Contact contact, Contact friend, Integer lastid);


}
