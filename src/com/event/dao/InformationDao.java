package com.event.dao;

import java.util.List;

import com.general.model.Information;
import com.sport.model.Team;


public interface InformationDao{
  
	public Information findById(int id);

	public List<Information> findAll();

	public List<Information> getTeamInformations(Team team, Integer lastid);

}
