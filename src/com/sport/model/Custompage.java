package com.sport.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="custompage")
public class Custompage {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;


	@Column(name="title", length=100)
	private String title;
	

	@Column(name="content", length=6000)
	private String content;
	
	@Column(name="link", length=3000)
	private String link;
	
	
	/*@JsonIgnore*/
	@OneToMany(fetch = FetchType.EAGER,mappedBy="custompage",cascade = CascadeType.ALL)
	private List<Image> images;

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

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}



}
