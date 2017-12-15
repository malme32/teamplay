package com.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SportGuiController {
	
	@RequestMapping(value="/championlist", method=RequestMethod.GET)
	public ModelAndView championList(){
		return new ModelAndView("championlist","","");
	}
	@RequestMapping(value="/champion", method=RequestMethod.GET)
	public ModelAndView champion(){
		return new ModelAndView("champion","","");
	}
	@RequestMapping(value="/start", method=RequestMethod.GET)
	public ModelAndView start(){
		return new ModelAndView("start","","");
	}
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public ModelAndView admin(){
		return new ModelAndView("admin","","");
	}
	
	@RequestMapping(value="/adminchampions", method=RequestMethod.GET)
	public ModelAndView adminChampions(){
		return new ModelAndView("adminchampions","","");
	}
	
	@RequestMapping(value="/adminteams", method=RequestMethod.GET)
	public ModelAndView adminTeams(){
		return new ModelAndView("adminteams","","");
	}
	
/*	@RequestMapping(value="/event", method=RequestMethod.GET)
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
	}*/
	
////////////ROSSONERI- THEME1///////////////////////
	
	@RequestMapping(value="/soccer", method=RequestMethod.GET)
	public ModelAndView index(){
		return new ModelAndView("theme1/index","","");
	}
	
	@RequestMapping(value="/home1", method=RequestMethod.GET)
	public ModelAndView home(){
		return new ModelAndView("theme1/home","","");
	}
	
	@RequestMapping(value="/header1", method=RequestMethod.GET)
	public ModelAndView header1(){
		return new ModelAndView("theme1/header","","");
	}
	
	@RequestMapping(value="/footer1", method=RequestMethod.GET)
	public ModelAndView footer1(){
		return new ModelAndView("theme1/footer","","");
	}	
	
	@RequestMapping(value="/point-table", method=RequestMethod.GET)
	public ModelAndView pointtable(){
		return new ModelAndView("theme1/point-table","","");
	}	
	@RequestMapping(value="/team-detail", method=RequestMethod.GET)
	public ModelAndView teamdetail(){
		return new ModelAndView("theme1/team-detail","","");
	}
	
	@RequestMapping(value="/team-list", method=RequestMethod.GET)
	public ModelAndView teamlist(){
		return new ModelAndView("theme1/team-list","","");
	}	
/*	@RequestMapping(value="/point-table2", method=RequestMethod.GET)
	public ModelAndView pointtable2(){
		return new ModelAndView("theme1/point-table2","","");
	}*/
}
