package com.event.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;

import com.sport.model.Champion;
import com.sport.model.Standing;
import com.sport.model.Teamgroup;

import javassist.bytecode.stackmap.TypeData.ClassName;
@Service("playoffService")
@Transactional
public class PlayoffServiceImpl implements PlayoffService {

	
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
		
		System.out.println("SORTING");
		List<Standing> tmplist= new ArrayList<Standing>();
		for(Standing standing:standings)
			tmplist.add(standing);
		Collections.sort(tmplist);
		//tmplist.sort(Comparator.comparing(ClassName::getFieldName));
		tmplist.subList(num, tmplist.size()).clear();
		for(Standing standing:tmplist)
			System.out.println(standing.getTeam().getName());
		//for(Standing standing:tmplist)
			
		return tmplist;
		
	}

	private void generateGames(List<List<Standing>> standings){
		
		int i=0;
		while(true)
		{

			boolean isEmpty=true;
			for(List<Standing> tmp:standings) {
				if(!tmp.isEmpty())
					isEmpty=false;
				
			}
			if(isEmpty)
				break;
			List<Standing> standtmp1 = standings.get(i);
			while(standtmp1.size()==0)
			{
				i=i==standings.size()-1?0:i+1;
				standtmp1 = standings.get(i);
			}
			int y=i==standings.size()-1?0:i+1;	

			List<Standing> standtmp2  = standings.get(y);
			while(standtmp2.size()==0)
			{
				y=y==standings.size()-1?0:y+1;
				standtmp2 = standings.get(y);
			}
			
			System.out.println(standtmp1.get(0).getTeam().getName()+" vs "+standtmp2.get(standtmp2.size()-1).getTeam().getName());
			standtmp1.remove(0);
			standtmp2.remove(standtmp2.size()-1);
			i=i==standings.size()-1?0:i+1;
		}
		
		return;
		
	}
	
	
	private void filterOutGames(List<List<Standing>> standings,int filtercount){

		System.out.println("starting filtering..");
		List<Standing> tmplastlist=new ArrayList<Standing>();
		for(List<Standing> tmplist:standings)
			tmplastlist.add(tmplist.get(tmplist.size()-1));
		Collections.sort(tmplastlist);
		

		System.out.println("printing filtering last list..");

		for(Standing standing:tmplastlist)
			System.out.println(standing.getTeam().getName());
		
		tmplastlist.subList(tmplastlist.size()-filtercount, tmplastlist.size()).clear();

		System.out.println("printing filtering last list --out sublist..");

		for(Standing standing:tmplastlist)
			System.out.println(standing.getTeam().getName());

		
		for(List<Standing> tmplist:standings)
			if(tmplastlist.indexOf(tmplist.get(tmplist.size()-1))==-1)
				tmplist.remove(tmplist.get(tmplist.size()-1));
/*			for(Standing standing :tmplist)
			{
				System.out.println("1");
				if(tmplastlist.indexOf(standing)==-1)
				{
					System.out.println("2");
					tmplist.remove(standing);
					System.out.println("3");
					
				}
			}*/
		
		System.out.println("printing filtering outcome..");

		for(List<Standing> tmplist:standings)
			for(Standing standing :tmplist)
				System.out.println(standing.getTeam().getName());
		return;
		
	}
	
	public int roundUp(double d){
	    Double ret= d > (int)d ? (int)d + 1 : d;
	    return ret.intValue();
	}
	
	private int findNumber(Champion champion, Integer phase){
		Double num=0.0;
		Hibernate.initialize(champion.getTeamgroups());
		num=phase.doubleValue()/champion.getTeamgroups().size();
		//System.out.println("ROUND UP "+roundUp(num));
		return roundUp(num);
		
	}

	
	@Override
	public void generatePlayoff(Champion champion, int phase) {
		// TODO Auto-generated method stub
		switch(phase) {
		case 32:
		case 16:
		case 8:
		case 4:
			break;
		default:
			System.out.println("FAILED");
		return;
		
		}
		Hibernate.initialize(champion.getTeamgroups());
		List<Teamgroup> teamgroups = champion.getTeamgroups();
		
		List<List<Standing>> totalStandings = new ArrayList<List<Standing>>();
		int numberPerStand = findNumber(champion, phase);
		for(Teamgroup teamgroup:teamgroups)
		{
			Hibernate.initialize(teamgroup.getStandings());
			List<Standing> standings = teamgroup.getStandings();
			totalStandings.add(getGreaterStandings(standings,numberPerStand));
			
		}
		System.out.println("Filtering out..");
		filterOutGames(totalStandings,champion.getTeamgroups().size()*numberPerStand - phase);

		System.out.println("Filtered out..");
		generateGames(totalStandings);
		return;
	}
}
