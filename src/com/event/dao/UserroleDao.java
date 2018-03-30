package com.event.dao;

import java.util.List;

import com.phonebook.model.Contact;
import com.phonebook.model.Userrole;

public interface UserroleDao{
  
	public Userrole findById(int id);
	

	
	public List<Userrole> findAll();


	public boolean hasRole(Contact contact, String role);

	

}
