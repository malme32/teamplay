package com.sport.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

@Entity
@Table(name="notice")
public class Notice {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;


	@Column(name="title", length=300)
	private String title;
	

	@Column(name="content", length=4000)
	private String content;

	@Column(name="date")
	private Date date;
	
	@Column(name="imageurl", length=300)
	private String imageurl;
	

	@Column(name="thumburl", length=300)
	private String thumburl;

	@Column(name="important")
	private Boolean important;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getImageurl() {
		return (this.imageurl==null||this.imageurl.equals("")) ? (String) "/defaultimages/newsdefaultimage.jpg" : imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public String getThumburl() {
	
		return (this.thumburl==null||this.thumburl.equals("")) ? (String) "/defaultimages/newsdefaultthumb.jpg" : thumburl;
	}

	public void setThumburl(String thumburl) {
		this.thumburl = thumburl;
	}

	public Boolean getImportant() {
		return important;
	}

	public void setImportant(Boolean important) {
		this.important = important;
	}

}
