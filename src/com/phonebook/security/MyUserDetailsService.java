package com.phonebook.security;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.phonebook.model.Contact;
import com.phonebook.model.Userrole;
import com.phonebook.service.ContactService;



@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService  {
	
	
	//static ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
	//private ContactService contactService = (ContactService)ctx.getBean("contactService");
	@Autowired
	private ContactService contactService ;
	  //private BeanFactory beanFactory;
	//get user from the database, via Hibernate
	//@Autowired
	//private ContactService contactService;//(ContactService)beanFactory.getBean("contactService");;

//	public ContactService getContactService() {
//		return contactService;
//	}
//	//@Autowired
//	public void setContactService(ContactService contactService) {
//		this.contactService = contactService;
//	}

	@Transactional(readOnly=true)
	@Override
	public UserDetails loadUserByUsername(final String username)
		throws UsernameNotFoundException {
				
		Contact contact = contactService.findByUserName(username);
		//Contact contact = new Contact();
		List<GrantedAuthority> authorities =
                                      buildUserAuthority(contact.getUserrole());

		return buildUserForAuthentication(contact, authorities);

	}

	// Converts com.mkyong.users.model.User user to
	// org.springframework.security.core.userdetails.User
	private User buildUserForAuthentication(Contact contact,
		List<GrantedAuthority> authorities) {
		return new User(contact.getUsername(), contact.getPassword(),
			contact.isEnabled(), true, true, true, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(Userrole userRoles) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
		setAuths.add(new SimpleGrantedAuthority(userRoles.getRole()));
		// Build user's authorities
//		for (Userrole userRole : userRoles) {
//			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
//		}

		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

		return Result;
	}



}