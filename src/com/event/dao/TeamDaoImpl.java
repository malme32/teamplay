package com.event.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import org.hibernate.Hibernate;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.phonebook.model.Contact;
import com.sport.model.Champion;
import com.sport.model.Game;
import com.sport.model.Matchday;
import com.sport.model.Standing;
import com.sport.model.Team;
import com.sport.model.Teamgroup;

@Repository("teamDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class TeamDaoImpl extends AbstractDao implements TeamDao{
	@Override
	public Team findById(int id) {
		// TODO Auto-generated method stub
		return (Team)getSession().get(Team.class, id);
	}

	@Override
	public List<Team> findAll() {
		//Session session = sessionFactory1.openSession();
		   @SuppressWarnings("unchecked")
		   List<Team> list = getSession().createQuery("FROM Team").list(); 
		  // session.close();
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public List<Game> findGames(int teamid) {
		// TODO Auto-generated method stub
		
		
		Team team =this.findById(teamid);
		Hibernate.initialize(team.getTeam1games());
		Hibernate.initialize(team.getTeam2games());
		List<Game> list = new ArrayList<Game>();
		for(Game game: team.getTeam1games())	
			list.add(game);
		for(Game game: team.getTeam2games())	
			list.add(game);
		for(Game game: list)	
			if(game.getPlayoff()!=null)
			{
				if(game.getPlayoff().getChampion().isEnabled())
					game.setChampion(game.getPlayoff().getChampion());
			}
			else if(game.getMatchday()!=null) 
				if(game.getMatchday().getTeamgroup().getChampion().isEnabled())
					game.setChampion(game.getMatchday().getTeamgroup().getChampion());
		
		return list;
	}

	@Override
	public List<Standing> findStandings(int teamid) {
		// TODO Auto-generated method stub
		Team team =this.findById(teamid);
		Hibernate.initialize(team.getStandings());
		for(Standing standing:team.getStandings())
			standing.setChampion(standing.getTeamgroup().getChampion());
		return team.getStandings();
	}

	@Override
	public List<Contact> findPlayers(int teamid) {
		// TODO Auto-generated method stub
		Team team =this.findById(teamid);
		Hibernate.initialize(team.getPlayers());
		return team.getPlayers();
	}

	@Override
	public List<Team> findByMessageDate() {
		// TODO Auto-generated method stub
		   @SuppressWarnings("unchecked")
		   //List<Object> list = getSession().createSQLQuery("select Q.*,P.last_used from ((SELECT max(M.date) D ,M.message, T.*,C.name adminname, C.username  from message M, contact C, team T  where M.contactid=C.id AND C.adminteamid = T.id group by M.contactid) UNION DISTINCT (SELECT max(date) D ,M.message, T.*,C.name adminname, C.username  from message M, contact C, team T  where M.receiverid=C.id AND C.adminteamid = T.id group by M.receiverid) UNION DISTINCT (select null, null, T.*,C.name adminname, C.username from team T LEFT JOIN contact C ON C.adminteamid = T.id) order by D DESC) Q left join persistent_logins P on Q.username = P.username").list();
		   List<Object> list = getSession().createSQLQuery("select Q.*,P.date from ((SELECT max(M.date) D ,M.message, T.*,C.name adminname, C.id cid from message M, contact C, team T  where M.contactid=C.id AND C.adminteamid = T.id group by M.contactid) UNION DISTINCT (SELECT max(date) D ,M.message, T.*,C.name adminname, C.username  from message M, contact C, team T  where M.receiverid=C.id AND C.adminteamid = T.id group by M.receiverid) UNION DISTINCT (select null, null, T.*,C.name adminname, C.id cid from team T LEFT JOIN contact C ON C.adminteamid = T.id) order by D DESC) Q left join mysession P on Q.cid = P.contactid order by P.date DESC").list();

		   List<Team> teamlist = new ArrayList<Team>();
		   for(int i=0; i<list.size(); i++) {
				Object[] row = (Object[]) list.get(i);
				boolean found =false;
				for(int d=0;d<teamlist.size();d++)
				{
					if(teamlist.get(d).getId()==(Integer) row[2])
					{
						found=true;
						break;
					}
				}
				if(!found)
				{

					Team team= new Team();
					team.setId((Integer) row[2]);
					team.setName((String) row[3]);
					team.setDescription((String) row[4]);
					team.setCoverpath((String) row[5]);
					team.setLogopath((String) row[6]);
					team.setLogothumbpath((String) row[7]);
					team.setAdminname((String) row[10]);
					team.setLastseenonline((Date) row[12]);
					teamlist.add(team);
				}
				System.out.println(row[0]+", "+ row[1]);
			}
		return teamlist;
	}

}
