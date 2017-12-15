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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.phonebook.model.Contact;


@Entity
@Table(name="scorer")
public class Scorer {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;


	@Column(name="name", length=250)
	private String name;
	
	
	@ManyToOne
	@JoinColumn(name = "teamgroupid")
	private Teamgroup teamgroup;
	
	@ManyToOne
	@JoinColumn(name = "contactid")
	private Contact contact;

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

	

}
