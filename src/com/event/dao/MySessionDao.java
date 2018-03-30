package com.event.dao;

import java.util.List;

import com.general.model.Information;
import com.phonebook.model.Contact;
import com.sport.model.MySession;
import com.sport.model.Team;


public interface MySessionDao{
  
	public MySession findById(int id);

	public List<MySession> findAll();

	public Contact getContactByToken(String token);

	public MySession findSessionByToken(String value);


}
