package com.event.service;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.sport.model.Scorer;
import com.phonebook.model.Contact;
import com.sport.model.Album;
import com.sport.model.Champion;
import com.sport.model.Game;
import com.sport.model.Image;
import com.sport.model.Matchday;
import com.sport.model.Notice;
import com.sport.model.Playoff;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

public interface SportService {
	
    
	public Champion findChampionsById(int id);
	
	public Standing findStandingById(int id);
	
	public List<Champion> findAllChampions();
	
	public  List<Teamgroup> getTeamgroups(int championid);
	
	public  List<Matchday> getMatchdays(int matchdayid);
	
	public  List<Standing> getStandings(int teamgroupid);
	
	public  List<Game> getGames(int matchdayid);
	
	public List<Team> findAllTeams();
	
	public Teamgroup findTeamgroupById(int id);
	
	public Matchday findMatchdayById(int id);
	
	public Team findTeamById(int id);
	
	public void addTeamToTeamgroup(Teamgroup teamgroup, Team team);

	public void addNewTeamToTeamgroup(Teamgroup teamgroup, Team team);

	public void removeTeamFromTeamgroup(int teamgroupid,int teamid);

	public void generateMatchgames(int teamgroupid, int roundNumber);

	public void deleteTeamgroupMatchdays(int teamgroupid);

	public void updateStandings(Teamgroup teamgroup);

	public Game findGameById(int id);


	public void addGameToMatchday(int matchdayid, int gameid);

	public List<Game> findTeamGames(int teamid);

	public List<Standing> findTeamStandings(int teamid);

	public List<Contact> findTeamPlayers(int teamid);

	public void uploadTeamLogo(String path, int id, CommonsMultipartFile file);
	

	public void uploadTeamCover(String path, int id, CommonsMultipartFile file);

	public void addPlayerToTeam(int teamid, int playerid);

	public Contact uploadPlayerImage(String path, int id, CommonsMultipartFile file);

	public void updateTeam(Team team);

	public List<Scorer> findGameScorers(int id1);

	public List<Scorer> findTeamgroupScorers(int id1);

	public Scorer findScorerById(int id);

	public List<Notice> findAllNews(int count, boolean headersonly);

	public Notice findNewsById(int id);

	public Notice uploadNoticeImage(String path, int id, CommonsMultipartFile file);

	public void genPlayoffs(int championid, int phase,int round);

	public List<Playoff> getPlayoffGames(int championid, Integer phase);

	public Playoff findPlayoffById(int id);

	public void updatePlayoff(Playoff playoff, Champion champion);

	public void addNewAdminUserToTeam(Contact contact, int id1);

	public List<Game> getUpcomingGames();

	public List<Album> getAlbums();

	public void uploadAlbumImages(String path, int id, CommonsMultipartFile[] files);

	public Image findImageById(int id);

	public void deleteImage(String path, int id);

	public void deleteAlbum(String path, int id);

	public void editAlbum(Album album);

	public void deleteTeam(String path, int id);

	public void deletePlayer(String path, int id);

	public void editTeamAdmin(Contact contact);

	public void deleteNotice(int id,String path);

	public List<Team> getFollowingTeams(String teamid);
	
}
