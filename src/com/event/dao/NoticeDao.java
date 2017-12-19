package com.event.dao;

import java.util.List;


import com.sport.model.Notice;


public interface NoticeDao{
  
	public Notice findById(int id);
	
	public List<Notice> findAll();
	
}
