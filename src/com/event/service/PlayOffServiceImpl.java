package com.event.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;

import com.sport.model.Champion;
import com.sport.model.Standing;
import com.sport.model.Teamgroup;
@Service("playeOffService")
@Transactional
public class PlayOffServiceImpl implements PlayOffService {

	
private  void genPlayoffs() {
		
		List<List<String>> total = new ArrayList<List<String>>();
		
		List<String> stand1 = new ArrayList<String>();
		stand1.add("team1");
		stand1.add("team2");
		stand1.add("team3");
		stand1.add("team4");
		stand1.add("team5");

		List<String> stand2 = new ArrayList<String>();
		stand2.add("team21");
		stand2.add("team22");
		stand2.add("team23");
		stand2.add("team24");
		stand2.add("team25");

		List<String> stand3 = new ArrayList<String>();
		stand3.add("team31");
		stand3.add("team32");
		stand3.add("team33");
		stand3.add("team34");
		stand3.add("team35");

		List<String> stand4 = new ArrayList<String>();
		stand4.add("team41");
		stand4.add("team42");
		stand4.add("team43");
		stand4.add("team44");
		stand4.add("team45");
		


		List<String> stand5 = new ArrayList<String>();
		stand4.add("team51");
		stand4.add("team52");
		stand4.add("team53");
		stand4.add("team54");
		
		
		
		
		total.add(stand1);
		total.add(stand2);
		total.add(stand3);
		total.add(stand4);
		total.add(stand5);
		
		

		int i=0;
		while(true)
		{

			boolean isEmpty=true;
			for(List<String> tmp:total) {
				if(!tmp.isEmpty())
					isEmpty=false;
				
			}
			if(isEmpty)
				break;
			List<String> standtmp1 = total.get(i);
			while(standtmp1.size()==0)
			{
				i=i==total.size()-1?0:i+1;
				standtmp1 = total.get(i);
			}
			int y=i==total.size()-1?0:i+1;	

			List<String> standtmp2  = total.get(y);
			while(standtmp2.size()==0)
			{
				y=y==total.size()-1?0:y+1;
				standtmp2 = total.get(y);
			}
			
			System.out.println(standtmp1.get(0)+" vs "+standtmp2.get(standtmp2.size()-1));
			standtmp1.remove(0);
			standtmp2.remove(standtmp2.size()-1);
			i=i==total.size()-1?0:i+1;
		}
		
	}
	
	private List<Standing> getGreaterStandings(List<Standing> standings, int num){
		return standings;
		
	}

	private void generateGames(List<List<Standing>> standings){
		return;
		
	}

	private int findNumber(){
		return 4;
		
	}

	
	@Override
	public void generatePlayoff(Champion champion) {
		// TODO Auto-generated method stub
		
		Hibernate.initialize(champion.getTeamgroups());
		List<Teamgroup> teamgroups = champion.getTeamgroups();
		
		List<List<Standing>> totalStandings = new ArrayList<List<Standing>>();
		for(Teamgroup teamgroup:teamgroups)
		{
			Hibernate.initialize(teamgroup.getStandings());
			List<Standing> standings = teamgroup.getStandings();
			int numberPerStand = findNumber();
			totalStandings.add(getGreaterStandings(standings,numberPerStand));
			
		}
		generateGames(totalStandings);
		return;
	}
}
