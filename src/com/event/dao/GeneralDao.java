package com.event.dao;


public interface GeneralDao {
	
	public void persist(Object entity);
	 
    public void delete(Object entity);
    
    public void update(Object entity);

	public void deleteNewSession(Object entity);
}
