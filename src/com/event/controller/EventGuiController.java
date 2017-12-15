package com.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventGuiController {
	
	@RequestMapping(value="/eventlist", method=RequestMethod.GET)
	public ModelAndView eventList(){
		return new ModelAndView("eventlist","","");
	}
	
	@RequestMapping(value="/event", method=RequestMethod.GET)
	public ModelAndView event(){
		return new ModelAndView("event","","");
	}
	@RequestMapping(value="/newevent", method=RequestMethod.GET)
	public ModelAndView newevent(){
		return new ModelAndView("newevent","","");
	}
	@RequestMapping(value="/contact", method=RequestMethod.GET)
	public ModelAndView contact(){
		return new ModelAndView("contact","","");
	}
	
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView home(){
		return new ModelAndView("home","","");
	}
}
