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

@Entity
@Table(name="playoff")
public class Playoff {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	
	@Column(name="name", length=150,nullable=false)
	private String name;
	
	@ManyToOne
	@JoinColumn(name="championid")
	private Champion champion;
	

	@Column(name="phase")
	private Integer phase;
	
	//@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="playoff",cascade = CascadeType.ALL)
	List<Game> games;



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


	public List<Game> getGames() {
		return games;
	}


	public void setGames(List<Game> games) {
		this.games = games;
	}


	public Integer getPhase() {
		return phase;
	}


	public void setPhase(Integer phase) {
		this.phase = phase;
	}

}
