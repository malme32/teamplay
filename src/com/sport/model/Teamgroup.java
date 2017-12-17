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
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.phonebook.model.Contact;
import com.phonebook.model.Position;

@Entity
@Table(name="teamgroup")
public class Teamgroup {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;


	@Column(name="name", length=250)
	private String name;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "championid", nullable = false)
	private Champion champion;
	
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="teamgroup",orphanRemoval = true, cascade = CascadeType.ALL)
	List<Matchday> matchdays;

	/*@JsonIgnore*/
	@OneToMany(fetch = FetchType.EAGER,mappedBy="teamgroup",cascade = CascadeType.ALL)
	List<Standing> standings;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="teamgroup",cascade = CascadeType.ALL)
	List<Scorer> scorers;
	
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

	public Champion getChampion() {
		return champion;
	}

	public void setChampion(Champion champion) {
		this.champion = champion;
	}
	


	public List<Matchday> getMatchdays() {
		return matchdays;
	}

	public void setMatchdays(List<Matchday> matchdays) {
		this.matchdays = matchdays;
	}

	public List<Standing> getStandings() {
		return standings;
	}

	public void setStandings(List<Standing> standings) {
		this.standings = standings;
	}

	public List<Scorer> getScorers() {
		return scorers;
	}

	public void setScrorers(List<Scorer> scorers) {
		this.scorers = scorers;
	}
	
/*	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="team1",cascade = CascadeType.ALL)
	List<Game> team1games;


	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="team2",cascade = CascadeType.ALL)
	List<Game> team2games;
	*/

	

}
