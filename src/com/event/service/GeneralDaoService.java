package com.event.service;

import java.util.List;

import com.sport.model.Champion;

public interface GeneralDaoService {
	
	public void persist(Object entity);
	 
    public void delete(Object entity);
    public void update(Object entity);

	void deleteNewSession(Object entity);
    
}
