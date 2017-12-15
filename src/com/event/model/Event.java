package com.event.model;

import java.util.ArrayList;
import java.util.Date;
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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.phonebook.model.Contact;

@Entity
@Table(name="event")
public class Event {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="name",length = 200)
	private String name;
	
	@Column(name="description",length = 200)
	private String description;
	
	@Column(name="date")
	private Date date;
	
	@JsonIgnore
	@OneToMany(mappedBy="event",fetch=FetchType.LAZY, cascade = CascadeType.ALL)
	List<Message> messages;
	


	@ManyToOne
	@JoinColumn(name="adminid", nullable=false)
	private Contact admin;
	
	
	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(
	        name = "eventplayerxref",
	        joinColumns = @JoinColumn(name = "eventid"),
	        inverseJoinColumns = @JoinColumn(name = "playerid")
	)
	private List<Contact> players = new ArrayList<Contact>();
	 
	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public void setPlayers(List<Contact> players) {
		this.players = players;
	}

	public List<Contact> getPlayers() {
		return players;
	}

	public void setContacts(List<Contact> contacts) {
		this.players = contacts;
	}

	public Contact getAdmin() {
		return admin;
	}

	public void setAdmin(Contact contact) {
		this.admin = contact;
	}

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
