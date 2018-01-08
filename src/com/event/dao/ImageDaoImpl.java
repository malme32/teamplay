package com.event.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sport.model.Image;


@Repository("imageDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class ImageDaoImpl extends AbstractDao implements ImageDao{
	@Override
	public Image findById(int id) {
		// TODO Auto-generated method stub
		return (Image)getSession().get(Image.class, id);
	}

	@Override
	public List<Image> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Image> list = getSession().createQuery("FROM Image").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}




}
