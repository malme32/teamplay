package com.event.service;

import java.util.List;

import com.general.model.Message;

public interface MessageService {

	List<Message> getMessages(int contactid);

	void addMessage(Message message, int senderid, int receiverid);
	
    
	
}
