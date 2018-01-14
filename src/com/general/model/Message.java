package com.general.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;

import com.event.model.Event;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.phonebook.model.Contact;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
@Table(name="message")
public class Message {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="message",length = 500)
	private String message;
	
	
	@Column(name="date")
	private Date date;
	

	@Column(name="seen")
	private Boolean seen;

	@Column(name="delivered")
	private Boolean delivered;

	@Column(name="status")
	private String status;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="eventid", nullable=true)
	private Event event;
	
	@ManyToOne
	@JoinColumn(name="contactid", nullable=true)
	private Contact contact;
	
	@ManyToOne
	@JoinColumn(name="receiverid", nullable=true)
	private Contact receiver;
	

	

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Boolean getSeen() {
		return seen;
	}

	public void setSeen(Boolean seen) {
		this.seen = seen;
	}

	public Boolean getDelivered() {
		return delivered;
	}

	public void setDelivered(Boolean delivered) {
		this.delivered = delivered;
	}

	public Contact getReceiver() {
		return receiver;
	}

	public void setReceiver(Contact receiver) {
		this.receiver = receiver;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
