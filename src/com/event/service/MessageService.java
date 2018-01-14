package com.event.service;

import java.util.List;

import com.general.model.Message;

public interface MessageService {



	void addMessage(Message message, int senderid, int receiverid);

	List<Message> getMessages(Integer contactid, Integer friendid, Integer lastid);

	void setSeenMessages(int id, int receiverid);

	
    
	
}
