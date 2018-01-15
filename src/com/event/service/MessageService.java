package com.event.service;

import java.util.List;

import com.general.model.Message;
import com.phonebook.model.Contact;

public interface MessageService {



	void addMessage(Message message, int senderid, int receiverid);

	List<Message> getMessages(Integer contactid, Integer friendid, Integer lastid, String lastStatus);



	void setSeenMessages(Contact contact, Contact senderid);

	
    
	
}
