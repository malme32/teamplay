package com.event.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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

import com.event.model.Event;
import com.event.service.GeneralDaoService;
import com.event.service.SportService;
import com.phonebook.model.Contact;
import com.phonebook.service.ContactService;
import com.sport.model.Champion;
import com.sport.model.Game;
import com.sport.model.Matchday;
import com.sport.model.Notice;
import com.sport.model.Scorer;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

@Controller
public class SportController {
	
	@Autowired
	private GeneralDaoService generalDaoService;
	
	@Autowired
	private SportService sportService;

	@Autowired
	private ContactService contactService;
	/////////////////////GET/////////////////////////////////////
	
	@RequestMapping(value="/champions", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Champion> getChampionList()
	{
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
	public @ResponseBody List<Team> getTeamList()
	{
		return sportService.findAllTeams();
	}
	
	@RequestMapping(value="/teams/{teamid}/games", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Game> getTeamGames(@PathVariable int teamid)
	{
		return sportService.findTeamGames(teamid);
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
	public @ResponseBody List<Notice> getNews()
	{
		return sportService.findAllNews();
	}
	
	/////////////////////POST/////////////////////////////////////
	
	@RequestMapping(value="/champions", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addChampion(@ModelAttribute Champion champion)
	{
		 generalDaoService.persist(champion);
		return ;
	}
	
	

	@RequestMapping(value="/champions/{id1}/teamgroups", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addTeamGroup(@ModelAttribute Teamgroup teamgroup, @PathVariable int id1)
	{

		teamgroup.setChampion(sportService.findChampionsById(id1));
		generalDaoService.persist(teamgroup);
		return;
	}
	
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
	
	
	
	
	@RequestMapping(value="/games", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addGame(@ModelAttribute Game game, @RequestParam int teamid1,@RequestParam int teamid2,@RequestParam int matchdayid)
	{
		game.setTeam1(sportService.findTeamById(teamid1));
		game.setTeam2(sportService.findTeamById(teamid2));
		game.setMatchday(sportService.findMatchdayById(matchdayid));
		 generalDaoService.persist(game);
		 
		 return ;
	}
	
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
	public @ResponseBody void addMatchday(@ModelAttribute Game game,@PathVariable int id1, @RequestParam int teamid1, @RequestParam int teamid2)
	{
		game.setMatchday(sportService.findMatchdayById(id1));
		game.setTeam1(sportService.findTeamById(teamid1));
		game.setTeam2(sportService.findTeamById(teamid2));
		generalDaoService.persist(game);
		return;
	}

	
/*	@RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
	public String submit(@RequestParam("file") MultipartFile file, ModelMap modelMap) {
	    modelMap.addAttribute("file", file);
	    return "fileUploadView";
	}*/
	
	@RequestMapping(value = "/teams/{id}/logos", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody  void uploadTeamLogo(@PathVariable int id, @RequestParam CommonsMultipartFile file,HttpSession session){  
      String path=session.getServletContext().getRealPath("/");  
       
        sportService.uploadTeamLogo(path, id, file);
        return;
    }  
	
	@RequestMapping(value = "/teams/{id}/covers", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody  void uploadTeamCover(@PathVariable int id, @RequestParam CommonsMultipartFile file,HttpSession session){  
      String path=session.getServletContext().getRealPath("/");  
        sportService.uploadTeamCover(path, id, file);
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
      String path=session.getServletContext().getRealPath("/");  
      return sportService.uploadPlayerImage(path, id, file);
        
    }  
	
	
	@RequestMapping(value="/games/{gameid}/scorers", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addScorer(@RequestBody Scorer scorer,@PathVariable int gameid)
	{
		Game game = sportService.findGameById(gameid);
		scorer.setGame(game);
		scorer.setTeamgroup(game.getMatchday().getTeamgroup());
		generalDaoService.persist(scorer);
		return ;
	}
	

	
	
	//////////////////PUT///////////////////////////
	
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
			Matchday matchday = sportService.findMatchdayById(matchdayid);
			game.setMatchday(matchday);
/*			game.setDate(date0);
			game.setId(id);
			game.setTeam1(sportService.findTeamById(teamid1));
			game.setTeam2(sportService.findTeamById(teamid2));*/
			
			generalDaoService.update(game);
			sportService.updateStandings(matchday.getTeamgroup());
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
		scorer.setTeamgroup(game.getMatchday().getTeamgroup());
		generalDaoService.update(scorer);
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
		sportService.removeTeamFromTeamgroup(teamgroupid,teamid);
		return ;
	}
	
	
	@RequestMapping(value="/standings/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void removeTeamFromTeamgroup(@PathVariable int id)
	{
		Standing standing = sportService.findStandingById(id);
		generalDaoService.delete(standing);
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
		generalDaoService.delete(game);
		sportService.updateStandings(game.getMatchday().getTeamgroup());
		return; 
	}
	
	@RequestMapping(value="/teams/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteTeam(@PathVariable int id)
	{
	
		Team team = sportService.findTeamById(id);
		generalDaoService.delete(team);
		return; 
	}	
	
	@RequestMapping(value="/players/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deletePlayer(@PathVariable int id)
	{
		generalDaoService.delete(contactService.getContact(id));
		return ;
	}
	
	
	@RequestMapping(value="/scorers/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteScorer(@PathVariable int id)
	{
		Scorer scorer = sportService.findScorerById(id);
		generalDaoService.delete(scorer);
		return ;
	}
	
}
