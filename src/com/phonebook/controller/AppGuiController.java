package com.phonebook.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.phonebook.service.ContactService;

@Controller
public class AppGuiController {
	
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public ModelAndView getMain()
	{
		//ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
		//ContactService contactService = (ContactService)ctx.getBean("contactService");
		
		return new ModelAndView("main","contactlist","");
	}
	
	@RequestMapping(value="phonebook", method=RequestMethod.GET)
	public ModelAndView getContactList()
	{
		//ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
		//ContactService contactService = (ContactService)ctx.getBean("contactService");
		
		return new ModelAndView("phonebook","","");
	}
	
	
//	
//	@RequestMapping(value="", method=RequestMethod.GET)
//	public ModelAndView getHome()
//	{
//		//ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
//		//ContactService contactService = (ContactService)ctx.getBean("contactService");
//		
//		return new ModelAndView("phonebook","contactlist","");
//	}
//	


	
/*	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public ModelAndView loginPage(@RequestParam(value = "error",required = false) String error,
	@RequestParam(value = "logout",	required = false) String logout) {
		
		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid Credentials provided.");
		}

		if (logout != null) {
			model.addObject("message", "Logged out from phonebook successfully.");
		}

		model.setViewName("loginPage");
		return model;
	}
	
	*/
//	@RequestMapping(value="contacts/{id}", method=RequestMethod.GET)
//	public ModelAndView getContact(@PathVariable String id)
//	{
//			return new ModelAndView("phonebook","contactlist",id);
//	}
}
