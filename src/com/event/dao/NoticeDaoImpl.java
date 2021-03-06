package com.event.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sport.model.Notice;

@Repository("NoticeDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class NoticeDaoImpl extends AbstractDao implements NoticeDao{
	
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
    
	@Override
	public Notice findById(int id) {
		// TODO Auto-generated method stub
		return (Notice)getSession().get(Notice.class, id);
	}

	@Override
	public List<Notice> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Notice> list = getSession().createQuery("FROM Notice order by Date DESC").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public List<Notice> findImportant() {
		// TODO Auto-generated method stub
		   @SuppressWarnings("unchecked")
		   List<Notice> list = getSession().createQuery("FROM Notice N where N.important=1 order by Date DESC").list(); 
		return list;
	}

}
