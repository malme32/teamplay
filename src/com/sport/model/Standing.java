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
@Table(name="standing")
public class Standing {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "teamgroupid")
	private Teamgroup teamgroup;
	
	@ManyToOne
	@JoinColumn(name = "teamid", nullable=false)
	private Team team;

	
	@Column(name="grade",nullable =false, columnDefinition = "int default 0")
	private int grade;
	
	@Column(name="goal", columnDefinition = "int default 0")
	private int goal;
	
	@Column(name="goalplus", columnDefinition = "int default 0")
	private int goalplus;
	
	@Column(name="goalminus", columnDefinition = "int default 0")
	private int goalminus;
	
	@Column(name="game", columnDefinition = "int default 0")
	private int game;
	
	@Column(name="win", columnDefinition = "int default 0")
	private int win;
	
	@Column(name="defeat", columnDefinition = "int default 0")
	private int defeat;
	
	@Column(name="draw", columnDefinition = "int default 0")
	private int draw;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Teamgroup getTeamgroup() {
		return teamgroup;
	}

	public void setTeamgroup(Teamgroup teamgroup) {
		this.teamgroup = teamgroup;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public int getGoalplus() {
		return goalplus;
	}

	public void setGoalplus(int goalplus) {
		this.goalplus = goalplus;
	}

	public int getGoalminus() {
		return goalminus;
	}

	public void setGoalminus(int goalminus) {
		this.goalminus = goalminus;
	}

/*	public int getMatch() {
		return match;
	}

	public void setMatch(int match) {
		this.match = match;
	}
*/
	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public int getDefeat() {
		return defeat;
	}

	public void setDefeat(int defeat) {
		this.defeat = defeat;
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getGame() {
		return game;
	}

	public void setGame(int game) {
		this.game = game;
	}
	



/*
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="team2",cascade = CascadeType.ALL)
	List<Game> team2games;
	*/

	

}
