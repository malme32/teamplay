package com.phonebook.controller;

import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.type.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.event.configuration.AppConfig;
import com.event.model.Event;
import com.event.service.GeneralDaoService;
import com.event.service.MessageService;
import com.general.model.Message;
import com.phonebook.model.Contact;
import com.phonebook.model.Position;
import com.phonebook.model.Salary;
import com.phonebook.service.ContactService;
import com.phonebook.service.SalaryService;
import com.sport.model.Champion;

@Controller
public class ContactController {
	//static ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
	

	
/*	static AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppConfig.class);
	static ContactService contactService = (ContactService)ctx.getBean("contactService");
	static SalaryService salaryService = (SalaryService)ctx.getBean("salaryService");
	*/
	
	@Autowired
	private SalaryService salaryService;
	
	
	@Autowired
	private ContactService contactService;

	@Autowired
	private GeneralDaoService generalDaoService;

	@Autowired
	private MessageService messageService;
	
	//////////////////////////////////////
	/////////////GET///////////////////////
	/////////////////////////////////////
	
	@RequestMapping(value="/contacts", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Contact> getContactList()
	{
		
		return contactService.getContacts();
	}
	@RequestMapping(value="/contacts/search/{searchstr}", method=RequestMethod.GET)
	public @ResponseBody List<Contact> searchContact(@PathVariable("searchstr") String searchstr)
	{

		return contactService.searchContactQuery(searchstr);
	}
	
	
	@RequestMapping(value="/contacts/{id}", method=RequestMethod.GET)
	public @ResponseBody Contact getContact(@PathVariable("id") int id)
	{
		
		return contactService.getContact(id);
	}
	
	
	@RequestMapping(value="/contacts/columns", method=RequestMethod.GET)
	public @ResponseBody Type[] getContactColumns()
	{
	
		return contactService.getColumns();
	}
	
	@RequestMapping(value="/contacts/{id}/salaries", method=RequestMethod.GET)
	public @ResponseBody List<Salary> getContactSalaries(@PathVariable("id") int id)
	{		
		//System.out.println(contactService.getContact(id).getName());
		return salaryService.getContactSalaries(id);
	}
	
	@RequestMapping(value="/tables", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<String> getTableNames()
	{
		System.out.println(Contact.class);
		return contactService.getTableNames();
	}
	
	@RequestMapping(value="/contacts/{contactid}/events", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Event> getEventofContact(@PathVariable int contactid)
	{

		return contactService.getContactEvents(contactid);
	}
	
	
	@RequestMapping(value="/contacts/{friendid}/messages", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Message> getMessages(@PathVariable Integer friendid, @RequestParam(required=false) Integer lastid)
	{
		
		 User user =null; 
		 try{user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();}
		 catch(Exception e){}
		 if(user!=null)
		 {
			 String username = user.getUsername();
			 Contact contact = contactService.findByUserName(username);
			return messageService.getMessages(contact.getId(), friendid, lastid);

		 }
		 return null;
		
	
	}
	
	
	//////////////////////////////////////
	/////////////POST///////////////////////
	/////////////////////////////////////
	
	@RequestMapping(value="/contacts", method=RequestMethod.POST)
	public @ResponseBody void addContact(@ModelAttribute("contact")Contact contact,  @RequestParam("position_id") int position_id)
	{
		contact.setPosition(contactService.getPosition(position_id));
		contactService.addContact(contact);
		return;
	}
	
	@RequestMapping(value="/salaries", method=RequestMethod.POST)
	public @ResponseBody void addSalary(@ModelAttribute("salary")Salary salary, @RequestParam("id") int id)
	{
		salary.setContact(contactService.getContact(id));
		salaryService.addSalary(salary);
		return;
	}
	
	@RequestMapping(value="/positions", method=RequestMethod.POST)
	public @ResponseBody void addPosition(@ModelAttribute("position")Position position)
	{
		contactService.addObject(position);
		return;
	}
	
	
	@RequestMapping(value="/messages", method=RequestMethod.POST)
	public @ResponseBody Message addMessage(@ModelAttribute Message message, @RequestParam("receiverid") int receiverid)
	{
		 User user =null; 
		 try{user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();}
		 catch(Exception e){}
		 if(user!=null)
		 {
			 	String username = user.getUsername();
			 	Contact contact = contactService.findByUserName(username);
				message.setContact(contact);
				message.setReceiver(contactService.getContact(receiverid));
				message.setDate(new Date());
				message.setSeen(false);
				message.setDelivered(false);
				message.setStatus("Sent");
				generalDaoService.persist(message);
				return message;
		 }
		//messageService.addMessage(message, senderid, receiverid);
		return null;
	}
	
	//////////////////////////////////////
	/////////////PUT///////////////////////
	/////////////////////////////////////
	
	
	@RequestMapping(value="/contacts", method=RequestMethod.PUT)
	public @ResponseBody void updateContact( @RequestParam("position_id") int position_id, @ModelAttribute("contact")Contact contact, BindingResult result, ModelMap model)
	{
		contact.setPosition(contactService.getPosition(position_id));
		contactService.updateContact(contact);
		return;
	}
	
	@Secured({"ROLE_ADMIN", "ROLE_TEAM"})
	@RequestMapping(value="/contacts/{{id}}/actions", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void contactActions(@PathVariable int id, @RequestParam String action,  @RequestParam(required=false) int receiverid)
	{
		if(action.equals("seenmessages"))
		 messageService.setSeenMessages(id, receiverid);
		 return ;
	}
	//////////////////////////////////////
	/////////////DELETE///////////////////////
	/////////////////////////////////////

	

	@RequestMapping(value="/contacts", method=RequestMethod.DELETE)
	public @ResponseBody void deleteContact(@ModelAttribute("contact")Contact contact, BindingResult result, ModelMap model)
	{
		
		contactService.deleteContact(contact);
		return;
	}

	

	
/*	@RequestMapping(value="/contacts/deleteall", method=RequestMethod.DELETE)
	public @ResponseBody void deleteAllContacts()
	{
		//System.out.println();
		contactService.deleteAllContacts();
		return;
	}
	*/


}
