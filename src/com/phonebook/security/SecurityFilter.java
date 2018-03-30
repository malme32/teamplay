package com.phonebook.security;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.hibernate.annotations.Filter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.filter.GenericFilterBean;

import com.event.controller.SportController;
import com.event.service.GeneralDaoService;
import com.event.service.SportService;
import com.phonebook.model.Contact;
import com.phonebook.model.Userrole;
import com.phonebook.service.ContactService;
import com.sport.model.MySession;

@Transactional
/*@Filter(name = "customFilter")*/
public class SecurityFilter extends GenericFilterBean {
	
	private ContactService contactService;
	private PasswordEncoder passwordEncoder;	
	
	private GeneralDaoService generalDaoService;
	private AuthenticationManager authenticationManager;
	
	public static final String CHARACTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

	// 2048 bit keys should be secure until 2030 - https://web.archive.org/web/20170417095741/https://www.emc.com/emc-plus/rsa-labs/historical/twirl-and-rsa-key-size.htm
	public static final int SECURE_TOKEN_LENGTH = 128;

	private static final SecureRandom random = new SecureRandom();

	private static final char[] symbols = CHARACTERS.toCharArray();

	private static final char[] buf = new char[SECURE_TOKEN_LENGTH];

	/**
	 * Generate the next secure random token in the series.
	 */
	public static String nextToken() {
	    for (int idx = 0; idx < buf.length; ++idx)
	        buf[idx] = symbols[random.nextInt(symbols.length)];
	    return new String(buf);
	}
	
	

    @Override
    public void doFilter(
      ServletRequest req, 
      ServletResponse res,
      FilterChain chain) throws IOException, ServletException {
    	
        System.out.println("FILTERED!!!");
        HttpServletRequest request = (HttpServletRequest) req;
        System.out.println(request.getRequestURL());
        System.out.println(request.getMethod());
        System.out.println(request.getPathInfo());
        ;
        String path = request.getServletPath();
    	String referer = request.getHeader("Referer");
    	String method = request.getMethod();
        HttpServletResponse response = (HttpServletResponse) res;
        System.out.println("Request URI: "+request.getRequestURI()); 
        System.out.println("Servlet Path: "+request.getServletPath()); 
        
        ServletContext servletContext = request.getServletContext();
        WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);

        contactService = webApplicationContext.getBean(ContactService.class);
        passwordEncoder = webApplicationContext.getBean(PasswordEncoder.class);

        generalDaoService = webApplicationContext.getBean(GeneralDaoService.class);
   
        SportController.request=request;
        // logging out
        if(path.equals("/loggingout"))
        {
            System.out.println("Logging out..");
            contactService.deleteSession();
		    Cookie tokenCookie = new Cookie("token","");
		    tokenCookie.setPath("/");/*
		    tokenCookie.setSecure(true);
		    tokenCookie.setHttpOnly(true);*/
		    tokenCookie.setMaxAge(0);
            response.addCookie(tokenCookie);
            System.out.println("REFERER: " +referer);
        	response.sendRedirect(referer);
        
        	return;
        }
        // admin page
        else if(path.indexOf("/admin")>=0)
        {
        	Contact contact = contactService.getLoggedIn();
        	if(contact==null)
        	{
                response.sendRedirect(request.getContextPath() +"/loginPage?admin");
                return;
        	}
        	boolean hasRole = contactService.hasRole(contact, "ROLE_ADMIN");
  
        	if(hasRole)
        	{
        		System.out.println("Authorized!!");
                chain.doFilter(req, res);
                return;
        	}
        	else
        	{
                response.sendRedirect(request.getContextPath() +"/loginPage?admin");
                return;
        	}
        }
        
        else if(path.indexOf("/loginPage")>=0&&method.equals("POST"))
        {
        	String username = request.getParameter("username");
        	String password = request.getParameter("password");
        	System.out.println("Username: "+request.getParameter("username"));
        //	System.out.println("Password: "+request.getParameter("password"));
        	
    /*
            authenticationManager = webApplicationContext.getBean(AuthenticationManager.class);*/
             

            
            
        	Contact contact = contactService.findByUserName(username);
        	
        	if(contact!=null) 
        	{
        		String hashPassword = contact.getPassword();
            //	System.out.println("hashPassword: "+hashPassword);
            //	System.out.println("hashedRequestedPass: "+passwordEncoder.encode(password));
            	if(passwordEncoder.matches(password, hashPassword))
            	{
                    contactService.deleteSession();
        		//if(hashPassword.equals(passwordEncoder.encode(password))){
        			MySession mySession  = new MySession();
        			String token = nextToken();
        			mySession.setContact(contact);
        			mySession.setToken(token);
        			mySession.setDate(new Date());
        			generalDaoService.persist(mySession);
        			
        			Cookie tokenCookie = new Cookie("token",token);
        			tokenCookie.setPath("/");/*
        			   tokenCookie.setSecure(true);
        			tokenCookie.setHttpOnly(true);*/
        			tokenCookie.setMaxAge(1000000000);
        	        response.addCookie(tokenCookie);
        			
        			 /*UsernamePasswordAuthenticationToken authReq
        		      = new UsernamePasswordAuthenticationToken(username, password);
        		    Authentication auth = authenticationManager.authenticate(authReq);
        		     
        		    SecurityContext sc = SecurityContextHolder.getContext();
        		    sc.setAuthentication(auth);
        		   
        		    HttpSession session = req.getSession(true);
        		    session.setAttribute(SPRING_SECURITY_CONTEXT_KEY, sc);*/
        			
        	            if(referer.indexOf("?admin")>=0)
                            response.sendRedirect(request.getContextPath() +"/admin");
        	            else
                            response.sendRedirect(request.getContextPath() +"/soccer");
        	      /*  	String referer = request.getHeader("Referer");
        	            System.out.println("REFERER: " +referer);
        	        	response.sendRedirect(referer);*/
                    //response.sendRedirect(request.getContextPath() +"/soccer");
                    return;
        		}
            	else
            	{

    	            if(referer.indexOf("?admin")>=0)
                        response.sendRedirect(request.getContextPath() +"/loginPage?admin");
    	            else
                        response.sendRedirect(request.getContextPath() +"/loginPage");
                    return;
            	}
            	//System.out.println("OUT7");
        	}
        	else 
        	{
        		System.out.println("Contact null");
	            if(referer.indexOf("?admin")>=0)
                    response.sendRedirect(request.getContextPath() +"/loginPage?admin");
	            else
                    response.sendRedirect(request.getContextPath() +"/loginPage");
                return;
        	}
            	

        }
        else
            chain.doFilter(req, res);
   /*     if(request.getRequestURL().indexOf("admin")>=0)
        {
        	
            response.sendRedirect(request.getContextPath() +"/loginPage");
        }
        else*/
        /*System.out.println("Role admin: "+request.isUserInRole("ROLE_ADMIN"));
        System.out.println("Role team: "+request.isUserInRole("ROLE_TEAM"));
     
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        System.out.println("Authorities:" +authentication.getAuthorities());*/
     // Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
  /*     for(String role:roles) {

           System.out.println("Role:"+ role);
       }*/
     /*   if (roles.contains("ROLE_USER")) {
            request.getSession().setAttribute("myVale", "myvalue");
        }
*/
       // System.out.println("FILTERED!!!");
    }
}