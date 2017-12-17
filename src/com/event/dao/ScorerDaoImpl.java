package com.event.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sport.model.Scorer;





@Repository("ScorerDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class ScorerDaoImpl extends AbstractDao implements ScorerDao{
	
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
    
	@Override
	public Scorer findById(int id) {
		// TODO Auto-generated method stub
		return (Scorer)getSession().get(Scorer.class, id);
	}

	@Override
	public List<Scorer> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Scorer> list = getSession().createQuery("FROM Scorer").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}

}
