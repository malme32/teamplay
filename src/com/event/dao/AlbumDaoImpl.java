package com.event.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sport.model.Album;



@Repository("albumDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class AlbumDaoImpl extends AbstractDao implements AlbumDao{
	@Override
	public Album findById(int id) {
		// TODO Auto-generated method stub
		return (Album)getSession().get(Album.class, id);
	}

	@Override
	public List<Album> findAll() {
		   @SuppressWarnings("unchecked")
		   List<Album> list = getSession().createQuery("FROM Album").list(); 

		return list;
	}




}
