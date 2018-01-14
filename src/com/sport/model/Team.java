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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.event.model.Event;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.general.model.Message;
import com.phonebook.model.Contact;

@Entity
@Table(name="team")
public class Team {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	
	@Column(name="name", length=150,nullable=false, unique=true)
	private String name;
	

	
	@Column(name="logopath", length=200)
	private String logopath;
	
	
	
	@Column(name="logothumbpath", length=200)
	private String logothumbpath;
	
	@Column(name="coverpath", length=200)
	private String coverpath;
	
	@Column(name="description", length=1000)
	private String description;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="team1",cascade = CascadeType.ALL)
	List<Game> team1games;


	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="team2",cascade = CascadeType.ALL)
	List<Game> team2games;
	
	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY,cascade = {CascadeType.ALL})
	@JoinTable(
	        name = "teamplayerxref",
	        joinColumns = @JoinColumn(name = "teamid"),
	        inverseJoinColumns = @JoinColumn(name = "playerid")
	)
	private List<Contact> players = new ArrayList<Contact>();

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="team",cascade = CascadeType.ALL)
	private List<Standing> standings;
	
	@JsonIgnore	
	@OneToOne(fetch = FetchType.LAZY,mappedBy="adminteam",cascade = CascadeType.ALL)
	private Contact admin;
	
	public int getId() {
		return id;
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
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public List<Game> getTeam1games() {
		return team1games;
	}


	public void setTeam1games(List<Game> team1games) {
		this.team1games = team1games;
	}


	public List<Game> getTeam2games() {
		return team2games;
	}


	public void setTeam2games(List<Game> team2games) {
		this.team2games = team2games;
	}


	public List<Standing> getStandings() {
		return standings;
	}


	public void setStandings(List<Standing> standings) {
		this.standings = standings;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getLogopath() {
		//return (this.logopath==null||this.logopath.equals("")) ? (String) "/defaultimages/teamdefaultlogo.png" : logopath;
		return (this.logopath==null||this.logopath.equals("")) ? (String) "/defaultimages/teamdefaultlogo.png" : logopath;
		
	}


	public void setLogopath(String logopath) {
		this.logopath = logopath;
	}


	public String getCoverpath() {
		return (this.coverpath==null||this.coverpath.equals("")) ? (String) "/defaultimages/teamdefaultcover.jpg" : coverpath;
	}


	public void setCoverpath(String coverpath) {
		this.coverpath = coverpath;
	}


	public String getLogothumbpath() {
		return (this.logothumbpath==null||this.logothumbpath.equals("")) ? (String) "/defaultimages/teamdefaultlogothumb.png" : logothumbpath;
	}


	public void setLogothumbpath(String logothumbpath) {
		this.logothumbpath = logothumbpath;
	}


	public Contact getAdmin() {
		return admin;
	}


	public void setAdmin(Contact admin) {
		this.admin = admin;
	}

}
