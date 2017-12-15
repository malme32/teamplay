package com.phonebook.model;


import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Userrole", catalog = "test"
//,
//	uniqueConstraints = @UniqueConstraint(
//		columnNames = { "role", "id" })
)
public class Userrole{

	private Integer userRoleId;
	//private Contact contact;
	private String role;

	public Userrole() {
	}

//	public Userrole(Contact contact, String role) {
//		this.contact = contact;
//		this.role = role;
//	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "user_role_id",
		unique = true, nullable = false)
	public Integer getUserRoleId() {
		return this.userRoleId;
	}

	public void setUserRoleId(Integer userRoleId) {
		this.userRoleId = userRoleId;
	}

//	@ManyToOne(fetch = FetchType.LAZY)
//	//@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "id", nullable = false)
//	public Contact getContact() {
//		return this.contact;
//	}
//
//	public void setContact(Contact contact) {
//		this.contact = contact;
//	}

	@Column(name = "role", nullable = false, length = 45)
	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}