package com.sport.model;

import java.util.List;

import com.general.model.Message;

public class Notification {

	private  List<Message> messages;

	private List<Game> teamgames;
	
	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public List<Game> getTeamgames() {
		return teamgames;
	}

	public void setTeamgames(List<Game> teamgames) {
		this.teamgames = teamgames;
	}
	
}
