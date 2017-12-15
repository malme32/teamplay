package com.phonebook.service;


import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import com.phonebook.model.Contact;
import com.phonebook.model.Salary;
@Transactional
@Service("salaryService")
public class SalaryServiceImpl implements SalaryService{
	
	@Autowired
	private SessionFactory sessionFactory;
	


    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	@Override
	public void addSalary(Salary salary) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(salary);
	}
	@Override
	public List<Salary> getContactSalaries(int id) {
		// TODO Auto-generated method stub
		//System.out.println(contact.getName()+" XAXA");
		Contact contact = sessionFactory.getCurrentSession().get(Contact.class, id);
		Hibernate.initialize(contact.getSalaries());
		return contact.getSalaries();
/*		try
	      {
	        Session session =sessionFactory.getCurrentSession();
	     	Query myQuery = (Query) session.createQuery("from Salary where contact  = :contact");
	     	myQuery.setParameter("contact", contact);
	     	List results = myQuery.list();
	        return results;
	      }
	      catch(Exception e)
	      {
	         throw e;
	      }*/
	}

	

}
