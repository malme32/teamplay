package com.event.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.event.dao.GeneralDao;
import com.sport.model.Champion;

@Service("generalDaoService")
@Transactional
//@Cacheable(value = "entities", cacheManager = "springCM")
public class GeneralDaoServiceImpl implements GeneralDaoService{

	@Autowired
	GeneralDao generalDao;
	
	
	@Override
	public void persist(Object entity) {
		generalDao.persist(entity);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Object entity) {
		// TODO Auto-generated method stub
		generalDao.delete(entity);
	}

	@Override
	public void update(Object entity) {
		// TODO Auto-generated method stub
		generalDao.update(entity);
	}



	
}
