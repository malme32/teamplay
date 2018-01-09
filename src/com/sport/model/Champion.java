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
@Table(name="champion")
public class Champion {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;


	@Column(name="name", length=250)
	private String name;
	
	@Column(name="startdate")
	private Date startdate;
	
	@Column(name="enddate")
	private Date enddate;
	
	@Column(name="enabled")
	Boolean enabled;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="champion",cascade = CascadeType.ALL)
	List<Teamgroup> teamgroups;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="champion",cascade = CascadeType.ALL)
	List<Playoff> playoffs;
	

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

	public List<Teamgroup> getTeamgroups() {
		return teamgroups;
	}

	public void setTeamgroups(List<Teamgroup> teamgroups) {
		this.teamgroups = teamgroups;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public List<Playoff> getPlayoffs() {
		return playoffs;
	}

	public void setPlayoffs(List<Playoff> playoffs) {
		this.playoffs = playoffs;
	}

	public Boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}




}
