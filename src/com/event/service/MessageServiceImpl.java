package com.event.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.event.dao.MessageDao;
import com.general.model.Message;
import com.phonebook.service.ContactService;

@Service("messageService")
@Transactional
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	MessageDao messsageDao;
	@Autowired
	ContactService contactService;
	@Autowired
	GeneralDaoService getneralDaoService;

	@Override
	public List<Message> getMessages(int contactid) {
		// TODO Auto-generated method stub
		return messsageDao.getMessages(contactService.getContact(contactid));
	}

	@Override
	public void addMessage(Message message, int senderid, int receiverid) {
		// TODO Auto-generated method stub
/*		message.setContact(contactService.getContact(senderid));
		message.setReceiver(contactService.getContact(receiverid));*/
		message.setDate(new Date());
		getneralDaoService.persist(message);
	}
	
}
