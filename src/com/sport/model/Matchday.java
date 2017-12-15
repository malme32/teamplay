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

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.event.model.Event;
import com.event.model.Message;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.phonebook.model.Contact;
import com.phonebook.model.Position;

@Entity
@Table(name="matchday")
public class Matchday {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;


	@Column(name="name", length=250)
	private String name;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "teamgroupid", nullable=false)
	private Teamgroup teamgroup;

	
	//@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="matchday",cascade = CascadeType.ALL)
	List<Game> games;
	

	@Column(name="startdate")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM-dd-yyyy HH:mm:ss", timezone = "Europe/Athens")
	private Date startdate;
	
	@Column(name="enddate")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM-dd-yyyy HH:mm:ss", timezone = "Europe/Athens")
	private Date enddate;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Teamgroup getTeamgroup() {
		return teamgroup;
	}

	public void setTeamgroup(Teamgroup teamgroup) {
		this.teamgroup = teamgroup;
	}

	public List<Game> getGames() {
		return games;
	}

	public void setGames(List<Game> games) {
		this.games = games;
	}


	
/*	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="team1",cascade = CascadeType.ALL)
	List<Game> team1games;


	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="team2",cascade = CascadeType.ALL)
	List<Game> team2games;
	*/

	

}
