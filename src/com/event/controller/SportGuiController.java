package com.event.controller;

import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.event.service.SportService;
import com.phonebook.model.Contact;
import com.phonebook.service.ContactService;

@Controller
public class SportGuiController {

	@Autowired
	private ContactService contactService;
	@Autowired
	private SportService sportService;
	
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
	
	@RequestMapping(value="/adminnews", method=RequestMethod.GET)
	public ModelAndView adminNews(){
		return new ModelAndView("adminnews","","");
	}
	@RequestMapping(value="/adminusers", method=RequestMethod.GET)
	public ModelAndView adminUsers(){
		return new ModelAndView("adminusers","","");
	}
	@RequestMapping(value="/adminimages", method=RequestMethod.GET)
	public ModelAndView adminimages(){
		return new ModelAndView("adminimages","","");
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
	public ModelAndView index(HttpServletResponse response,@CookieValue(value = "teamfollowing", defaultValue="noteam") String cookie){ 
		
/*		
	      String headerValue = CacheControl.maxAge(10, TimeUnit.SECONDS)
                  .getHeaderValue();

response.addHeader("Cache-Control", headerValue);*/
		
	/*	 User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username = user.getUsername();*/
			User user =null; 
		 try{user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();}
		 catch(Exception e){}
		 ModelAndView model = new ModelAndView("theme1/index");
		 if(user!=null)
		 {
			 String username = user.getUsername();
			 Contact contact = contactService.findByUserName(username);
			 model.getModelMap().addAttribute("username", username);
			 model.getModelMap().addAttribute("name", contact.getName());
			 if(contact.getAdminteam()!=null)
				 model.getModelMap().addAttribute("teamid", contact.getAdminteam().getId());
		 }
		 else
		 {
			 try {	
				 if(!cookie.equals("noteam"))
					 model.getModelMap().addAttribute("teamid", sportService.getFollowingTeams(cookie).get(0).getId());

			 	}
			 catch(Exception e){
			
			 }	 
			 model.getModelMap().addAttribute("username","");
		 }
			 
		return model;// new ModelAndView("theme1/index","username",username);
	}
	
	@RequestMapping(value="/home1", method=RequestMethod.GET)
	public ModelAndView home(){
		return new ModelAndView("theme1/home","","");
	}
	
	@RequestMapping(value="/header1", method=RequestMethod.GET)
	public ModelAndView header1(){
		

		 ModelAndView model = new ModelAndView("theme1/header");
		
			
		return model;//new ModelAndView("theme1/header","username","dd");
	}
	
	@RequestMapping(value="/footer1", method=RequestMethod.GET)
	public ModelAndView footer1(){
		return new ModelAndView("theme1/footer","","");
	}	
	
	@RequestMapping(value="/point-table", method=RequestMethod.GET)
	public ModelAndView pointtable(HttpServletResponse response){
		
/*	      String headerValue = CacheControl.maxAge(10, TimeUnit.SECONDS)
                  .getHeaderValue();

response.addHeader("Cache-Control", headerValue);*/
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

	@RequestMapping(value="/message-list", method=RequestMethod.GET)
	public ModelAndView messagelist(){
		return new ModelAndView("theme1/message-list","","");
	}	
	
	
	@RequestMapping(value="/news-list", method=RequestMethod.GET)
	public ModelAndView newslist(){
		return new ModelAndView("theme1/news-list","","");
	}
	
	@RequestMapping(value="/news-detail", method=RequestMethod.GET)
	public ModelAndView newsdetail(){
		return new ModelAndView("theme1/news-detail","","");
	}
	

	@RequestMapping(value="/match", method=RequestMethod.GET)
	public ModelAndView match(){
		return new ModelAndView("theme1/match","","");
	}
	@RequestMapping(value="/editteam", method=RequestMethod.GET)
	public ModelAndView editTeam(){
		 User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 String username = user.getUsername();
		 Contact contact = contactService.findByUserName(username);
		return new ModelAndView("theme1/editteam","teamid",contact.getAdminteam().getId());
	}
/*	@RequestMapping(value="/point-table2", method=RequestMethod.GET)
	public ModelAndView pointtable2(){
		return new ModelAndView("theme1/point-table2","","");
	}*/
	

	@RequestMapping(value="/gallery", method=RequestMethod.GET)
	public ModelAndView gallery(){
		return new ModelAndView("theme1/gallery","","");
	}
	
	@RequestMapping(value="/contactus", method=RequestMethod.GET)
	public ModelAndView contactus(){
		return new ModelAndView("theme1/contactus","","");
	}
	
	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public ModelAndView calendar(){
		return new ModelAndView("theme1/calendar","","");
	}
	
	@RequestMapping(value="/chat", method=RequestMethod.GET)
	public ModelAndView chat(){
		return new ModelAndView("theme1/chat","","");
	}
}
