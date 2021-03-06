package com.event.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.event.dao.InformationDao;
import com.event.model.Event;
import com.event.service.GeneralDaoService;
import com.event.service.SportService;
import com.phonebook.model.Contact;
import com.phonebook.model.Userrole;
import com.phonebook.service.ContactService;
import com.phonebook.service.MyProperty;
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


@Controller
@Transactional
public class SportController {
	
	public static HttpServletRequest request = null;
	
	@Autowired
	private GeneralDaoService generalDaoService;
	
	@Autowired
	private SportService sportService;

	@Autowired
	private ContactService contactService;

	@Autowired
	private MyProperty myProperty;
	
	//public static final String AppName = "Rossoneri MFC";
/*	public static final String AndroidAppLink = "https://play.google.com/store/apps/details?id=com.rossonerimfc";
	public static final boolean S3_AWS_Enabled = true;*/

	
	private String getStaticPath(HttpSession session)
	{
		// TOMPCAT REAL PATH
		String path = "";
		if(myProperty.getResourcesPath().equals(""))
		    path=session.getServletContext().getRealPath("/");  
		else
		    path=myProperty.getResourcesPath();  
			
		    
		// DISK    
		//  String homeDir = System.getProperty("user.home");
	     // String path=homeDir+"/javaresources/soccer";
	

		  // AWS 
		//String path="";
		
		
		    System.out.println("REALPATH_: "+path);
	      return path;
	}
	
	/////////////////////GET/////////////////////////////////////
	
	@RequestMapping(value="/champions", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Champion> getChampionList()
	{
		System.out.println("APP NAME: "+myProperty.getAppName());
		
		return sportService.findAllChampions();
	}
	
	@RequestMapping(value="/champions/{id}", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody Champion getChampion(@PathVariable int id)
	{

		return sportService.findChampionsById(id);
	}
	
	@RequestMapping(value="/champions/{championid}/teamgroups", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Teamgroup> getTeamgroups(@PathVariable int championid)
	{

		return sportService.getTeamgroups(championid);
	}
	
	@RequestMapping(value="/teamgroups/{teamgroupid}/matchdays", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Matchday> getMatchdays(@PathVariable int teamgroupid)
	{

		return sportService.getMatchdays(teamgroupid);
	}
	
	@RequestMapping(value="/teamgroups/{teamgroupid}/standings", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Standing> getStandings(@PathVariable int teamgroupid)
	{

		return sportService.getStandings(teamgroupid);
	}
	
	@RequestMapping(value="/matchdays/{matchdayid}/games", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Game> getGames(@PathVariable int matchdayid)
	{

		return sportService.getGames(matchdayid);
	}
	
	
	@RequestMapping(value="/teams", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Team> getTeamList(@RequestParam(required=false) String orderby)
	{
		return sportService.findAllTeams(orderby);
	}
	
	@RequestMapping(value="/teams/{teamid}/games", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Game> getTeamGames(@PathVariable int teamid)
	{
		List<Game> games =null;
		try {

			 games = sportService.findTeamGames(teamid);
		}catch(Exception e) {}
		return games;
	}
	
	@RequestMapping(value="/teams/{teamid}/standings", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Standing> getTeamStandings(@PathVariable int teamid)
	{
		return sportService.findTeamStandings(teamid);
	}
	
	
	
	@RequestMapping(value="/teams/{id1}", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody Team getTeam(@PathVariable int id1)
	{
		return sportService.findTeamById(id1);
	}
	
	@RequestMapping(value="/teams/{id1}/players", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Contact> getTeamPlayers(@PathVariable int id1)
	{
		return sportService.findTeamPlayers(id1);
	}
	
	
	@RequestMapping(value="/games/{id1}/scorers", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Scorer> getTeamScorers(@PathVariable int id1)
	{
		return sportService.findGameScorers(id1);
	}
	
	@RequestMapping(value="/teamgroups/{id1}/scorers", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Scorer> getTeamgroupScorers(@PathVariable int id1)
	{
		return sportService.findTeamgroupScorers(id1);
	}
	
	@RequestMapping(value="/news", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Notice> getNews(@RequestParam(required = false)  Integer count, 
			@RequestParam(required = false)  Boolean headersonly,@RequestParam(required = false)  String option)
	{
		int count1=0;
		boolean headersonly1=false;
		if(count!=null)
			count1=count;
		if(headersonly!=null)
			headersonly1=headersonly;
			
		return sportService.findAllNews(count1, headersonly1,option);
	}
	
	
	@RequestMapping(value="/custompages", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Custompage> getCustompages(@RequestParam(required = false)  Boolean headersonly)
	{
	
		boolean headersonly1=false;
		if(headersonly!=null)
			headersonly1=headersonly;
			
		return sportService.findCustompages(headersonly1);
	}
	
	@RequestMapping(value="/news/{id}", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody Notice getNewsDetail(@PathVariable int id)
		
	{
		return sportService.findNewsById(id);
	}
	@RequestMapping(value="/custompages/{id}", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody Custompage getCustomPage(@PathVariable int id)
		
	{
		return sportService.findCustompageById(id);
	}
	
	
	@RequestMapping(value="/games/{id}", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody Game getGame(@PathVariable int id)
		
	{
		return sportService.findGameById(id);
	}
	
/*	@RequestMapping(value="/champions/{championid}/playoffs", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody void getPlayoffs(@PathVariable int championid)
	{
		sportService.getPlayoffs(championid,32);
		return ;
	}*/
	
	@RequestMapping(value="/champions/{championid}/playoffs", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Playoff> getPlayoffGames(@PathVariable int championid, @RequestParam(required = false)  Integer phase)
	{

		return sportService.getPlayoffGames(championid,phase);
	}
	
	@RequestMapping(value="/games", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Game> getAllGames(@RequestParam(required = false)  String upcoming,@RequestParam(required = false)  Integer upcomingteamgroupgames,
			@RequestParam(required = false)  Integer upcomingchampiongames,	@RequestParam(required = false)  String lastresults, @RequestParam(required = false)  String calendargames)
	{
		if(upcoming!=null)
			return sportService.getUpcomingGames();
		else if(lastresults!=null)
			return sportService.getLastResults();
		else if(calendargames!=null)
			return sportService.getCalendarGames();
		else if(upcomingteamgroupgames!=null)
			return sportService.getUpcomingTeamgroupGames(upcomingteamgroupgames);
		else if(upcomingchampiongames!=null)
			return sportService.getUpcomingChampiongames(upcomingchampiongames);
		else 
			return sportService.getAllGames();
		
	}
	
	
	@RequestMapping(value="/albums", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Album> getAlbums()
	{
		return sportService.getAlbums();
		
	}
	
	@RequestMapping(value="/followers", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Team> getFollowers(HttpServletRequest request,@CookieValue(value = "teamfollowing", defaultValue="noteam") String cookie)
	{
		
		
	SportController.request = request;
	Contact contact =  contactService.getLoggedIn();
	 if(contact!=null)
	 {
		 if(contact.getAdminteam()!=null)
		 {
			 return sportService.getFollowingTeams(String.valueOf(contact.getAdminteam().getId()));
		 }
	 }
		
	if(cookie.equals("noteam"))
		return new ArrayList<Team>();
		
		return sportService.getFollowingTeams(cookie);
		
	}
	
	//@secured("ROLE_ADMIN")
	@RequestMapping(value="/teams/{id}/admins", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody Contact getTeamAdmins (@PathVariable int id)
	{
		return sportService.findTeamById(id).getAdmin();
		
	}
	
//	//@secured({"ROLE_ADMIN","ROLE_TEAM"})
	@RequestMapping(value="/notifications", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody Notification getNotifications (HttpServletRequest request,@RequestParam(required = false)  String getunseenmessages, 
			@RequestParam(required = false) String getundeliveredmessages, @RequestParam(required = false)  Integer lastid,
			@RequestParam(required = false) Integer delay, @RequestParam(required = false) Integer uid,@RequestParam(required = false) Integer getinformations, @RequestParam(required = false) Integer teamid)
	{	
		SportController.request = request;
		Map<String,Integer> actions = new HashMap<String,Integer>();
		if(getunseenmessages!=null)
			actions.put("getunseenmessages", 0);
		if(getundeliveredmessages!=null)
			actions.put("getundeliveredmessages", 0);
		if(delay!=null)
			actions.put("delay", delay);
		if(lastid!=null)
			actions.put("lastid", lastid);
		if(uid!=null)
			actions.put("uid", uid);
		if(getinformations!=null)
			actions.put("getinformations", getinformations);
		if(teamid!=null)
			actions.put("teamid", teamid);
		return sportService.getNotifications(actions);
	}
	
	

	@RequestMapping(value="/logins", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody Contact getLogins (HttpServletRequest request)
	{
	//	System.out.println("LOGGEDINUSER: "+  SportController.loggedIn);
		SportController.request=request;
		return contactService.getLoggedIn();
	}
	/////////////////////POST/////////////////////////////////////
	
	//@secured("ROLE_ADMIN")
	@RequestMapping(value="/teams/{id1}/adminusers", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addNewAdminUserToTeam(@ModelAttribute Contact contact, @PathVariable int id1)
	{	
		sportService.addNewAdminUserToTeam(contact, id1);
		return;
	}
	

	@RequestMapping(value="/loginPage", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void loginPage()
	{	
		return;
	}
	
	//@secured("ROLE_ADMIN")
	@RequestMapping(value="/champions", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addChampion(@ModelAttribute Champion champion)
	{
		 generalDaoService.persist(champion);
		return ;
	}
	
	
	//@secured("ROLE_ADMIN")
	@RequestMapping(value="/champions/{id1}/teamgroups", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addTeamGroup(@ModelAttribute Teamgroup teamgroup, @PathVariable int id1)
	{

		teamgroup.setChampion(sportService.findChampionsById(id1));
		generalDaoService.persist(teamgroup);
		return;
	}
	
	//@secured("ROLE_ADMIN")
	@RequestMapping(value="/teamgroups/{id1}/matchdays", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addMatchday(@ModelAttribute Matchday matchday, @PathVariable int id1)
	{

		matchday.setTeamgroup(sportService.findTeamgroupById(id1));
		generalDaoService.persist(matchday);
		return;
	}
	
/*	@RequestMapping(value="/teams", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addTeam(@ModelAttribute Team team)
	{
		 generalDaoService.persist(team);
		 return ;
	}*/
	
	
	
	//@secured("ROLE_ADMIN")
	@RequestMapping(value="/games", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addGame(@ModelAttribute Game game, @RequestParam int teamid1,@RequestParam int teamid2,@RequestParam int matchdayid)
	{
		game.setTeam1(sportService.findTeamById(teamid1));
		game.setTeam2(sportService.findTeamById(teamid2));
		game.setMatchday(sportService.findMatchdayById(matchdayid));
		game.setChampion(sportService.findMatchdayById(matchdayid).getTeamgroup().getChampion());
		 generalDaoService.persist(game);
		 
		 return ;
	}
	
	
	//@secured({"ROLE_ADMIN", "ROLE_TEAM"})
	@RequestMapping(value="/teams", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addTeam(@RequestBody Team team)
	{
		generalDaoService.persist(team);
		return ;
	}
	
	
	@RequestMapping(value="/teamgroups/{teamgroupid}/teams", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addNewTeamToTeamgroup(@PathVariable int teamgroupid,@ModelAttribute Team team)
	{
		//Team team = sportService.findTeamById(teamid);
		Teamgroup teamgroup = sportService.findTeamgroupById(teamgroupid);
/*		System.out.println("XAXAXAXA");
		System.out.println(team.getName());
		System.out.println(teamgroup.getName());*/
		sportService.addNewTeamToTeamgroup(teamgroup,team);
		return ;
	}
	
	
	@RequestMapping(value="/teamgroups/{teamgroupid}/actions/{action}", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void teamgroupActions(@PathVariable String action, @PathVariable int teamgroupid, @RequestParam int roundNumber)
	{
		if(action.equals("generatematchdays"))
		{
				sportService.generateMatchgames(teamgroupid,roundNumber);
		}
		if(action.equals("generatedoublematchdays"))
		{
				sportService.generateMatchgames(teamgroupid,2);
		}

		if(action.equals("regeneratematchdays"))
		{
				sportService.reGenerateMatchgames(teamgroupid,roundNumber);
				sportService.clearEmptyMatchdays(teamgroupid);
		}
		if(action.equals("regeneratedoublematchdays"))
		{
				sportService.reGenerateMatchgames(teamgroupid,2);
				sportService.clearEmptyMatchdays(teamgroupid);
		}
			return ;
	}
	
	
/*	@RequestMapping(value="/teamgroups/{teamgroupid}/matchdays", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addMatchday(@PathVariable int teamgroupid,@ModelAttribute Matchday matchday)
	{
		//Team team = sportService.findTeamById(teamid);
		Teamgroup teamgroup = sportService.findTeamgroupById(teamgroupid);

		matchday.setTeamgroup(teamgroup);
		generalDaoService.persist(matchday);
		return ;
	}*/
	
	
	
	@RequestMapping(value="/matchdays/{id1}/games", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addGameToMatchday(@ModelAttribute Game game,@PathVariable int id1, @RequestParam int teamid1, @RequestParam int teamid2)
	{
		game.setMatchday(sportService.findMatchdayById(id1));
		game.setTeam1(sportService.findTeamById(teamid1));
		game.setTeam2(sportService.findTeamById(teamid2));		
		game.setChampion(sportService.findMatchdayById(id1).getTeamgroup().getChampion());

		generalDaoService.persist(game);
		return;
	}

	
	@RequestMapping(value="/playoffs/{id1}/games", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addGameToPlayoff(@ModelAttribute Game game,@PathVariable int id1, @RequestParam int teamid1, @RequestParam int teamid2)
	{
		game.setPlayoff(sportService.findPlayoffById(id1));
		game.setTeam1(sportService.findTeamById(teamid1));
		game.setTeam2(sportService.findTeamById(teamid2));
		game.setChampion(sportService.findPlayoffById(id1).getChampion());
		generalDaoService.persist(game);
		return;
	}
	
	@RequestMapping(value="/champions/{id1}/playoffs", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addPlayoff(@ModelAttribute Playoff playoff,@PathVariable int id1)
	{
		Champion champion = sportService.findChampionsById(id1);
		playoff.setChampion(champion);
		generalDaoService.persist(playoff);
		return;
	}

	
/*	@RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
	public String submit(@RequestParam("file") MultipartFile file, ModelMap modelMap) {
	    modelMap.addAttribute("file", file);
	    return "fileUploadView";
	}*/
	
	@RequestMapping(value = "/teams/{id}/logos", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody  void uploadTeamLogo(@PathVariable int id, @RequestParam CommonsMultipartFile file,HttpSession session){  
    //  String path=session.getServletContext().getRealPath("/");  
/*	  String homeDir = System.getProperty("user.home");

      String path=homeDir+"/javaresources/soccer";
*/
        sportService.uploadTeamLogo(getStaticPath(session), id, file);
        return;
    }  
	
	@RequestMapping(value = "/teams/{id}/covers", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody  void uploadTeamCover(@PathVariable int id, @RequestParam CommonsMultipartFile file,HttpSession session){  
    //  String path=session.getServletContext().getRealPath("/");  
      //String path="/home/and/Javaresources/soccer";

        sportService.uploadTeamCover(getStaticPath(session), id, file);
        return;
    }  
	
	
	
	@RequestMapping(value="/players", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody Contact addPlayer(@RequestBody Contact contact)
	{
		generalDaoService.persist(contact);
		return contact;
	}
	
	@RequestMapping(value="/teams/{teamid}/players", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody Contact addPlayerToTeam(@PathVariable int teamid,@RequestBody Contact contact)
	{
		generalDaoService.persist(contact);
		sportService.addPlayerToTeam(teamid, contact.getId());
		return contact;
	}
	
	@RequestMapping(value = "/players/{id}/images", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody  Contact uploadPlayerImage(@PathVariable int id, @RequestParam CommonsMultipartFile file,HttpSession session){  
    //  String path=session.getServletContext().getRealPath("/");  
      //String path="/home/and/Javaresources/soccer";
      return sportService.uploadPlayerImage(getStaticPath(session), id, file);
        
    }  
	
	
	@RequestMapping(value="/games/{gameid}/scorers", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addScorer(@RequestBody Scorer scorer,@PathVariable int gameid)
	{
		Game game = sportService.findGameById(gameid);
		scorer.setGame(game);
		try {scorer.setTeamgroup(game.getMatchday().getTeamgroup());}
		catch(Exception e) {}
		generalDaoService.persist(scorer);
		return ;
	}
	
	@RequestMapping(value="/news", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody Notice addNotice(@RequestBody Notice notice)
	{
		generalDaoService.persist(notice);
		return notice;
	}
	
	@RequestMapping(value="/custompages", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody Custompage addCustompage(@RequestBody Custompage custompage)
	{
		generalDaoService.persist(custompage);
		return custompage;
	}
	
	@RequestMapping(value = "/custompages/{id}/images", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody  void uploadCustompageImages(@PathVariable int id, @RequestParam(value = "files") CommonsMultipartFile[] files,HttpSession session){  
      //String path=session.getServletContext().getRealPath("/");  
      //String path="/home/and/Javaresources/soccer";
       System.out.println("CUSTOMPAGEIMAGES");
        sportService.uploadCustompageImages(getStaticPath(session), id, files);
        return;
    }  
	
	
	@RequestMapping(value = "/news/{id}/images", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody  Notice uploadNoticeImage(@PathVariable int id, @RequestParam CommonsMultipartFile file,HttpSession session){  
    //  String path=session.getServletContext().getRealPath("/");  
      //String path="/home/and/Javaresources/soccer";
      return sportService.uploadNoticeImage(getStaticPath(session), id, file);
        
    }  

	@RequestMapping(value="/champions/{championid}/actions/{action}", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void genPlayoffs(@PathVariable int championid, @PathVariable String action,  @RequestParam int phase,  @RequestParam int round)
	{
		if(action.equals("generateplayoffs"))
			sportService.genPlayoffs(championid,phase,round);
		return ;
	}
	
	
	
	@RequestMapping(value = "/albums/{id}/images", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody  void uploadAlbumImages(@PathVariable int id, @RequestParam(value = "files") CommonsMultipartFile[] files,HttpSession session){  
      //String path=session.getServletContext().getRealPath("/");  
      //String path="/home/and/Javaresources/soccer";
       
        sportService.uploadAlbumImages(getStaticPath(session), id, files);
        return;
    }  
	
	@RequestMapping(value="/albums", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addAlbum(@ModelAttribute Album album)
	{	
		Date date = new Date();
		album.setDate(date);
		generalDaoService.persist(album);
		return;
	}
	
	@RequestMapping(value="/teams/{id}/followers", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addTeamFollower(@CookieValue(value = "teamfollowing", defaultValue="noteam") String cookie,HttpServletResponse response,HttpServletRequest request,@PathVariable String id)
	{	
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null)
			for(Cookie cookie1:cookies) {
				if(cookie1.getName().equals("teamfollowing"))
				{
					System.out.println("Cookie found: "+cookie1+" "+id);
					if(cookie1.getValue().equals(id))
						cookie1.setMaxAge(0); //set expire time 
					else
						cookie1.setMaxAge(100000000); //set expire time 
					cookie1.setValue(id);
					cookie1.setPath("/");
					response.addCookie(cookie1);
					return;
				}
			}
		

		Cookie cookie1 = new Cookie("teamfollowing", id); //bake cookie
		cookie1.setMaxAge(100000000); //set expire time 
		cookie1.setPath("/");
		response.addCookie(cookie1);
		return;
	}
	
	
	//////////////////PUT///////////////////////////

	//@secured("ROLE_ADMIN")
	@RequestMapping(value="/champions", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editChampion(@ModelAttribute Champion champion)
	{
		 generalDaoService.update(champion);
		 return ;
	}
	
	@RequestMapping(value="/champions/{id}/teamgroups", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editTeamgroup(@ModelAttribute Teamgroup teamgroup,@PathVariable int id)
	{
		Champion champion = sportService.findChampionsById(id);
		teamgroup.setChampion(champion);
		generalDaoService.update(teamgroup);
		return ;
	}
	
	@RequestMapping(value="/teamgroups/{teamgroupid}/teams/{teamid}", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void addTeamToTeamgroup(@PathVariable int teamgroupid,@PathVariable int teamid)
	{
		Team team = sportService.findTeamById(teamid);
		Teamgroup teamgroup = sportService.findTeamgroupById(teamgroupid);
		sportService.addTeamToTeamgroup(teamgroup,team);
		return ;
	}
	
	@RequestMapping(value="matchdays/{matchdayid}/games", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editGame(@RequestBody Game game,@PathVariable int matchdayid)
	//public @ResponseBody void editGame(@PathVariable int matchdayid,@RequestParam int id,@RequestParam int teamid1,@RequestParam int teamid2, @RequestParam String date)
	{	
/*			String string = "January 2, 2010";
			DateFormat format = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss", Locale.ENGLISH);
			Date date0=null;
			try {
				date0 = format.parse(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(date0); 
			
			Game game = new Game();
			System.out.println("XAXAXA "+date);
*/
/*			game.setDate(date0);
			game.setId(id);
			game.setTeam1(sportService.findTeamById(teamid1));
			game.setTeam2(sportService.findTeamById(teamid2));*/
			
			Matchday matchday = sportService.findMatchdayById(matchdayid);
			sportService.updateGame(game, matchday);
/*			game.setMatchday(matchday);
			generalDaoService.update(game);
			sportService.updateStandings(matchday.getTeamgroup());*/
			return ;
	}
	
	@RequestMapping(value="/matchdays/{matchdayid}/games/{gameid}", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void addGameToMatchday( @PathVariable int matchdayid, @PathVariable int gameid)
	{
		sportService.addGameToMatchday(matchdayid,gameid);
		return ;
	}
	
	
	@RequestMapping(value="teamgroups/{teamgroupid}/matchdays", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editMatchday(@RequestBody Matchday matchday,@PathVariable int teamgroupid)
	//public @ResponseBody void editGame(@ModelAttribute Game game,@RequestParam int teamid1,@RequestParam int teamid2,@RequestParam int matchdayid)
	{	
		    Teamgroup teamgroup = sportService.findTeamgroupById(teamgroupid);
		    matchday.setTeamgroup(teamgroup);
		    matchday.setGames(sportService.findMatchdayById(matchday.getId()).getGames());
			generalDaoService.update(matchday);
			
			
			
			return;
	}
	
	@RequestMapping(value="/teams", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editTeam(@RequestBody Team team)
	{

		
		sportService.updateTeam(team);
		return ;
	}
	
	
	@RequestMapping(value="/teams/{teamid}/players/{playerid}", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void addPlayerToTeam(@PathVariable int teamid, @PathVariable int playerid)
	{
		sportService.addPlayerToTeam(teamid, playerid);
		return;
	}
	
	
	@RequestMapping(value="/players", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editPlayer(@RequestBody Contact contact)
	{
		generalDaoService.update(contact);
		return ;
	}
	
	@RequestMapping(value="/games/{gameid}/scorers", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editScorer(@RequestBody Scorer scorer,@PathVariable int gameid)
	{
		Game game = sportService.findGameById(gameid);
		scorer.setGame(game);		
		try {scorer.setTeamgroup(game.getMatchday().getTeamgroup());}
		catch(Exception e) {}
	
		generalDaoService.update(scorer);
		return ;
	}
	
	@RequestMapping(value="/news", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editNotice(@RequestBody Notice notice)
	{
		generalDaoService.update(notice);
		return;
	}
	
	@RequestMapping(value="/custompages", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editCustompage(@RequestBody Custompage custompage)
	{
		sportService.editCustompage(custompage);
		return;
	}
	
	@RequestMapping(value="champions/{championid}/playoffs", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editPlayoff(@RequestBody Playoff playoff,@PathVariable int championid)
	//public @ResponseBody void editGame(@ModelAttribute Game game,@RequestParam int teamid1,@RequestParam int teamid2,@RequestParam int matchdayid)
	{	
		    Champion champion = sportService.findChampionsById(championid);
			sportService.updatePlayoff(playoff,champion);
			return;
	}
	
	
	@RequestMapping(value="playoffs/{playoffid}/games", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editPlayoffGame(@RequestBody Game game,@PathVariable int playoffid)
	//public @ResponseBody void editGame(@PathVariable int matchdayid,@RequestParam int id,@RequestParam int teamid1,@RequestParam int teamid2, @RequestParam String date)
	{	

			Playoff playoff = sportService.findPlayoffById(playoffid);
		
			
			//Matchday matchday = sportService.findMatchdayById(matchdayid);
			sportService.updateGame(game, playoff);
			
			return ;
	}
	
	@RequestMapping(value="albums", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editAlbum(@RequestBody Album album)
	//public @ResponseBody void editGame(@PathVariable int matchdayid,@RequestParam int id,@RequestParam int teamid1,@RequestParam int teamid2, @RequestParam String date)
	{	
			sportService.editAlbum(album);
			return ;
	}
	
	
	@RequestMapping(value="teamadmins", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editTeamAdmin(@ModelAttribute Contact contact)
	//public @ResponseBody void editGame(@PathVariable int matchdayid,@RequestParam int id,@RequestParam int teamid1,@RequestParam int teamid2, @RequestParam String date)
	{	
			sportService.editTeamAdmin(contact);
			return ;
	}
	

		//////////////////////DELETE///////////////////////
	/////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/champions/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteChampion(@PathVariable int id)
	{
		Champion champion = sportService.findChampionsById(id);
		generalDaoService.delete(champion);
		return; 
	}
	
	@RequestMapping(value="/teamgroups/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteTeamgroup(@PathVariable int id)
	{
	
		Teamgroup teamgroup = sportService.findTeamgroupById(id);
		generalDaoService.delete(teamgroup);
	
		return; 
	}	
	
	
	@RequestMapping(value="/teamgroups/{teamgroupid}/teams/{teamid}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void removeTeamFromTeamgroup(@PathVariable int teamgroupid,@PathVariable int teamid)
	{
/*		Team team = sportService.findTeamById(teamid);
		Teamgroup teamgroup = sportService.findTeamgroupById(teamgroupid);*/
		//sportService.removeTeamFromTeamgroup(teamgroupid,teamid);
		return ;
	}
	
	
	@RequestMapping(value="/standings/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void removeTeamFromTeamgroup(@PathVariable int id)
	{
		 sportService.removeTeamFromTeamgroup(id);
		/*Standing standing = sportService.findStandingById(id);
		generalDaoService.delete(standing);*/
		return ;
	}
	
	@RequestMapping(value="/matchdays/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteMatchday(@PathVariable int id)
	{
		Matchday matchday = sportService.findMatchdayById(id);
		generalDaoService.delete(matchday);
		sportService.updateStandings(matchday.getTeamgroup());
		return ;
	}
	
	
	@RequestMapping(value="teamgroups/{teamgroupid}/matchdays", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteTeamgroupMatchdays(@PathVariable int teamgroupid)
	{
		//Matchday matchday = sportService.findMatchdayById(id);
		sportService.deleteTeamgroupMatchdays(teamgroupid);
		sportService.updateStandings(sportService.findTeamgroupById(teamgroupid));
		return ;
	}
	

	
	@RequestMapping(value="/games/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteGame(@PathVariable int id)
	{
		Game game = sportService.findGameById(id);
		Matchday matchday = game.getMatchday();
		generalDaoService.delete(game);
		if(matchday!=null)
			sportService.updateStandings(game.getMatchday().getTeamgroup());
		return; 
	}
	
	@RequestMapping(value="/teams/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteTeam(@PathVariable int id,HttpSession session)
	{
		//String path=session.getServletContext().getRealPath("/"); 
	     // String path="/home/and/Javaresources/soccer";

		sportService.deleteTeam(getStaticPath(session),id);
		return; 
	}	
	
	@RequestMapping(value="/players/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deletePlayer(@PathVariable int id,HttpSession session)
	{
		//String path=session.getServletContext().getRealPath("/"); 
	      //String path="/home/and/Javaresources/soccer";
		sportService.deletePlayer(getStaticPath(session),id);
		return ;
	}
	
	
	@RequestMapping(value="/scorers/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteScorer(@PathVariable int id)
	{
		Scorer scorer = sportService.findScorerById(id);
		generalDaoService.delete(scorer);
		return ;
	}
	
	@RequestMapping(value="/news/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteNotice(@PathVariable int id,HttpSession session)
	{
		//String path=session.getServletContext().getRealPath("/"); 
	   //   String path="/home/and/Javaresources/soccer"; 
		sportService.deleteNotice(id,getStaticPath(session));
		return ;
	}
	
	
	@RequestMapping(value="/custompages/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteCustompage(@PathVariable int id,HttpSession session)
	{
		//String path=session.getServletContext().getRealPath("/"); 
	   //   String path="/home/and/Javaresources/soccer"; 
		sportService.deleteCustompage(id,getStaticPath(session));
		return ;
	}
	
	@RequestMapping(value="/playoffs/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deletePlayoff(@PathVariable int id)
	{
		Playoff playoff = sportService.findPlayoffById(id);
		generalDaoService.delete(playoff);
		return ;
	}
	
	@RequestMapping(value="/images/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteImage(@PathVariable int id,HttpSession session)
	{
	//	String path=session.getServletContext().getRealPath("/");  
	   // String path="/home/and/Javaresources/soccer";
		
		sportService.deleteImage(getStaticPath(session),id);
		
		return ;
	}
	
	@RequestMapping(value="/albums/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteAlbum(@PathVariable int id,HttpSession session)
	{
		//String path=session.getServletContext().getRealPath("/");  
	    //  String path="/home/and/Javaresources/soccer";
		
		sportService.deleteAlbum(getStaticPath(session),id);
		
		return ;
	}
	
}
