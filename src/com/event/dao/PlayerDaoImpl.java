package com.event.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.event.model.Event;
import com.event.model.Player;

@Repository("playerDao")
public class PlayerDaoImpl extends AbstractDao implements PlayerDao {

/*	@Override
	public void savePlayer(Player player) {
		// TODO Auto-generated method stub
		
	}
*/
	@Override
	public List<Player> findAllPlayers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deletePlayerBySsn(String ssn) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Player findPlayerById(int id) {

		// TODO Auto-generated method stub
		//return (Player)getSession().createQuery("from Player where id  = '"+id+"'").list().get(0);
		return (Player)getSession().createQuery("from Player where id=:id").setParameter("id", id).list().get(0);

	}

	@Override
	public void updateEmployee(Player player) {
		// TODO Auto-generated method stub
		
	}


}
