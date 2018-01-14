package com.phonebook.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
import javax.persistence.*;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.security.access.annotation.Secured;

import com.event.model.Event;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sport.model.Scorer;
import com.sport.model.Team;

//@XmlRootElement
@Entity
@Table(name="Contact")
//@Indexed
public class Contact  implements InitializingBean{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	String phonenumber;
	String username;

    boolean enabled;

	String address;
	String mobilenumber;
	
	@JsonIgnore
	@Column(name="password")
	String password;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="contact",cascade = CascadeType.ALL )
	List<Salary> salaries;

	String name;

	Integer age;
	String email;
	
	
	@Column(name="number")
	String number;
	
	@Column(name="imagepath", length=150)
	String imagepath;

	@Column(name="thumbpath", length=150)
	String thumbpath;
	
/*	private List<Userrole> userrole = new HashSet<Userrole>(0);
	@ManyToOne
	@JoinColumn(name = "user_role_id")
	private Userrole userrole;
	
	*/
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="contact",cascade = CascadeType.ALL)
	private List<Userrole> userroles;
	
	
	@ManyToOne
	@JoinColumn(name = "position_id")
	private Position position;
	
	
	@Column(name = "soccerposition")
	private String soccerposition;
	
	
	@OneToOne
	@JoinColumn(name = "adminteamid", unique=true)
	private Team adminteam;
	
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="admin",cascade = CascadeType.ALL)
	private List<Event> adminevents;
	
	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "players")
	private List<Event> events;// = new ArrayList<Event>();
	//, cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.REFRESH,CascadeType.PERSIST}
	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY,mappedBy ="players",cascade= {CascadeType.DETACH,
            CascadeType.MERGE,
            CascadeType.REFRESH,
            CascadeType.PERSIST})
	private List<Team> teams = new ArrayList<Team>();
	
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy="contact",cascade = CascadeType.ALL)
	private List<Scorer> scorers;
	
	public List<Team> getTeams() {
		return teams;
	}
	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}
	public List<Event> getAdminevents() {
		return adminevents;
	}
	public void setAdminevents(List<Event> adminevents) {
		this.adminevents = adminevents;
	}
	public List<Event> getEvents() {
		return events;
	}
	public void setEvents(List<Event> events) {
		this.events = events;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}	
	
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
public String getEmail() {
		return email;
	}

	public List<Salary> getSalaries() {
	return salaries;
	}
	public void setSalaries(List<Salary> salaries) {
	this.salaries = salaries;
	}


	public Position getPosition() {
	return position;
}

public void setPosition(Position position) {
	this.position = position;
}
	public void setEmail(String email) {
		this.email = email;
	}
public String getMobilenumber() {
		return mobilenumber;
	}
	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
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
public Integer getAge() {
	return age;
}
public void setAge(Integer age) {
	this.age = age;
}
public String getPhonenumber() {
	return phonenumber;
}
public void setPhonenumber(String phonenumber) {
	this.phonenumber = phonenumber;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}



/*public Userrole getUserrole() {
	return userrole;
}
public void setUserrole(Userrole userrole) {
	this.userrole = userrole;
}*/

//@OneToMany(fetch = FetchType.LAZY, mappedBy = "contact")
//public Set<Userrole> getUserrole() {
//	return this.userrole;
//}
//public void setUserrole(Set<Userrole> userrole) {
//	this.userrole = userrole;
//}


@Override
public void afterPropertiesSet() throws Exception {
	// TODO Auto-generated method stub
	System.out.println("Properties Set");
}
public List<Scorer> getScorers() {
	return scorers;
}
public void setScorers(List<Scorer> scorers) {
	this.scorers = scorers;
}
public String getNumber() {
	return (this.number==null) ?  "" : number;

}
public void setNumber(String number) {
	this.number = number;
}

public String getImagepath() {
	return (this.imagepath==null||this.imagepath.equals("")) ? (String) "/defaultimages/playerdefaultimage.png" : imagepath;
}
public void setImagepath(String imagepath) {
	this.imagepath = imagepath;
}
public String getSoccerposition() {
	return soccerposition;
}
public void setSoccerposition(String soccerposition) {
	this.soccerposition = soccerposition;
}
public List<Userrole> getUserroles() {
	return userroles;
}
public void setUserroles(List<Userrole> userroles) {
	this.userroles = userroles;
}
public Team getAdminteam() {
	return adminteam;
}
public void setAdminteam(Team adminteam) {
	this.adminteam = adminteam;
}
public String getThumbpath() {

	return (this.thumbpath==null||this.thumbpath.equals("")) ? (String) "/defaultimages/playerdefaultthumb.png" : thumbpath;

}
public void setThumbpath(String thumbpath) {
	this.thumbpath = thumbpath;
}


}
