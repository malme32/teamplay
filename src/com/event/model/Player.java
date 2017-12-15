package com.event.model;


import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="player")
public class Player {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;

	@Column(name="name",length = 200)
	String name;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="admin",cascade = CascadeType.ALL)
	List<Event> adminevents;
	
	@JsonIgnore
	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "players")
	private Set<Event> events = new HashSet<Event>();
	

	

	
	public int getId() {
		return id;
	}
	


	public void setId(int id) {
		this.id = id;
	}

	public List<Event> getAdminevents() {
		return adminevents;
	}

	public void setAdminevents(List<Event> adminevents) {
		this.adminevents = adminevents;
	}

	public Set<Event> getEvents() {
		return events;
	}

	public void setEvents(Set<Event> events) {
		this.events = events;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
