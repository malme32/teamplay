package com.event.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sport.model.Champion;
import com.sport.model.Game;
import com.sport.model.Playoff;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

import javassist.bytecode.stackmap.TypeData.ClassName;
@Service("playoffService")
@Transactional
public class PlayoffServiceImpl implements PlayoffService {
	
	
	@Autowired
	GeneralDaoService generalDaoService;
	@Autowired
	SportService sportService;
/*
	
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
		
	}*/
	
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

	private void generateGames(List<List<Standing>> standings, Champion champion, int phase,int round){

		Playoff playoff= new Playoff();
		playoff.setChampion(champion);
		playoff.setPhase(phase);
		Playoff playoff2=null;
		if(round==2)
		{
			playoff2= new Playoff();
			playoff2.setChampion(champion);
			playoff2.setPhase(phase);
		}
		if(round==1) {
			switch(phase) {
			case 32:
				playoff.setName("ΦΑΣΗ ΤΩΝ 32");
				break;
			case 16:
				playoff.setName("ΦΑΣΗ ΤΩΝ 16");
				break;
			case 8:
				playoff.setName("ΠΡΟΗΜΙΤΕΛΙΚΑ");
				break;
			case 4:
				playoff.setName("ΗΜΙΤΕΛΙΚΑ");
				break;
			case 2:
				playoff.setName("ΤΕΛΙΚΟΣ");
				break;
			
			default:
				playoff.setName(Integer.toString(phase));
				break;
			
			}
			this.generalDaoService.persist(playoff);
			
		}
		else {
			
			switch(phase) {
			case 32:
				playoff.setName("ΦΑΣΗ ΤΩΝ 32 - ΓΥΡΟΣ Α");
				playoff2.setName("ΦΑΣΗ ΤΩΝ 32 - ΓΥΡΟΣ Β");
				break;
			case 16:
				playoff.setName("ΦΑΣΗ ΤΩΝ 16 - ΓΥΡΟΣ Α");
				playoff2.setName("ΦΑΣΗ ΤΩΝ 16 - ΓΥΡΟΣ Β");
				break;
			case 8:
				playoff.setName("ΠΡΟΗΜΙΤΕΛΙΚΑ - ΓΥΡΟΣ Α");
				playoff2.setName("ΠΡΟΗΜΙΤΕΛΙΚΑ - ΓΥΡΟΣ Β");
				break;
			case 4:
				playoff.setName("ΗΜΙΤΕΛΙΚΑ - ΓΥΡΟΣ Α");
				playoff2.setName("ΗΜΙΤΕΛΙΚΑ - ΓΥΡΟΣ Β");
				break;
			case 2:
				playoff.setName("ΤΕΛΙΚΟΣ - ΓΥΡΟΣ Α");
				playoff2.setName("ΤΕΛΙΚΟΣ - ΓΥΡΟΣ Β");
				break;
			
			default:
				playoff.setName(Integer.toString(phase)+" ΓΥΡΟΣ Α");
				playoff2.setName(Integer.toString(phase)+ "ΓΥΡΟΣ Β");
				break;
			
			}
			this.generalDaoService.persist(playoff);
			this.generalDaoService.persist(playoff2);
			
		}
		
		
		
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
			Game game = new Game();
			game.setPlayoff(playoff);
			game.setChampion(playoff.getChampion());
			game.setTeam1(standtmp1.get(0).getTeam());
			game.setTeam2(standtmp2.get(standtmp2.size()-1).getTeam());
			this.generalDaoService.persist(game);
			
			if(round==2) {
				Game game2 = new Game();
				game2.setPlayoff(playoff2);
				game2.setChampion(playoff2.getChampion());
				game2.setTeam1(standtmp2.get(standtmp2.size()-1).getTeam());
				game2.setTeam2(standtmp1.get(0).getTeam());
				this.generalDaoService.persist(game2);
			}
			
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
	public void generatePlayoff(Champion champion, int phase, int round) {
		// TODO Auto-generated method stub
		List<Playoff> playoffs = sportService.getPlayoffGames(champion.getId(), null);
		if(!playoffs.isEmpty())
		{
			System.out.println("Getting next playoffs");
			List<Playoff> prevPlayoffs = sportService.getPlayoffGames(champion.getId(), phase*2);
			generetaNextPlayoffs(prevPlayoffs,champion, phase, round);
			return;
		}
		switch(phase) {
		case 32:
		case 16:
		case 8:
		case 4:
		case 2:
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
		generateGames(totalStandings,champion, phase, round);
		return;
	}

	private List<Team> getWinners(List<Playoff> prevPlayoffs){

		List<Team> winTeams= new ArrayList<Team>();

		System.out.println("YOU "+prevPlayoffs.size());
		//1 round
		if(prevPlayoffs.size()==1)
		{

			for(Game game:prevPlayoffs.get(0).getGames())
			{
				if(Integer.parseInt(game.getScore1())>Integer.parseInt(game.getScore2()))
					winTeams.add(game.getTeam1());
				else
					winTeams.add(game.getTeam2());
			}
			return winTeams;
		}
		//2 rounds
		if(prevPlayoffs.size()==2)
		{
			Playoff playoff1 = prevPlayoffs.get(0);
			Playoff playoff2 = prevPlayoffs.get(1);
			for(Game game1:playoff1.getGames())
			{			
				for(Game game2:playoff2.getGames())
				{
					if(game1.getTeam1().getId()==game2.getTeam2().getId()&& game1.getTeam2().getId()==game2.getTeam1().getId())
					{
						int game1Score1 = Integer.parseInt(game1.getScore1());
						int game1Score2 = Integer.parseInt(game1.getScore2());
						int game2Score1 = Integer.parseInt(game2.getScore1());
						int game2Score2 = Integer.parseInt(game2.getScore2());
						
						if(game1Score1>game1Score2&&game2Score1<game2Score2)
							winTeams.add(game1.getTeam1());
						else if(game1Score1>game1Score2&&game2Score1==game2Score2)
							winTeams.add(game1.getTeam1());
						else if(game1Score1==game1Score2&&game2Score1<game2Score2)
							winTeams.add(game1.getTeam1());
						else if(game1Score1<game1Score2&&game2Score1>game2Score2)
							winTeams.add(game1.getTeam2());
						else if(game1Score1<game1Score2&&game2Score1==game2Score2)
							winTeams.add(game1.getTeam2());
						else if(game1Score1==game1Score2&&game2Score1>game2Score2)
							winTeams.add(game1.getTeam2());
						
						else if(game1Score1+game2Score2>game1Score2+game2Score1)
							winTeams.add(game1.getTeam1());
						else //if(game1Score1+game2Score2<game1Score2+game2Score1)
							winTeams.add(game1.getTeam2());
					
					}
						
				}
			}
		}
		for(Team team:winTeams)
			System.out.println("YOU "+team.getName());
		return winTeams;
	}
	
	private void generetaNextPlayoffs(List<Playoff> prevPlayoffs,Champion champion, int phase, int round) {
		// TODO Auto-generated method stub

		System.out.println("starting next playoffs");
		List<Team> winTeams= getWinners(prevPlayoffs);

		System.out.println("continuing next playoffs");
		
		Playoff playoff= new Playoff();
		playoff.setChampion(champion);
		playoff.setPhase(phase);
		Playoff playoff2=null;
		if(round==2)
		{
			playoff2= new Playoff();
			playoff2.setChampion(champion);
			playoff2.setPhase(phase);
		}
		if(round==1) {
			switch(phase) {
			case 32:
				playoff.setName("ΦΑΣΗ ΤΩΝ 32");
				break;
			case 16:
				playoff.setName("ΦΑΣΗ ΤΩΝ 16");
				break;
			case 8:
				playoff.setName("ΠΡΟΗΜΙΤΕΛΙΚΑ");
				break;
			case 4:
				playoff.setName("ΗΜΙΤΕΛΙΚΑ");
				break;
			case 2:
				playoff.setName("ΤΕΛΙΚΟΣ");
				break;
			
			default:
				playoff.setName(Integer.toString(phase));
				break;
			
			}
			this.generalDaoService.persist(playoff);
			
		}
		else {
			
			switch(phase) {
			case 32:
				playoff.setName("ΦΑΣΗ ΤΩΝ 32 - ΓΥΡΟΣ Α");
				playoff2.setName("ΦΑΣΗ ΤΩΝ 32 - ΓΥΡΟΣ Β");
				break;
			case 16:
				playoff.setName("ΦΑΣΗ ΤΩΝ 16 - ΓΥΡΟΣ Α");
				playoff2.setName("ΦΑΣΗ ΤΩΝ 16 - ΓΥΡΟΣ Β");
				break;
			case 8:
				playoff.setName("ΠΡΟΗΜΙΤΕΛΙΚΑ - ΓΥΡΟΣ Α");
				playoff2.setName("ΠΡΟΗΜΙΤΕΛΙΚΑ - ΓΥΡΟΣ Β");
				break;
			case 4:
				playoff.setName("ΗΜΙΤΕΛΙΚΑ - ΓΥΡΟΣ Α");
				playoff2.setName("ΗΜΙΤΕΛΙΚΑ - ΓΥΡΟΣ Β");
				break;
			case 2:
				playoff.setName("ΤΕΛΙΚΟΣ - ΓΥΡΟΣ Α");
				playoff2.setName("ΤΕΛΙΚΟΣ - ΓΥΡΟΣ Β");
				break;
			
			default:
				playoff.setName(Integer.toString(phase)+" ΓΥΡΟΣ Α");
				playoff2.setName(Integer.toString(phase)+ "ΓΥΡΟΣ Β");
				break;
			
			}
			this.generalDaoService.persist(playoff);
			this.generalDaoService.persist(playoff2);
			
		}
		
		
		
		for(int i=0;i<winTeams.size()-1;i++)
		{
			
			System.out.println("NEXTPLAYOFF "+winTeams.get(i).getName()+" vs "+winTeams.get(i+1).getName());
			Game game = new Game();
			game.setPlayoff(playoff);
			game.setChampion(playoff.getChampion());
			game.setTeam1(winTeams.get(i));
			game.setTeam2(winTeams.get(i+1));
			this.generalDaoService.persist(game);
			if(round==2) {
				Game game2 = new Game();
				game2.setPlayoff(playoff2);
				game2.setChampion(playoff2.getChampion());
				game2.setTeam1(winTeams.get(i+1));
				game2.setTeam2(winTeams.get(i));
				this.generalDaoService.persist(game2);
			}
			i++;
		}
	}
}
