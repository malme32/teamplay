package com.event.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;


import javax.transaction.Transactional;

import org.apache.commons.io.FilenameUtils;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.event.dao.ChampionDao;
import com.event.dao.GameDao;
import com.event.dao.GeneralDao;
import com.event.dao.MatchdayDao;
import com.event.dao.StandingDao;
import com.event.dao.TeamDao;
import com.event.dao.TeamgroupDao;
import com.phonebook.model.Contact;
import com.phonebook.service.ContactService;
import com.sport.model.Champion;
import com.sport.model.Game;
import com.sport.model.Matchday;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

@Service("sportService")
@Transactional
//@Cacheable(value = "entities", cacheManager = "springCM")
public class SportServiceImpl  implements SportService{


	@Autowired
	ChampionDao championDao;
	@Autowired
	TeamgroupDao teamgroupDao;
	@Autowired
	TeamDao teamDao;
	@Autowired
	MatchdayDao matchdayDao;
	@Autowired
	GeneralDaoService generalDaoService;
	
	@Autowired
	StandingDao standingDao;
	
	@Autowired
	GameDao gameDao;

	@Autowired
	ContactService contactService;
	
	@Override
	public Champion findChampionsById(int id) {
		// TODO Auto-generated method stub
		return championDao.findChampionsById(id);
	}

	@Override
	public List<Champion> findAllChampions() {
		// TODO Auto-generated method stub
		return championDao.findAllChampions();
	}

	@Override
	public List<Teamgroup> getTeamgroups(int championid) {
		// TODO Auto-generated method stub
		return championDao.getTeamgroups(championid);
	}

	@Override
	public Teamgroup findTeamgroupById(int id) {
		// TODO Auto-generated method stub
		return teamgroupDao.findById(id);
	}

	@Override
	public List<Matchday> getMatchdays(int matchdayid) {
		// TODO Auto-generated method stub
		return teamgroupDao.getMatchdays(matchdayid);
	}

	@Override
	public Team findTeamById(int id) {
		// TODO Auto-generated method stub
		return teamDao.findById(id);
	}

	@Override
	public Matchday findMatchdayById(int id) {
		// TODO Auto-generated method stub
		return matchdayDao.findById(id);
	}

	@Override
	public List<Game> getGames(int matchdayid) {
		// TODO Auto-generated method stub
		return matchdayDao.getGames(matchdayid);
	}

	@Override
	public List<Standing> getStandings(int teamgroupid) {
		// TODO Auto-generated method stub
		return teamgroupDao.getStandings(teamgroupid);
	}

	@Override
	public List<Team> findAllTeams() {
		// TODO Auto-generated method stub
		return teamDao.findAll();
	}

	@Override
	public void addTeamToTeamgroup(Teamgroup teamgroup, Team team) {
		// TODO Auto-generated method stub
		Standing standing = new Standing();
		standing.setTeam(team);
		standing.setTeamgroup(teamgroup);
		generalDaoService.persist(standing);
		Hibernate.initialize(teamgroup.getStandings());
		teamgroup.getStandings().add(standing);
		generalDaoService.update(standing);
	}

	@Override
	public void addNewTeamToTeamgroup(Teamgroup teamgroup, Team team) {
		// TODO Auto-generated method stub
		generalDaoService.persist(team);
		Standing standing = new Standing();
		standing.setTeam(team);
		standing.setTeamgroup(teamgroup);
		generalDaoService.persist(standing);
		Hibernate.initialize(teamgroup.getStandings());
		teamgroup.getStandings().add(standing);
		generalDaoService.update(standing);
	}

	@Override
	public void removeTeamFromTeamgroup(int teamgroupid,int teamid) {
		// TODO Auto-generated method stub
/*		Team team = findTeamById(teamid);
		Teamgroup teamgroup = findTeamgroupById(teamgroupid);
		System.out.println(team.getName());
		System.out.println(teamgroup.getName());
		System.out.println("XAXAXA");
		Hibernate.initialize(teamgroup.getStandings());
		teamgroup.getStandings().remove(team);
		
		generalDaoService.update(teamgroup);*/
	}

	@Override
	public Standing findStandingById(int id) {
		// TODO Auto-generated method stub
		return standingDao.findById(id);
	}

	@Override
	public void generateMatchgames(int teamgroupid, int roundNumber) {

		System.out.println("Generating matchgames");
		Teamgroup teamgroup = teamgroupDao.findById(teamgroupid);
		List<String> tmpList = new ArrayList<String>();
/*		for(Standing standing:teamgroup.getStandings())
		{
			
			System.out.println(standing.getTeam().getName());
			tmpList.add(standing.getTeam().getName());
			
		}*/
		writeMatchgames(teamgroup.getStandings(),teamgroup,roundNumber);
		// TODO Auto-generated method stub
		
	}
	
	private void writeMatchgames(List<Standing> StandingList,Teamgroup teamgroup,int roundNumber)
	{
	    List<Standing> ListTeam = new ArrayList<Standing>();

	    for(Standing team:StandingList) {
	    	ListTeam.add(team);
	    }
		
		if(ListTeam.size()==0)
			return;
		if(ListTeam.size()==1)
			return;
	    if (ListTeam.size() % 2 != 0)
	    {
	        ListTeam.add(null); // If odd number of teams add a dummy
	    }

	    int numDays = (ListTeam.size() - 1); // Days needed to complete tournament
	    int halfSize = ListTeam.size()  / 2;

	    List<Standing> teams = new ArrayList<Standing>();

	    for(Standing team:ListTeam) {
	    	teams.add(team);
	    }
	    teams.remove(0);

	    int teamsSize = teams.size();

	    for (int day = 0; day < numDays; day++)
	    {
	    	System.out.println( (day + 1));
	    	Matchday matchday = new Matchday();
	    	matchday.setName("Matchday"+ (day + 1));
	    	matchday.setTeamgroup(teamgroup);
	    	generalDaoService.persist(matchday);
	    	
	    	Matchday matchday2=null;
	    	
	    	if(roundNumber==2) {
	    		matchday2 = new Matchday();
		    	matchday2.setName("Matchday"+ (day + numDays+ 1));
		    	matchday2.setTeamgroup(teamgroup);
		    	generalDaoService.persist(matchday2);
	    	}
	    	
	        int teamIdx = day % teamsSize;
	    	if(teams.get(teamIdx)!=null&&ListTeam.get(0)!=null)
	    	{
	    		Game game1 = new Game();
	    		game1.setMatchday(matchday);
	    		game1.setTeam1(teams.get(teamIdx).getTeam());
	    		game1.setTeam2(ListTeam.get(0).getTeam());
	    		generalDaoService.persist(game1);
	    		
	    		if(roundNumber==2) {
		    		game1 = new Game();
		    		game1.setMatchday(matchday2);
		    		game1.setTeam1(ListTeam.get(0).getTeam());
		    		game1.setTeam2(teams.get(teamIdx).getTeam());
		    		generalDaoService.persist(game1);
	    		}
	    		
		        System.out.println( teams.get(teamIdx).getTeam().getName() + " vs " + ListTeam.get(0).getTeam().getName() );

	    	}

	        for (int idx = 1; idx < halfSize; idx++)
	        {               
	            int firstTeam = (day + idx) % teamsSize;
	            int secondTeam = (day  + teamsSize - idx) % teamsSize;
		    	if(teams.get(firstTeam)!=null&&teams.get(secondTeam)!=null)
		    	{
			        Game game = new Game();
			        game.setMatchday(matchday);
			        game.setTeam1(teams.get(firstTeam).getTeam());
			        game.setTeam2(teams.get(secondTeam).getTeam());
			    	generalDaoService.persist(game);
			    	

		    		if(roundNumber==2) {
				        game = new Game();
				        game.setMatchday(matchday2);
				        game.setTeam1(teams.get(secondTeam).getTeam());
				        game.setTeam2(teams.get(firstTeam).getTeam());
				    	generalDaoService.persist(game);
		    		}
			    	
		            System.out.println( teams.get(firstTeam).getTeam().getName()  + " vs " +teams.get(secondTeam).getTeam().getName() );

		    	}
	            
	        }
	    }
	}

	@Override
	public void deleteTeamgroupMatchdays(int teamgroupid) {
		// TODO Auto-generated method stub

		Teamgroup teamgroup = teamgroupDao.findById(teamgroupid);
		Hibernate.initialize(teamgroup.getMatchdays());
		teamgroup.getMatchdays().clear();
		teamgroup.setMatchdays(teamgroup.getMatchdays());
		generalDaoService.update(teamgroup);
		
	}

/*	@Override
	public void updateGame(Game game,Matchday matchday) {
		// TODO Auto-generated method stub
		//teamgroupDao.getGames(game.getTeam1());
		for(Game game1: teamgroupDao.getGames(game.getTeam1(),matchday.getTeamgroup()))
		{
			
			System.out.println(game1.getTeam1().getName());
			System.out.println(game1.getTeam2().getName());
		}
	}*/

	@Override
	public void updateStandings(Teamgroup teamgroup) 
	{
		// TODO Auto-generated method stub

		//Teamgroup teamgroup = matchday.getTeamgroup();
		
		Hibernate.initialize(teamgroup.getStandings());
		List<Standing> standings = teamgroup.getStandings();
		
		for(Standing standing:standings)
		{
				standing.setGoal(0);
				standing.setGoalplus(0);
				standing.setGoalminus(0);
				standing.setGrade(0);
				standing.setGame(0);
				standing.setWin(0);
				standing.setDefeat(0);
				standing.setDraw(0);
				Team team = standing.getTeam();
				//teamgroupDao.getGames(team,teamgroup);
				for(Game game: teamgroupDao.getGames(team,teamgroup))
				{

					Team team1 = game.getTeam1();
					Team team2 = game.getTeam2();
					try 
					{
						if(game.getScore1()!=null&&!game.getScore1().equals("")&&game.getScore2()!=null&&!game.getScore2().equals(""))
						{
							int score2 = Integer.parseInt(game.getScore2());
							int score1 = Integer.parseInt(game.getScore1());
							if(team1.getId()==team.getId()) {
								
									standing.setGoalplus(standing.getGoalplus()+score1);
									standing.setGoalminus(standing.getGoalminus()+score2);
									if(score1>score2)
										standing.setWin(standing.getWin()+1);
									else if(score1<score2)
										standing.setDefeat(standing.getDefeat()+1);
									else
										standing.setDraw(standing.getDraw()+1);

							}
							else if(team2.getId()==team.getId()) 
							{
						
								standing.setGoalplus(standing.getGoalplus()+score2);
								standing.setGoalminus(standing.getGoalminus()+score1);
								if(score2>score1)
									standing.setWin(standing.getWin()+1);
								else if(score2<score1)
									standing.setDefeat(standing.getDefeat()+1);
								else
									standing.setDraw(standing.getDraw()+1);
							}

							standing.setGame(standing.getGame()+1);
						}
					}
					catch(Exception e) {
						System.out.println("EXCEPTION "+e.getMessage());
					}
				}
				standing.setGrade(standing.getWin()*3+standing.getDraw());
				standing.setGoal(standing.getGoalplus()-standing.getGoalminus());
				//standing.setG(standing.getWin()*3+standing.getDraw());
				
		}
		generalDaoService.update(teamgroup);
	}

	@Override
	public Game findGameById(int id) {
		// TODO Auto-generated method stub
		return gameDao.findById(id);
	}

	@Override
	public void addGameToMatchday(int matchdayid, int gameid) {
		// TODO Auto-generated method stub
		Matchday matchday = matchdayDao.findById(matchdayid);
		Game game = gameDao.findById(gameid);
		Matchday oldMatchday = game.getMatchday();

		//System.out.println(game.getTeam1().getName());
		//Hibernate.initialize(oldMatchday.getGames());
		//oldMatchday.getGames().remove(game);
		
		//Hibernate.initialize(matchday.getGames());
		//matchday.getGames().add(game);
		if(matchday.getId()!=oldMatchday.getId())
		{
			game.setMatchday(matchday);
			generalDaoService.update(game);
		}
		//generalDaoService.update(oldMatchday);
	}

	@Override
	public List<Game> findTeamGames(int teamid) {
		// TODO Auto-generated method stub
		
		return teamDao.findGames(teamid);
	}

	@Override
	public List<Standing> findTeamStandings(int teamid) {
		// TODO Auto-generated method stub
		return teamDao.findStandings(teamid);
	}

	@Override
	public List<Contact> findTeamPlayers(int teamid) {
		// TODO Auto-generated method stub
		return teamDao.findPlayers(teamid);
	}

	@Override
	public void uploadTeamLogo(String path, int id, CommonsMultipartFile file) {
		Team team = teamDao.findById(id);
		// TODO Auto-generated method stub
        //String path=session.getServletContext().getRealPath("/");  
        //String filename=file.getOriginalFilename(); 
        String extension = FilenameUtils.getExtension(file.getOriginalFilename()); 
		String filename=String.valueOf(team.getId())+"."+extension;
        try{  
        byte barr[]=file.getBytes();  
          
        BufferedOutputStream bout=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/logo_"+filename));  
        bout.write(barr);  
        bout.flush();  
        bout.close();  
        team.setLogopath("/customimages/logo_"+filename);
        generalDaoService.update(team);
        }catch(Exception e){System.out.println(e);}  
        
        return;
	}

	@Override
	public void uploadTeamCover(String path, int id, CommonsMultipartFile file) {
		// TODO Auto-generated method stub
		Team team = teamDao.findById(id);
		// TODO Auto-generated method stub
        String extension = FilenameUtils.getExtension(file.getOriginalFilename()); 
		String filename=String.valueOf(team.getId())+"."+extension;
        try{  
        byte barr[]=file.getBytes();  
          
        BufferedOutputStream bout=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/cover_"+filename));  
        bout.write(barr);  
        bout.flush();  
        bout.close();  
        team.setCoverpath("/customimages/cover_"+filename);
        generalDaoService.update(team);
        }catch(Exception e){System.out.println(e);}  
        
        return;
	}

	@Override
	public void addPlayerToTeam(int teamid, int playerid) {
		// TODO Auto-generated method stub
		Team team = teamDao.findById(teamid);
		Contact contact = contactService.getContact(playerid);
		Hibernate.initialize(team.getPlayers());
		team.getPlayers().add(contact);
		generalDaoService.update(team);
	}

	@Override
	public Contact uploadPlayerImage(String path, int id, CommonsMultipartFile file) {
		// TODO Auto-generated method stub
		Contact contact = contactService.getContact(id);
		// TODO Auto-generated method stub
        String extension = FilenameUtils.getExtension(file.getOriginalFilename()); 
		String filename=String.valueOf(contact.getId())+"."+extension;
        try{  
        byte barr[]=file.getBytes();  
          
        BufferedOutputStream bout=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/playerimage_"+filename));  
        bout.write(barr);  
        bout.flush();  
        bout.close();  
        contact.setImagepath("/customimages/playerimage_"+filename);
        generalDaoService.update(contact);
        }catch(Exception e){System.out.println(e);}  
        
        return contact;
	}

	@Override
	public void updateTeam(Team team) {
		// TODO Auto-generated method stub
		//Team team1 = findTeamById(team.getId());
	//	Hibernate.initialize(team.getPlayers());
		//team.setPlayers(team1.getPlayers());
		generalDaoService.update(team);
	}
}
