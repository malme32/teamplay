package com.event.dao;


import java.util.List;

import com.event.model.Player;


public interface PlayerDao {
 
   /* void addPlayer(Player player);*/
     
    List<Player> findAllPlayers();
     
    void deletePlayerBySsn(String ssn);
     
    public Player findPlayerById(int id);
     
    void updateEmployee(Player player);
}