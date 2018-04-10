package com.event.service;

import java.awt.Dimension;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.hibernate.Hibernate;
import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.event.controller.SportController;
import com.event.dao.AlbumDao;
import com.event.dao.ChampionDao;
import com.event.dao.CustompageDao;
import com.event.dao.GameDao;
import com.event.dao.GeneralDao;
import com.event.dao.ImageDao;
import com.event.dao.InformationDao;
import com.event.dao.MatchdayDao;
import com.event.dao.MessageDao;
import com.event.dao.NoticeDao;
import com.event.dao.PlayoffDao;
import com.event.dao.ScorerDao;
import com.event.dao.StandingDao;
import com.event.dao.TeamDao;
import com.event.dao.TeamgroupDao;
import com.general.model.Information;
import com.general.model.Message;
import com.phonebook.model.Contact;
import com.phonebook.model.Userrole;
import com.phonebook.service.ContactService;
import com.phonebook.service.MailService;
import com.phonebook.service.MyProperty;
import com.sport.amazon.S3AWSService;
import com.sport.model.Album;
import com.sport.model.Champion;
import com.sport.model.Custompage;
import com.sport.model.Game;
import com.sport.model.Image;
import com.sport.model.Matchday;
import com.sport.model.Notice;
import com.sport.model.Notification;
import com.sport.model.Playoff;
import com.sport.model.Scorer;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

@Service("sportService")
@Transactional
//@Cacheable(value = "entities", cacheManager = "springCM")
public class SportServiceImpl  implements SportService{


	@Autowired
	private MyProperty myProperty;
	
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
	
	@Autowired
	ScorerDao scorerDao;

	@Autowired
	NoticeDao noticeDao;
	
	@Autowired
	PlayoffService playoffService;

	@Autowired
	PlayoffDao playoffDao;
	
	@Autowired
	PasswordEncoder passwordEncoder;	
	
	@Autowired
	AlbumDao albumDao;
	
	@Autowired
	ImageDao imageDao;

	@Autowired
	MessageDao messageDao;

	@Autowired
	InformationDao informationDao;
	

	@Autowired
	CustompageDao custompageDao;
	

	@Autowired
	MailService mailService;
	
	@Override
	public Champion findChampionsById(int id) {
		// TODO Auto-generated method stub
		return championDao.findChampionsById(id);
	}

	@Override
	public List<Champion> findAllChampions() {
		// TODO Auto-generated method stub
		System.out.println("xaxaxa");
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
	public List<Team> findAllTeams(String orderby) {
		// TODO Auto-generated method stub
		if(orderby!=null)
			if(orderby.equals("messagedate"))
				return teamDao.findByMessageDate();
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
	
	@Override
	public void reGenerateMatchgames(int teamgroupid, int roundNumber) {

		System.out.println("Generating matchgames");
		Teamgroup teamgroup = teamgroupDao.findById(teamgroupid);
		List<String> tmpList = new ArrayList<String>();
/*		for(Standing standing:teamgroup.getStandings())
		{
			
			System.out.println(standing.getTeam().getName());
			tmpList.add(standing.getTeam().getName());
			
		}*/
		reWriteMatchdays(teamgroup.getStandings(),teamgroup,roundNumber);
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
	    	String startName=day<9?"ΑΓΩΝΙΣΤΙΚΗ 0":"ΑΓΩΝΙΣΤΙΚΗ ";
	    	matchday.setName(startName+ (day + 1));
	    	matchday.setTeamgroup(teamgroup);
	    	generalDaoService.persist(matchday);
	    	
	    	Matchday matchday2=null;
	    	
	    	if(roundNumber==2) {
	    		matchday2 = new Matchday();
		    	startName=(day + numDays)<9?"ΑΓΩΝΙΣΤΙΚΗ 0":"ΑΓΩΝΙΣΤΙΚΗ ";
		    	matchday2.setName(startName+ (day + numDays+ 1));
		    	matchday2.setTeamgroup(teamgroup);
		    	generalDaoService.persist(matchday2);
	    	}

	        int teamIdx = day % teamsSize;
	    	if(teams.get(teamIdx)!=null&&ListTeam.get(0)!=null)
	    	{
	    		Game game1 = new Game();
	    		game1.setMatchday(matchday);
		        game1.setChampion(matchday.getTeamgroup().getChampion());
	    		game1.setTeam1(teams.get(teamIdx).getTeam());
	    		game1.setTeam2(ListTeam.get(0).getTeam());
	    		generalDaoService.persist(game1);
	    		
	    		if(roundNumber==2) {
		    		game1 = new Game();
		    		game1.setMatchday(matchday2);
			        game1.setChampion(matchday2.getTeamgroup().getChampion());
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
			        game.setChampion(matchday.getTeamgroup().getChampion());
			        game.setTeam1(teams.get(firstTeam).getTeam());
			        game.setTeam2(teams.get(secondTeam).getTeam());
			    	generalDaoService.persist(game);
			    	

		    		if(roundNumber==2) {
				        game = new Game();
				        game.setMatchday(matchday2);
				        game.setChampion(matchday2.getTeamgroup().getChampion());
				        game.setTeam1(teams.get(secondTeam).getTeam());
				        game.setTeam2(teams.get(firstTeam).getTeam());
				    	generalDaoService.persist(game);
		    		}
			    	
		            System.out.println( teams.get(firstTeam).getTeam().getName()  + " vs " +teams.get(secondTeam).getTeam().getName() );

		    	}
	            
	        }
	    }
	}

	private void reWriteMatchdays(List<Standing> StandingList,Teamgroup teamgroup,int roundNumber)
	{
		

		List<Game> games = teamgroupDao.getAllGames(teamgroup);
/*		for(Matchday matchday:matchdays) {
			for(Matchday matchday:matchdays) {
				Hibernate.initialize(teamgroup.getMatchdays());
				
			}
		}*/
		System.out.println("REWRITING...");
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
	    	String startName=day<9?"ΑΓΩΝΙΣΤΙΚΗ 0":"ΑΓΩΝΙΣΤΙΚΗ ";
	    	matchday.setName(startName+ (day + 1));
	    	matchday.setTeamgroup(teamgroup);
	    	generalDaoService.persist(matchday);
	    	
	    	Matchday matchday2=null;
	    	
	    	if(roundNumber==2) {
	    		matchday2 = new Matchday();
		    	startName=(day + numDays)<9?"ΑΓΩΝΙΣΤΙΚΗ 0":"ΑΓΩΝΙΣΤΙΚΗ ";
		    	matchday2.setName(startName+ (day + numDays+ 1));
		    	matchday2.setTeamgroup(teamgroup);
		    	generalDaoService.persist(matchday2);
	    	}

	        int teamIdx = day % teamsSize;
	    	if(teams.get(teamIdx)!=null&&ListTeam.get(0)!=null)
	    	{
	    		boolean found=false;
	    		for(Game game:games) {
	    			if(game.getTeam1().getId()==teams.get(teamIdx).getTeam().getId()
	    					&& game.getTeam2().getId()==ListTeam.get(0).getTeam().getId())
	    			{
	    				game.setMatchday(matchday);
	    	    		generalDaoService.update(game);
	    	    		found = true;
	    				break;
	    			}
	    		}
	    		if(!found)
	    		{

		    		Game game1 = new Game();
		    		game1.setTeam1(teams.get(teamIdx).getTeam());
		    		game1.setTeam2(ListTeam.get(0).getTeam());
		    		game1.setMatchday(matchday);
			        game1.setChampion(matchday.getTeamgroup().getChampion());
		    		generalDaoService.persist(game1);
	    		}
	    		if(roundNumber==2) {
		    		found = false;
		    		for(Game game:games) {
		    			if(game.getTeam1().getId()==ListTeam.get(0).getTeam().getId()
		    					&& game.getTeam2().getId()==teams.get(teamIdx).getTeam().getId())
		    			{
		    				game.setMatchday(matchday2);
		    	    		generalDaoService.update(game);
		    	    		found = true;
		    				break;
		    			}
		    		}
		    		if(!found)
		    		{

		    			Game  game1 = new Game();
			    		game1.setMatchday(matchday2);
			    		game1.setTeam1(ListTeam.get(0).getTeam());
			    		game1.setTeam2(teams.get(teamIdx).getTeam());
				        game1.setChampion(matchday2.getTeamgroup().getChampion());
			    		generalDaoService.persist(game1);
		    		}
	    		}
	    		
		        System.out.println( teams.get(teamIdx).getTeam().getName() + " vs " + ListTeam.get(0).getTeam().getName() );

	    	}

	        for (int idx = 1; idx < halfSize; idx++)
	        {               
	            int firstTeam = (day + idx) % teamsSize;
	            int secondTeam = (day  + teamsSize - idx) % teamsSize;
		    	if(teams.get(firstTeam)!=null&&teams.get(secondTeam)!=null)
		    	{
		    		
		     		boolean found=false;
		    		for(Game game:games) {
		    			if(game.getTeam1().getId()==teams.get(firstTeam).getTeam().getId()
		    					&& game.getTeam2().getId()==teams.get(secondTeam).getTeam().getId())
		    			{
		    				game.setMatchday(matchday);
		    	    		generalDaoService.update(game);
		    	    		found = true;
		    				break;
		    			}
		    		}
		    		if(!found)
		    		{
				        Game game1 = new Game();
				        game1.setMatchday(matchday);
				        game1.setChampion(matchday.getTeamgroup().getChampion());
				        game1.setTeam1(teams.get(firstTeam).getTeam());
				        game1.setTeam2(teams.get(secondTeam).getTeam());
				    	generalDaoService.persist(game1);
		    		}
			    	

		    		if(roundNumber==2) {
		    			found=false;
			    		for(Game game:games) {
			    			if(game.getTeam1().getId()==teams.get(secondTeam).getTeam().getId()
			    					&& game.getTeam2().getId()==teams.get(firstTeam).getTeam().getId())
			    			{
			    				game.setMatchday(matchday2);
			    	    		generalDaoService.update(game);
			    	    		found = true;
			    				break;
			    			}
			    		}
			    		if(!found)
			    		{
					        Game game1 = new Game();
					        game1.setMatchday(matchday2);
					        game1.setChampion(matchday2.getTeamgroup().getChampion());
					        game1.setTeam1(teams.get(secondTeam).getTeam());
					        game1.setTeam2(teams.get(firstTeam).getTeam());
					    	generalDaoService.persist(game1);
			    		}
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
	@Override
	public void updateGame(Game game, Playoff playoff) {
		// TODO Auto-generated method stub
		if(game.getDate()!=null)
		{
			Date now = new Date();
			if(game.getDate().compareTo(now)>0)
			{
				Information info1 = new Information();
				Information info2 = new Information();
				info1.setTitle("Ενημέρωση Αγώνα!");
				info2.setTitle("Ενημέρωση Αγώνα!");
				info1.setGame(game);
				info2.setGame(game);
				info1.setTeam(game.getTeam1());
				info2.setTeam(game.getTeam2());

				info1.setDate(now);
				info2.setDate(now);

				info1.setMessage(game.getTeam1().getName()+" - "+game.getTeam2().getName() +" ("+game.getDate()+")");
				info2.setMessage(game.getTeam1().getName()+" - "+game.getTeam2().getName() +" ("+game.getDate()+")");

				generalDaoService.persist(info1);
				generalDaoService.persist(info2);

				(new Thread() {
					  public void run() {
				System.out.println("ATTEMPTING TO SEND MAIL");
				Hibernate.initialize(game.getTeam1().getAdmin());
				Contact admin1=game.getTeam1().getAdmin();
				List<Contact> contacts=contactService.getContacts();
				for(Contact contact:contacts) {
					if(contact.getAdminteam()!=null&&contact.getAdminteam().getId()==game.getTeam1().getId())
					{

						admin1=contact;
						break;
					}
				}
				if(admin1!=null)
				{
				
					if(admin1.getEmail()!=null&&admin1.getEmail().contains("@"))
						mailService.sendEmail(admin1.getEmail(), "soccer@mail.com", "Ενημέρωση Αγώνα "+game.getTeam1().getName()+"!", game.getTeam1().getName()+" - "+game.getTeam2().getName() +" ("+game.getDate()+")");
					else
						System.out.println("MAIL2 NULL");
				
				}
				else

					System.out.println("ADMIN1 NULL");

							Hibernate.initialize(game.getTeam2().getAdmin());
							Contact admin2=game.getTeam2().getAdmin();
							for(Contact contact:contacts) {
								if(contact.getAdminteam()!=null&&contact.getAdminteam().getId()==game.getTeam2().getId())
								{

									admin2=contact;
									break;
								}
							}
							if(admin2!=null)
							{
							
								if(admin2.getEmail()!=null&&admin2.getEmail().contains("@"))
									mailService.sendEmail(admin2.getEmail(), "soccer@mail.com", "Ενημέρωση Αγώνα "+game.getTeam2().getName()+"!", game.getTeam1().getName()+" - "+game.getTeam2().getName() +" ("+game.getDate()+")");
								else
									System.out.println("MAIL2 NULL");
									
							}
							else

								System.out.println("ADMIN2 NULL");
					  }
					 }).start();
			}
		}
		game.setPlayoff(playoff);
		generalDaoService.update(game);
	}
	
	@Override
	public void updateGame(Game game,Matchday matchday) {
		// TODO Auto-generated method stub
		//teamgroupDao.getGames(game.getTeam1());
		game.setMatchday(matchday);
		generalDaoService.update(game);
		this.updateStandings(matchday.getTeamgroup());
		if(game.getDate()!=null)
		{
			Date now = new Date();
			if(game.getDate().compareTo(now)>0)
			{
				Information info1 = new Information();
				Information info2 = new Information();
				info1.setTitle("Νέος Αγώνας!");
				info2.setTitle("Νέος Αγώνας!");
				info1.setTeam(game.getTeam1());
				info2.setTeam(game.getTeam2());
				info1.setGame(game);
				info2.setGame(game);

				info1.setDate(now);
				info2.setDate(now);
				info1.setMessage(game.getTeam1().getName()+" - "+game.getTeam2().getName() +" ("+game.getDate()+")");

				info1.setMessage(game.getTeam1().getName()+" - "+game.getTeam2().getName() +" ("+game.getDate()+")");
				info2.setMessage(game.getTeam1().getName()+" - "+game.getTeam2().getName() +" ("+game.getDate()+")");

				generalDaoService.persist(info1);
				generalDaoService.persist(info2);
				
				(new Thread() {
					  public void run() {
				System.out.println("ATTEMPTING TO SEND MAIL");
				Hibernate.initialize(game.getTeam1().getAdmin());
				Contact admin1=game.getTeam1().getAdmin();
				List<Contact> contacts=contactService.getContacts();
				for(Contact contact:contacts) {
					if(contact.getAdminteam()!=null&&contact.getAdminteam().getId()==game.getTeam1().getId())
					{

						admin1=contact;
						break;
					}
				}
				if(admin1!=null)
				{
				
					if(admin1.getEmail()!=null&&admin1.getEmail().contains("@"))
						mailService.sendEmail(admin1.getEmail(), "soccer@mail.com", "Νέος Αγώνας "+game.getTeam1().getName()+"!", game.getTeam1().getName()+" - "+game.getTeam2().getName() +" ("+game.getDate()+")");
					else
						System.out.println("MAIL2 NULL");
				
				}
				else

					System.out.println("ADMIN1 NULL");

							Hibernate.initialize(game.getTeam2().getAdmin());
							Contact admin2=game.getTeam2().getAdmin();
							for(Contact contact:contacts) {
								if(contact.getAdminteam()!=null&&contact.getAdminteam().getId()==game.getTeam2().getId())
								{

									admin2=contact;
									break;
								}
							}
							if(admin2!=null)
							{
							
								if(admin2.getEmail()!=null&&admin2.getEmail().contains("@"))
									mailService.sendEmail(admin2.getEmail(), "soccer@mail.com", "Νέος Αγώνας "+game.getTeam2().getName()+"!", game.getTeam1().getName()+" - "+game.getTeam2().getName() +" ("+game.getDate()+")");
								else
									System.out.println("MAIL2 NULL");
									
							}
							else

								System.out.println("ADMIN2 NULL");
					  }
					 }).start();
		
				
			}
		}
	}

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
        
        Random rand=new Random();

        int randomNum = rand.nextInt((10000) + 1) + 0;
        
		String filename=String.valueOf(randomNum+"_"+team.getId())+"."+extension;
        try{  
        byte barr[]=file.getBytes();  
          
        BufferedOutputStream bout=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/logo_"+filename));  
        bout.write(barr);  
        bout.flush();  
        bout.close();  

        //AWS S3 Related
        uploadToS3(path+"/resources/theme1/customimages/logo_"+filename);
        
        ByteArrayInputStream bais = new ByteArrayInputStream(barr);
        BufferedImage resizeMe = ImageIO.read(bais);
        Dimension newMaxSize = new Dimension(60, 60);
        BufferedImage resizedImg = Scalr.resize(resizeMe, Method.QUALITY, newMaxSize.width, newMaxSize.height);
        
        BufferedOutputStream bout1=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/logo_thumb_"+filename));  
        
        ImageIO.write(resizedImg, extension, bout1);
    
        bout1.flush();  
        bout1.close();  

        //AWS S3 Related
        uploadToS3(path+"/resources/theme1/customimages/logo_thumb_"+filename);
        
        if(!team.getLogopath().contains("default"))
        {
			File file1 = new File(path+"/resources/theme1/"+team.getLogopath());
			file1.delete();
			
			file1 = new File(path+"/resources/theme1/"+team.getLogothumbpath());
			file1.delete();
			System.out.println("DEFAULT_TEAM_THUMB_DELETED");
			
			//AWS S3 Related
			deleteFromS3("theme1"+team.getLogopath());
			deleteFromS3("theme1"+team.getLogothumbpath());
		
        }
        
        
        team.setLogothumbpath("/customimages/logo_thumb_"+filename);
        
        team.setLogopath("/customimages/logo_"+filename);
        generalDaoService.update(team);
        }catch(Exception e){System.out.println(e);}  
        
        return;
	}

	public static File multipartToFile(CommonsMultipartFile multipart) throws IllegalStateException, IOException 
	{
	    File convFile = new File( multipart.getOriginalFilename());
	    multipart.transferTo(convFile);
	    return convFile;
	}
	public static File convert(CommonsMultipartFile file) throws IOException
	{    
	   /* File convFile = new File(file.getOriginalFilename());
	    convFile.createNewFile(); 
	    FileOutputStream fos = new FileOutputStream(convFile); 
	    fos.write(file.getBytes());
	    fos.close(); 
	    return convFile;*/
	    
	    File file1 = new File("/tmp", "myfile");

	 // Create the file using the touch method of the FileUtils class.
	 // FileUtils.touch(file);

	 // Write bytes from the multipart file to disk.
	 FileUtils.writeByteArrayToFile(file1, file.getBytes());
	 return file1;

	}
	
	//AWS
	public void uploadToS3(String path) {
		
        if(myProperty.isS3AWSEnabled())
        {
    		System.out.println("uploading to s3");
        	File file1 = new File(path);

			S3AWSService.uploadFile(file1,"theme1/customimages/"+file1.getName());
			System.out.println("uploaded to s3");
        }
        
	}
	
	//AWS related
	public  void deleteFromS3(String path) {
        if(myProperty.isS3AWSEnabled())
        {
    		System.out.println("deleting from s3");
    		S3AWSService.deletebject(path);
			System.out.println("deleted from s3");
        }
        
	}
	
	
	@Override
	public void uploadTeamCover(String path, int id, CommonsMultipartFile file) {
		// TODO Auto-generated method stub

		Team team = teamDao.findById(id);
		// TODO Auto-generated method stub
        //String path=session.getServletContext().getRealPath("/");  
        //String filename=file.getOriginalFilename(); 
        String extension = FilenameUtils.getExtension(file.getOriginalFilename()); 
        
        Random rand=new Random();

        int randomNum = rand.nextInt((10000) + 1) + 0;
        
		String filename=String.valueOf(randomNum+"_"+team.getId())+"."+extension;
        try{  
        byte barr[]=file.getBytes();  
          
        BufferedOutputStream bout=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/cover_"+filename));  
        bout.write(barr);  
        bout.flush();  
        bout.close();
        
        //AWS S3 Related
        uploadToS3(path+"/resources/theme1/customimages/cover_"+filename);
        

        ByteArrayInputStream bais = new ByteArrayInputStream(barr);
        BufferedImage resizeMe = ImageIO.read(bais);
        Dimension newMaxSize = new Dimension(60, 60);
        BufferedImage resizedImg = Scalr.resize(resizeMe, Method.QUALITY, newMaxSize.width, newMaxSize.height);
        
        BufferedOutputStream bout1=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/cover_thumb_"+filename));  
        
        ImageIO.write(resizedImg, extension, bout1);
    
        bout1.flush();  
        bout1.close();  

        //AWS S3 Related
        uploadToS3(path+"/resources/theme1/customimages/cover_thumb_"+filename);
        
        if(!team.getCoverpath().contains("default"))
        {
			File file1 = new File(path+"/resources/theme1/"+team.getCoverpath());
			file1.delete();
		
			file1 = new File(path+"/resources/theme1/"+team.getCoverthumbpath());
			file1.delete();
			System.out.println("TEAM_COVER_DELETED");
			
			//AWS S3 Related
			deleteFromS3("theme1"+team.getCoverpath());
			deleteFromS3("theme1"+team.getCoverthumbpath());
			
        }
        
        
        team.setCoverpath("/customimages/cover_"+filename);
        team.setCoverthumbpath("/customimages/cover_thumb_"+filename);
    
        generalDaoService.update(team);
        }catch(Exception e){System.out.println(e);}  
        
        return;
		////////////////////////////////////////////////////////////////////////////////
		
        /*	Team team = teamDao.findById(id);
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
        
        return;*/
	}
	
	@Override
	public Notice uploadNoticeImage(String path, int id, CommonsMultipartFile file) {
		// TODO Auto-generated method stub
		Notice notice = this.findNewsById(id);
		// TODO Auto-generated method stub
        String extension = FilenameUtils.getExtension(file.getOriginalFilename()); 
        
        Random rand=new Random();

        int randomNum = rand.nextInt((10000) + 1) + 0;
        
		String filename=String.valueOf(randomNum+"_"+notice.getId())+"."+extension;
		
        try{  
        byte barr[]=file.getBytes();  
          
        BufferedOutputStream bout=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/noticeimage_"+filename));  
        bout.write(barr);  
        bout.flush();  
        bout.close();  
        
        //AWS S3 Related
        uploadToS3(path+"/resources/theme1/customimages/noticeimage_"+filename);
        
        ByteArrayInputStream bais = new ByteArrayInputStream(barr);
        BufferedImage resizeMe = ImageIO.read(bais);
        Dimension newMaxSize = new Dimension(350, 350);
        BufferedImage resizedImg = Scalr.resize(resizeMe, Method.QUALITY, newMaxSize.width, newMaxSize.height);
        
        BufferedOutputStream bout1=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/noticethumb_"+filename));  
        
        ImageIO.write(resizedImg, extension, bout1);
    
        bout1.flush();  
        bout1.close();  

        //AWS S3 Related
        uploadToS3(path+"/resources/theme1/customimages/noticethumb_"+filename);
        
        
        
        if(!notice.getImageurl().contains("default"))
        {
			File file1 = new File(path+"/resources/theme1/"+notice.getImageurl());
			file1.delete();
			
			file1 = new File(path+"/resources/theme1/"+notice.getThumburl());
			file1.delete();
			//AWS S3 Related
			deleteFromS3("theme1"+notice.getImageurl());
			deleteFromS3("theme1"+notice.getThumburl());
			
        }
        
        notice.setThumburl("/customimages/noticethumb_"+filename);
        
        notice.setImageurl("/customimages/noticeimage_"+filename);
        generalDaoService.update(notice);
        }catch(Exception e){System.out.println(e);}  
        
        return notice;
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
        
        
        Random rand=new Random();

        int randomNum = rand.nextInt((10000) + 1) + 0;
		String filename=randomNum+"_"+String.valueOf(contact.getId())+"."+extension;
        try{  
        byte barr[]=file.getBytes();  
          
      /*  BufferedOutputStream bout=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/playerimage_"+filename));  
        bout.write(barr);  
        bout.flush();  
        bout.close();  */

        
        ByteArrayInputStream bais = new ByteArrayInputStream(barr);
        BufferedImage resizeMe = ImageIO.read(bais);
        Dimension newMaxSize = new Dimension(400, 400);
        BufferedImage resizedImg = Scalr.resize(resizeMe, Method.QUALITY, newMaxSize.width, newMaxSize.height);
        
        BufferedOutputStream bout1=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/playerimage_"+filename));  
        
        ImageIO.write(resizedImg, extension, bout1);
    
        bout1.flush();  
        bout1.close();  
        
        //AWS S3 Related
        uploadToS3(path+"/resources/theme1/customimages/playerimage_"+filename);
        
        
        if(!contact.getImagepath().contains("default"))
        {
			File file1 = new File(path+"/resources/theme1/"+contact.getThumbpath());
			file1.delete();
			file1 = new File(path+"/resources/theme1/"+contact.getImagepath());
			file1.delete();
			

				
				//AWS S3 Related
			deleteFromS3("theme1"+contact.getThumbpath());
			deleteFromS3("theme1"+contact.getImagepath());
			
        }
        
        
        bais = new ByteArrayInputStream(barr);
        resizeMe = ImageIO.read(bais);
        newMaxSize = new Dimension(60, 60);
        resizedImg = Scalr.resize(resizeMe, Method.QUALITY, newMaxSize.width, newMaxSize.height);
        
        bout1=new BufferedOutputStream(  
                 new FileOutputStream(path+"/resources/theme1/customimages/playerthumb_"+filename));  
        
        ImageIO.write(resizedImg, extension, bout1);
    
        bout1.flush();  
        bout1.close();  

        //AWS S3 Related
        uploadToS3(path+"/resources/theme1/customimages/playerthumb_"+filename);
        
        contact.setThumbpath("/customimages/playerthumb_"+filename);
        
        
        
        contact.setImagepath("/customimages/playerimage_"+filename);
        generalDaoService.update(contact);
        }catch(Exception e){System.out.println(e);}  
        
        return contact;
	}

	@Override
	public void updateTeam(Team team) {
		// TODO Auto-generated method stub
		Team team1 = findTeamById(team.getId());
		team1.setName(team.getName());
		team1.setDescription(team.getDescription());
		team1.setLocked(team.getLocked());
	//	Hibernate.initialize(team.getPlayers());
		//team.setPlayers(team1.getPlayers());
		
		generalDaoService.update(team1);
	}

	@Override
	public List<Scorer> findGameScorers(int id1) {
		// TODO Auto-generated method stub
		Game game = gameDao.findById(id1);
		
		//Scorer scorer =scorerDao.findById(id1);
		Hibernate.initialize(game.getScorers());
		
		for(int i=0;i<game.getScorers().size();i++)
		{
			Scorer scorer = game.getScorers().get(i);
			Hibernate.initialize(scorer.getContact().getTeams());
			if(scorer.getContact().getTeams().size()>0)
				scorer.setTeam(scorer.getContact().getTeams().get(0));

		}	

		return game.getScorers() ;
	}

	@Override
	public List<Scorer> findTeamgroupScorers(int id1) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Teamgroup teamgroup =teamgroupDao.findById(id1);
				
		Hibernate.initialize(teamgroup.getScorers());
		for(int i=0;i<teamgroup.getScorers().size();i++)
		{
			Scorer scorer = teamgroup.getScorers().get(i);
			Hibernate.initialize(scorer.getContact().getTeams());
			if(scorer.getContact().getTeams().size()>0)
				scorer.setTeam(scorer.getContact().getTeams().get(0));

		}
		return teamgroup.getScorers() ;

	}

	@Override
	public Scorer findScorerById(int id) {
		// TODO Auto-generated method stub
		
		
		return scorerDao.findById(id);
	}

/*	@Override
	public List<Notice> findAllNews() {
		// TODO Auto-generated method stub
		return noticeDao.findAll();
	}*/

	@Override
	public List<Notice> findAllNews(int count, boolean headersonly, String option) {
		// TODO Auto-generated method stub
		if(option!=null)
		{
			if(option.equals("important"))
				return noticeDao.findImportant();
		}
		if(count>0||headersonly)
		{
			List<Notice> tmpList = new ArrayList<Notice>();
			List<Notice> list = noticeDao.findAll();
			
			if(count==0)
				count=list.size();
			
			for(int i=0;i<list.size()&&i<count;i++)
			{
				Notice notice = list.get(i);
				if(headersonly)
				{
					Notice newNotice = new Notice();
					newNotice.setTitle(notice.getTitle());
					newNotice.setDate(notice.getDate());
					newNotice.setId(notice.getId());
					newNotice.setImageurl(notice.getImageurl());
					newNotice.setThumburl(notice.getThumburl());
					tmpList.add(newNotice);
				}
				else
				tmpList.add(notice);
			}
				
			return tmpList;
		}
		return  noticeDao.findAll();
	}

	@Override
	public Notice findNewsById(int id) {
		// TODO Auto-generated method stub
		
		return noticeDao.findById(id);
	
	}


	@Override
	public void genPlayoffs(int championid, int phase, int round) {
		// TODO Auto-generated method stub
		
		playoffService.generatePlayoff(this.findChampionsById(championid), phase, round);
		return ;
	}

	@Override
	public List<Playoff> getPlayoffGames(int championid, Integer phase) {
		// TODO Auto-generated method stub
		Champion champion = this.findChampionsById(championid);
		Hibernate.initialize(champion.getPlayoffs());
	// TODO Auto-generated method stub;
		if(phase==null) {
			for(Playoff playoff : champion.getPlayoffs())
				Hibernate.initialize(playoff.getGames());
			return champion.getPlayoffs();
		
		}
		else {

			List<Playoff> list= new ArrayList<Playoff>();
			for(Playoff playoff : champion.getPlayoffs())
				if(playoff.getPhase().equals(phase))
				{
					Hibernate.initialize(playoff.getGames());
					list.add(playoff);

				}
			return list;
		}
		

	}

	@Override
	public Playoff findPlayoffById(int id) {
		// TODO Auto-generated method stub
		return playoffDao.findById(id);
	}

	@Override
	public void updatePlayoff(Playoff playoff, Champion champion) {
		// TODO Auto-generated method stub
	    Playoff playoff1 = this.findPlayoffById(playoff.getId());
	
		playoff1.setName(playoff.getName());
		playoff1.setPhase(playoff.getPhase());
		generalDaoService.update(playoff1);
	}

	@Override
	public void addNewAdminUserToTeam(Contact contact, int id1) {
		// TODO Auto-generated method stub
		contact.setAdminteam(this.findTeamById(id1));
		contact.setEnabled(true);
		String temp_password=contact.getPassword();
		contact.setPassword(passwordEncoder.encode(contact.getPassword()));
		Userrole userrole =new Userrole();
		userrole.setContact(contact);
		userrole.setRole("ROLE_TEAM");
		
		generalDaoService.persist(contact);
		generalDaoService.persist(userrole);
		
		
		(new Thread() {
			  public void run() {
		System.out.println("ATTEMPTING TO SEND MAIL TO USER");

		
			if(contact.getEmail()!=null&&contact.getEmail().contains("@"))
				mailService.sendEmail(contact.getEmail(), "soccer@mail.com", "Καλως ηλθατε στο "+myProperty.getAppName(), "Τα στοιχεία της εγγραφής σας είναι:\nUsername: "+ contact.getUsername()+" \n Password: "+temp_password+"\n\nΚατεβαστε την εφαρμογη εδω:\n"+myProperty.getAndroidAppLink());
			else
				System.out.println("MAIL NULL");
			  }
			 }).start();
		
		
	}

	@Override
	public List<Game> getUpcomingGames() {
		// TODO Auto-generated method stub
/*		
		List<Game> games = gameDao.getUpcomingGames();
		List<Game> upcomingGames= new ArrayList<Game>();
		 Date datenow = new Date();
		for(Game game:games)
			if(game.getDate()!=null&&game.getScore1()==null&&game.getDate().after(datenow))
			{
				if(game.getPlayoff()!=null)
				{
					if(game.getPlayoff().getChampion().isEnabled())
					{
						game.setChampion(game.getPlayoff().getChampion());
						upcomingGames.add(game);
						
					}
				}
				else if(game.getMatchday()!=null) 
				{
					if(game.getMatchday().getTeamgroup().getChampion().isEnabled())
					{
						game.setChampion(game.getMatchday().getTeamgroup().getChampion());
						upcomingGames.add(game);
					}
				}
				
				
			}
		*/
		List<Game> games = gameDao.getUpcomingGames();
/*		for(Game game:games)
		{
			if(game.getPlayoff()!=null)
				game.setChampion(game.getPlayoff().getChampion());
			else if(game.getMatchday()!=null) 
				game.setChampion(game.getMatchday().getTeamgroup().getChampion());
		}*/
		return games;
	}

	@Override
	public List<Album> getAlbums() {
		
		// TODO Auto-generated method stub
		//Hibernate.initialize(albumDao.findAll());
		List<Album> albums = albumDao.findAll();
		for(Album album:albums)
			Hibernate.initialize(album.getImages());
		
		return albums;
	}

	@Override
	public void uploadAlbumImages(String path, int id, CommonsMultipartFile[] files) {
		// TODO Auto-generated method stub
		
		Album album = albumDao.findById(id);
		for(CommonsMultipartFile file:files)
		{
			
	        try{  
			Image image = new Image();
			generalDaoService.persist(image);
	        String extension = FilenameUtils.getExtension(file.getOriginalFilename()); 
			String filename=String.valueOf("album"+album.getId()+"_image"+ image.getId())+"."+extension;
	        byte barr[]=file.getBytes();  
	        
        
	        BufferedOutputStream bout=new BufferedOutputStream(  
	                 new FileOutputStream(path+"/resources/theme1/customimages/albumimage_"+filename));  
	        bout.write(barr);  
	        bout.flush();  
	        bout.close();  

	        //AWS S3 Related
	        uploadToS3(path+"/resources/theme1/customimages/albumimage_"+filename);
	        
	        
	        ByteArrayInputStream bais = new ByteArrayInputStream(barr);
	        BufferedImage resizeMe = ImageIO.read(bais);
	        Dimension newMaxSize = new Dimension(255, 255);
	        BufferedImage resizedImg = Scalr.resize(resizeMe, Method.QUALITY, newMaxSize.width, newMaxSize.height);
	        
	        BufferedOutputStream bout1=new BufferedOutputStream(  
	                 new FileOutputStream(path+"/resources/theme1/customimages/albumimage_thumb_"+filename));  
	        
	        ImageIO.write(resizedImg, extension, bout1);
	    
	        bout1.flush();  
	        bout1.close();  

	        //AWS S3 Related
	        uploadToS3(path+"/resources/theme1/customimages/albumimage_thumb_"+filename);
	        
			
	        image.setThumburl("/customimages/albumimage_thumb_"+filename);
	        image.setUrl("/customimages/albumimage_"+filename);
	        image.setAlbum(album);
	        generalDaoService.update(image);
	       
	        }catch(Exception e){System.out.println(e);
            }  
	        
	        //return ;
		
		}
	}

	@Override
	public Image findImageById(int id) {
		// TODO Auto-generated method stub
		
		return imageDao.findById(id);
	}

	@Override
	public void deleteImage(String path, int id) {
		// TODO Auto-generated method stub
		Image image = this.findImageById(id);
		File file = new File(path+"resources/theme1"+image.getUrl());
		System.out.println("Image to be deleted: "+ path+"resources/theme1"+image.getUrl());
		if(file.delete()){
			System.out.println(file.getName() + " is deleted!");
		}else{
			System.out.println("Delete operation is failed.");
		}
		System.out.println("Image thumb to be deleted: "+ path+"resources/theme1"+image.getThumburl());
		file = new File(path+"resources/theme1"+image.getThumburl());

		if(file.delete()){
			System.out.println(file.getName() + " is deleted!");
		}else{
			System.out.println("Delete operation is failed.");
		}	
		//AWS S3 Related
		deleteFromS3("theme1"+image.getUrl());
		deleteFromS3("theme1"+image.getThumburl());
		if(image.getCustompage()!=null)
		{
			Custompage custompage = image.getCustompage();
			/*for(Image image1: custompage.getImages())
			{
				if(image1.getId()==image.getId())
				{
					custompage.getImages().remove(image1);
					break;
				}
				
			}*/
			custompage.getImages().remove(image);
			custompage.setImages(custompage.getImages());
			generalDaoService.update(custompage);
			generalDaoService.delete(image);
		}
		else
		//generalDaoService.deleteNewSession(image);
			generalDaoService.delete(image);
		
	
	}

	@Override
	public void deleteAlbum(String path, int id) {
		// TODO Auto-generated method stub
		Album album = albumDao.findById(id);
		Hibernate.initialize(album.getImages());
		for(Image image:album.getImages())
		{
			File file = new File(path+"/resources/theme1/"+image.getUrl());
			file.delete();

			file = new File(path+"/resources/theme1/"+image.getThumburl());
			file.delete();

			//AWS S3 Related
			deleteFromS3("theme1"+image.getUrl());
			deleteFromS3("theme1"+image.getThumburl());

			
		}
		generalDaoService.delete(album);
	}

	@Override
	public void editAlbum(Album album) {
		// TODO Auto-generated method stub
		Album persistedAlbum = albumDao.findById(album.getId());
		persistedAlbum.setName(album.getName());
		album=null;
		generalDaoService.update(persistedAlbum);
	}

	@Override
	public void deleteTeam(String path, int id) {
		// TODO Auto-generated method stub
		Team team = this.findTeamById(id);
		if(!team.getLogopath().contains("default"))
		{
			File file = new File(path+"/resources/theme1/"+team.getLogopath());
			file.delete();
			file = new File(path+"/resources/theme1/"+team.getLogothumbpath());
			file.delete();
			
			//AWS S3 Related
			deleteFromS3("theme1"+team.getLogopath());
			deleteFromS3("theme1"+team.getLogothumbpath());
		}
		if(!team.getCoverpath().contains("default"))
		{

			File file = new File(path+"/resources/theme1/"+team.getCoverpath());
			file.delete();

			file = new File(path+"/resources/theme1/"+team.getCoverthumbpath());
			file.delete();
			
			//AWS S3 Related
			deleteFromS3("theme1"+team.getCoverpath());
			deleteFromS3("theme1"+team.getCoverthumbpath());

		}

		Hibernate.initialize(team.getPlayers());
		for(Contact contact:team.getPlayers())
		{	
			if(!contact.getImagepath().contains("default"))
			{
				File file = new File(path+"/resources/theme1/"+contact.getImagepath());
				file.delete();
				file = new File(path+"/resources/theme1/"+contact.getThumbpath());
				file.delete();
				
				//AWS S3 Related
				deleteFromS3("theme1"+contact.getImagepath());
				deleteFromS3("theme1"+contact.getThumbpath());
			}
		}
		generalDaoService.delete(team);
	}

	@Override
	public void deletePlayer(String path, int id) {
		// TODO Auto-generated method stub
		if(!contactService.getContact(id).getImagepath().contains("default"))
		{
			File file = new File(path+"/resources/theme1/"+contactService.getContact(id).getImagepath());
			file.delete();
			file = new File(path+"/resources/theme1/"+contactService.getContact(id).getThumbpath());
			file.delete();
			

			//AWS S3 Related
			deleteFromS3("theme1"+contactService.getContact(id).getImagepath());
			deleteFromS3("theme1"+contactService.getContact(id).getThumbpath());
		}
		System.out.println("DELETING CONTACT");
		generalDaoService.delete(contactService.getContact(id));
	}

	@Override
	public void editTeamAdmin(Contact contact) {
		// TODO Auto-generated method stub
		
		if(contact==null)
			return;
		Contact contactp = contactService.getContact(contact.getId());
	
		if(contactp==null)
			return;
		contactp.setName(contact.getName());
	
		contactp.setUsername(contact.getUsername());
		
		contactp.setPhonenumber(contact.getPhonenumber());
		contactp.setAddress(contact.getAddress());
		contactp.setEmail(contact.getEmail());
	
		if(contact.getPassword()!=null)
			if(!contact.getPassword().equals(""))
			{
				contactp.setPassword(passwordEncoder.encode(contact.getPassword()));
			}
		generalDaoService.update(contactp);
	}

	@Override
	public void deleteNotice(int id, String path) {
		Notice notice = this.findNewsById(id);
		generalDaoService.delete(notice);
		
        if(!notice.getImageurl().contains("default"))
        {
			File file1 = new File(path+"/resources/theme1/"+notice.getImageurl());
			file1.delete();
			
			file1 = new File(path+"/resources/theme1/"+notice.getThumburl());
			file1.delete();

			//AWS S3 Related
			deleteFromS3("theme1"+notice.getThumburl());
			deleteFromS3("theme1"+notice.getImageurl());
        }
        
		
	}

	@Override
	public List<Team> getFollowingTeams(String teamid) {

		int id = Integer.parseInt(teamid);
		Team team = teamDao.findById(id);
		List<Team> list  = new ArrayList<Team>();
		list.add(team);
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public List<Game> getLastResults() {
		// TODO Auto-generated method stub
		List<Game> games = gameDao.getLastResults();
/*		for(Game game:games)
		{
			if(game.getPlayoff()!=null)
				game.setChampion(game.getPlayoff().getChampion());
			else if(game.getMatchday()!=null) 
				game.setChampion(game.getMatchday().getTeamgroup().getChampion());
		}*/
		return games;
	}

	@Override
	public List<Game> getAllGames() {
		List<Game> games = gameDao.findAll();
/*		for(Game game:games)
		{
			if(game.getPlayoff()!=null)
				game.setChampion(game.getPlayoff().getChampion());
			else if(game.getMatchday()!=null) 
				game.setChampion(game.getMatchday().getTeamgroup().getChampion());
		}*/
		return games;
	}
	@Override
	public List<Game> getCalendarGames() {
		List<Game> games = gameDao.getCalendarGames();
		/*	for(Game game:games)
	{
			if(game.getPlayoff()!=null)
				game.setChampion(game.getPlayoff().getChampion());
			else if(game.getMatchday()!=null) 
				game.setChampion(game.getMatchday().getTeamgroup().getChampion());
		}*/
		return games;
	}

	@Override
	public Notification getNotifications(Map<String, Integer> actions) {
		// TODO Auto-generated method stub
		System.out.println("NOTIF_1");
	
		Contact contact =  contactService.getLoggedIn();
		 if(contact!=null)
		 {
		 }
		 else if(actions.get("uid")!=null)
		{
			 contact = contactService.getContact(actions.get("uid"));
		}
			System.out.println("NOTIF_2");
		 //else return null;
 		Notification notification = null;
 
		int stayed=0;
		if(actions.get("delay")!=null)
		{
			stayed+=actions.get("delay");
		}
		System.out.println("NOTIF_3");
		while(stayed<60000)
		{
			//int counter = 3;
			if(actions.get("getunseenmessages")!=null&&contact!=null)
			{
				System.out.println("NOTIF_4");
				System.out.println("***INSIDE");
				List<Message> messages=messageDao.getUnseenMessages( contact, actions.get("lastid"));
				if(!messages.isEmpty())
				{
					System.out.println("***NOT EMPTY");

					notification = new Notification();
					notification.setMessages(messages);
					break;
				}
				System.out.println("***EMPTY");
			}
			if(actions.get("getundeliveredmessages")!=null&&contact!=null)
			{
				System.out.println("NOTIF_5");
					System.out.println("***INSIDE1");
					List<Message> messages=messageDao.getUdeliveredMessages( contact, actions.get("lastid"));
					if(!messages.isEmpty())
					{
						System.out.println("***NOT EMPTY1");
						notification = new Notification();
						notification.setMessages(messages);
						break;
					}
					System.out.println("***EMPTY1");
					
			}
			if(actions.get("getinformations")!=null)
			{
				System.out.println("NOTIF_6");
				List<Information> informations = informationDao.getTeamInformations(this.findTeamById(actions.get("teamid")), actions.get("getinformations"));
				if(!informations.isEmpty())
				{
					System.out.println("***NOT EMPTY3");
					notification = new Notification();
					notification.setInformations(informations);
					break;
				}
				
				//notification.setTeamgames(gameDao.getUpcomingTeamGames(this.findTeamById(actions.get("teamid"))));
				//notification.setTeamgames(this.findTeamGames(actions.get("teamid")));
			}
			if(actions.get("delay")!=null)
			{
				System.out.println("NOTIF_7");

				try {
					Thread.sleep(actions.get("delay"));
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				stayed+=actions.get("delay");
			}
			else stayed=70000;
				
			
		}

	

		return notification;
	}

	@Override
	public void clearEmptyMatchdays(int teamgroupid) {
		// TODO Auto-generated method stub
		Teamgroup teamgroup = this.findTeamgroupById(teamgroupid);
		Hibernate.initialize(teamgroup.getMatchdays());
		//teamgroup.getMatchdays().clear();
		
		List<Matchday> matchdays = teamgroup.getMatchdays();
	    for(int i=0;i<matchdays.size();i++) {
	    	Matchday matchday = matchdays.get(i);
	    	System.out.println(matchday.getName());
    		Hibernate.initialize(matchday.getGames());
	    	if(matchday.getGames().size()==0)
	    	{
		    	matchdays.remove(matchday);
		    	i=-1;
	    	}
	    }
	    generalDaoService.update(teamgroup);
	}

	@Override
	public List<Custompage> findCustompages(boolean headersonly) {
		// TODO Auto-generated method stub
		return custompageDao.findAll();
	}

	@Override
	public Custompage findCustompageById(int id) {
		// TODO Auto-generated method stub
		//Custompage custompage = this.findCustompageById(id);
		return custompageDao.findById(id);
	}

	@Override
	public void deleteCustompage(int id, String staticPath) {
		// TODO Auto-generated method stub
	
		generalDaoService.delete(this.findCustompageById(id));
	}

	@Override
	public void uploadCustompageImages(String staticPath, int id, CommonsMultipartFile[] files) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		
				Custompage custompage = custompageDao.findById(id);
				for(CommonsMultipartFile file:files)
				{
					
			        try{  
					Image image = new Image();
					generalDaoService.persist(image);
			        String extension = FilenameUtils.getExtension(file.getOriginalFilename()); 
					String filename=String.valueOf("custompage"+custompage.getId()+"_image"+ image.getId())+"."+extension;
			        byte barr[]=file.getBytes();  
			        
		        
			        BufferedOutputStream bout=new BufferedOutputStream(  
			                 new FileOutputStream(staticPath+"/resources/theme1/customimages/custompageimage_"+filename));  
			        bout.write(barr);  
			        bout.flush();  
			        bout.close();  
			        //AWS S3 Related
			        uploadToS3(staticPath+"/resources/theme1/customimages/custompageimage_"+filename);
			        
			        ByteArrayInputStream bais = new ByteArrayInputStream(barr);
			        BufferedImage resizeMe = ImageIO.read(bais);
			        Dimension newMaxSize = new Dimension(255, 255);
			        BufferedImage resizedImg = Scalr.resize(resizeMe, Method.QUALITY, newMaxSize.width, newMaxSize.height);
			        
			        BufferedOutputStream bout1=new BufferedOutputStream(  
			                 new FileOutputStream(staticPath+"/resources/theme1/customimages/custompageimage_thumb_"+filename));  
			        
			        ImageIO.write(resizedImg, extension, bout1);
			    
			        bout1.flush();  
			        bout1.close();  

			        //AWS S3 Related
			        uploadToS3(staticPath+"/resources/theme1/customimages/custompageimage_thumb_"+filename);
			        
			        image.setThumburl("/customimages/custompageimage_thumb_"+filename);
			        image.setUrl("/customimages/custompageimage_"+filename);
			        image.setCustompage(custompage);
			        generalDaoService.update(image);
			       
			        }catch(Exception e){System.out.println(e);
		            }  
			        
			        //return ;
				
				}
	}

	@Override
	public void editCustompage(Custompage custompage) {
		// TODO Auto-generated method stub
		Custompage custompage1 = this.findCustompageById(custompage.getId());
		custompage1.setTitle(custompage.getTitle());
		custompage1.setContent(custompage.getContent());
		generalDaoService.update(custompage1);
	}

	@Override
	public List<Game> getUpcomingTeamgroupGames(Integer teamgroupid) {
		// TODO Auto-generated method stub
		return gameDao.getUpcomingTeamgroupGames(this.findTeamgroupById(teamgroupid));
	}

	@Override
	public List<Game> getUpcomingChampiongames(Integer championid) {
		// TODO Auto-generated method stub

		return gameDao.getUpcomingChampionGames(this.findChampionsById(championid));
	}


}
