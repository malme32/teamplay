package com.event.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sport.model.Custompage;


@Repository("custompageDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class CustompageDaoImpl extends AbstractDao implements CustompageDao{
	
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
    
	@Override
	public Custompage findById(int id) {
		// TODO Auto-generated method stub
		return (Custompage)getSession().get(Custompage.class, id);
	}

	@Override
	public List<Custompage> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Custompage> list = getSession().createQuery("FROM Custompage").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}

}
