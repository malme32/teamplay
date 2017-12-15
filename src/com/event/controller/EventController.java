package com.event.controller;

import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.event.configuration.AppConfig;
import com.event.model.Event;
import com.event.model.Message;
import com.event.service.EventService;
import com.event.service.SportService;

import com.phonebook.model.Contact;
import com.phonebook.service.ContactService;
import com.phonebook.service.SalaryService;

@Controller

public class EventController {

/*	@Autowired
	static ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
	static ContactService contactService = (ContactService)ctx.getBean("contactService");
	static SalaryService salaryService = (SalaryService)ctx.getBean("salaryService");*/
	
/*	@Autowired
	@Qualifier("eventService")
	private EventService eventService;*/
	
	
/*	@RequestMapping(value="/eventlist", method=RequestMethod.GET)
	public ModelAndView eventList(){
		return new ModelAndView("eventlist","","");
	}
	*/
	@Autowired
	private EventService eventService;
	@Autowired
	private ContactService contactService;
	
/*	@Autowired
	private SportService sportService;*/

	@RequestMapping(value="/events", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Event> getEventList()
	{
		//AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
      //  AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
		//EventService service = (EventService) context.getBean("eventService");
			//System.out.println( service.findPlayerById(1) + " here");
		//context.close();
		return eventService.findAllEvents();
	}
	
			
	@RequestMapping(value="/events", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addPlayer(@ModelAttribute Event event)
	{
		//AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        //AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
		
		 User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username = user.getUsername();
		 Contact contact = contactService.findByUserName(username);
		 event.setAdmin(contact);
		 eventService.persist(event);
		//service.findPlayerById(id);
			//System.out.println( service.findPlayerById(1) + " here");
		//context.close();
		return ;
	}
	
	
	@RequestMapping(value="/events/{id}", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody Event getEvent(@PathVariable int id)
	{
		//AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
       // AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
		//EventService service = (EventService) context.getBean("eventService");
			//System.out.println( service.findPlayerById(1) + " here");
		//context.close();
		return eventService.findEventById(id);
	}
/*		
	@RequestMapping(value="/players", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addPlayer(@ModelAttribute Contact player)
	{
		AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        //AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
		EventService service = (EventService) context.getBean("eventService");
		service.persist(player);
		//service.findPlayerById(id);
			//System.out.println( service.findPlayerById(1) + " here");
		//context.close();
		return ;
	}
	*/
	

	
	@RequestMapping(value="/events/{eventid}/players/{contactid}", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void addPlayerToEvent(@PathVariable int eventid, @PathVariable int contactid)
	{
/*
		AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
		EventService service = (EventService) context.getBean("eventService");
		ContactService contactService = (ContactService)context.getBean("contactService");*/
		
		eventService.addPlayerToEvent(eventService.findEventById(eventid), contactService.getContact(contactid));
		//service.findPlayerById(id);
			//System.out.println( service.findPlayerById(1) + " here");
		//context.close();
		return ;
	}
	
	@RequestMapping(value="/events/{eventid}/messages", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Message> getEventMessages(@PathVariable int eventid)
	{

	/*	AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
		EventService service = (EventService) context.getBean("eventService");*/
		
		return eventService.getMessages(eventid);
	}
	
	@RequestMapping(value="/events/{eventid}/players", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Contact> getEventPlayers(@PathVariable int eventid)
	{

	/*	AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
		EventService service = (EventService) context.getBean("eventService");*/
		
		return eventService.getPlayers(eventid);
	}
}
