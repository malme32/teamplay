package com.event.dao;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.event.model.Event;
import com.sport.model.Champion;

/*@Repository*/
public abstract class AbstractDao {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }
 
    public void persist(Object entity) {
        getSession().persist(entity);
    }
 
    public void delete(Object entity) {
        getSession().delete(entity);
    }
    
    public void deleteNewSession(Object entity) {
    	Session session = sessionFactory.openSession();
    	session.delete(entity);
    	session.close();
    }
    

    public void update(Object entity) {
        getSession().update(entity);
    }
}