package com.event.dao;

import java.util.List;

import com.sport.model.Champion;
import com.sport.model.Teamgroup;

public interface ChampionDao{
  
	public Champion findChampionsById(int id);
	
	public List<Champion> findAllChampions();
	
	public  List<Teamgroup> getTeamgroups(int championid);
}
