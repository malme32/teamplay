package com.phonebook.service;




import java.util.List;

import com.phonebook.model.Contact;
import com.phonebook.model.Salary;

public interface SalaryService {
	   
	   public void addSalary (Salary salary);
	   public List<Salary> getContactSalaries(int id);
}
