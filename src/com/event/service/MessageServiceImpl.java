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
	public List<Message> getMessages(Integer contactid, Integer friendid, Integer lastid) {
		// TODO Auto-generated method stub
		List<Message> messages= null;
		if(lastid!=null)
		{
			int counter = 10;
			for(int i=0;i<counter;i++)
			{	
				messages = messsageDao.getMessages(contactService.getContact(contactid), contactService.getContact(friendid), lastid);
				System.out.println(messages.size());
				if(messages.isEmpty())
				{
					try {
						Thread.sleep(5000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else
				{
					break;
				}
			}
		}
		else
		{
			messages= messsageDao.getMessages(contactService.getContact(contactid), contactService.getContact(friendid),  lastid);
		}
		return messages;
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
