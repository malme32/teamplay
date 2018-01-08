package com.event.dao;

import java.util.List;

import com.sport.model.Album;

public interface AlbumDao{
  
	public Album findById(int id);

	public List<Album> findAll();

}
