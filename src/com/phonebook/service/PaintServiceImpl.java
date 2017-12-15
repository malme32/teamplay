package com.phonebook.service;

import org.springframework.stereotype.Service;

@Service("paintService")
public class PaintServiceImpl implements PaintService{

	@Override
	public String paint(String name) {
		// TODO Auto-generated method stub
		return name+ " painted!!!";
	}

}
