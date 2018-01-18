package com.event.dao;

import java.util.List;

import com.general.model.Message;
import com.phonebook.model.Contact;

public interface MessageDao{
  
	public Message findById(int id);

	public List<Message> findAll();

	public List<Message> getMessages(Contact contact, Contact friend, Integer lastid);

	public void setSeenMessages(Contact contact, Contact sender);

	Message findByIdNewSession(int id);

	public List<Message> getUnseenMessages(Contact contact, Integer integer);

	public List<Message> getUdeliveredMessages(Contact contact, Integer integer);

	void setDeliveredMessages(Contact contact, Contact sender);

	void setAllDeliveredMessages(Contact contact);


}
