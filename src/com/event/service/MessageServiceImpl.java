package com.event.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;

import com.event.dao.MessageDao;
import com.general.model.Message;
import com.phonebook.model.Contact;
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
	public List<Message> getMessages(Integer contactid, Integer friendid, Integer lastid, String lastStatus) {
		// TODO Auto-generated method stub
		List<Message> messages= null;
		if(lastid!=null)
		{
			int counter = 23;
	/*		Message message = messsageDao.findById(lastid);
			String startStatus = message.getStatus();*/
			for(int i=0;i<counter;i++)
			{	
				
				messages = messsageDao.getMessages(contactService.getContact(contactid), contactService.getContact(friendid), lastid);
				System.out.println(messages.size());
				if(messages.isEmpty())
				{
					if(lastStatus!=null&&!lastStatus.equals("Seen"))
					{
						Message message1 = messsageDao.findByIdNewSession(lastid);
						if(!message1.getStatus().equals(lastStatus))
						{
							List<Message> tmplist= new ArrayList<Message>();
							tmplist.add(message1);
							return tmplist;
						}
					}
					try {
						Thread.sleep(2000);
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
			System.out.println("HEREIN");
			 this.setSeenMessages(contactService.getContact(contactid), contactService.getContact(friendid));
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


	@Override
	public void setSeenMessages(Contact contact, Contact sender) {
		// TODO Auto-generated method stub

		messsageDao.setSeenMessages(contact,sender);
	}
	
}
