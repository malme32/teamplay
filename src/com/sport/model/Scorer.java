package com.sport.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.phonebook.model.Contact;


@Entity
@Table(name="scorer")
@JsonAppend(
	    attrs = {
	        @JsonAppend.Attr(value = "ApprovalState")
	    }
	)
public class Scorer {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;


/*	@Column(name="name", length=250)
	private String name;
	*/
	@Column(name="number")
	private int number;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "teamgroupid")
	private Teamgroup teamgroup;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "gameid")
	private Game game;
	


	@ManyToOne
	@JoinColumn(name = "contactid")
	private Contact contact;

	@Transient
	private Team team;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

/*	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}*/

	public Teamgroup getTeamgroup() {
		return teamgroup;
	}

	public void setTeamgroup(Teamgroup teamgroup) {
		this.teamgroup = teamgroup;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

/*
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="team2",cascade = CascadeType.ALL)
	List<Game> team2games;
	*/

	public Game getGame() {
		return game;
	}

	public void setGame(Game game) {
		this.game = game;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

}
