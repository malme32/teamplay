package com.sport.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.general.model.Message;
import com.phonebook.model.Contact;

@Entity
@Table(name="game")
public class Game {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name="teamid1")
	private Team team1;



	@ManyToOne
	@JoinColumn(name="teamid2")
	private Team team2;
	

	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(
	        name = "teamplayerxref",
	        joinColumns = @JoinColumn(name = "teamid"),
	        inverseJoinColumns = @JoinColumn(name = "playerid")
	)
	private List<Contact> players = new ArrayList<Contact>();

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "matchdayid")
	private Matchday matchday;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "playoffid")
	private Playoff playoff;
	
/*	@Column(name="phase")
	private Integer phase*/;
	
	@Column(name="date")
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM-dd-yyyy HH:mm:ss", timezone = "Europe/Athens")
	private Date date;
	
	@Column(name="score1")
	private String score1;


	@Column(name="score2")
	private String score2;

	
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="game",cascade = CascadeType.ALL)
	List<Scorer> scorers;
	
	@Transient
	private Champion champion;
	
	public Matchday getMatchday() {
		return matchday;
	}


	public void setMatchday(Matchday matchday) {
		this.matchday = matchday;
	}


	public int getId() {
		return id;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public void setId(int id) {
		this.id = id;
	}


	public List<Contact> getPlayers() {
		return players;
	}


	public void setPlayers(List<Contact> players) {
		this.players = players;
	}

	
	public Team getTeam1() {
		return team1;
	}


	public void setTeam1(Team team1) {
		this.team1 = team1;
	}


	public Team getTeam2() {
		return team2;
	}


	public void setTeam2(Team team2) {
		this.team2 = team2;
	}


	public String getScore1() {
		return score1;
	}


	public void setScore1(String score1) {
		this.score1 = score1;
	}


	public String getScore2() {
		return score2;
	}


	public void setScore2(String score2) {
		this.score2 = score2;
	}


	public List<Scorer> getScorers() {
		return scorers;
	}


	public void setScorers(List<Scorer> scorers) {
		this.scorers = scorers;
	}

/*

	public Integer getPhase() {
		return phase;
	}


	public void setPhase(Integer phase) {
		this.phase = phase;
	}
*/

	public Playoff getPlayoff() {
		return playoff;
	}


	public void setPlayoff(Playoff playoff) {
		this.playoff = playoff;
	}


	public Champion getChampion() {
		return champion;
	}


	public void setChampion(Champion champion) {
		this.champion = champion;
	}





	
	
}
