package com.phonebook.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="salary")
public class Salary {
@Id
@Column(name="salary_id")
@GeneratedValue(strategy=GenerationType.IDENTITY)
int salary_id;
double salary;
Date date;

@ManyToOne
@JoinColumn(name = "id")
private Contact contact;

public Contact getContact() {
	return contact;
}
public void setContact(Contact contact) {
	this.contact = contact;
}
public int getSalary_id() {
	return salary_id;
}
public void setSalary_id(int salary_id) {
	this.salary_id = salary_id;
}
public double getSalary() {
	return salary;
}
public void setSalary(double salary) {
	this.salary = salary;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}

}
