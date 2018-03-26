package com.phonebook.service;

 
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailParseException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
 
/**
 * @author Crunchify.com
 * 
 */
 
@Service("mailService")
public class MailServiceImpl implements MailService{
 
	@Autowired
	private JavaMailSender mailSender; // MailSender interface defines a strategy
										// for sending simple mails
  //  private SimpleMailMessage simpleMailMessage;
	@Override
	public void sendMailExt(String toAddress, String fromAddress, String subject, String msgBody, String filePath) {

	       MimeMessage message = mailSender.createMimeMessage();
	       try{
		       message.setContent(message, "text/plain; charset=UTF-8");
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);

	        helper.setFrom(fromAddress);
	        helper.setTo(toAddress);
	        helper.setSubject(subject);
	        helper.setText( msgBody);
	        FileSystemResource file = new FileSystemResource(filePath);
	        helper.addAttachment(file.getFilename(), file);

	        System.out.println("MAIL SENT ");
	         }catch (MessagingException e) {System.out.println("SENDMAILERROR: "+e.getMessage());
	        throw new MailParseException(e);
	         }
	         mailSender.send(message);
	         }
	
	@Override
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody) {
		try {
		SimpleMailMessage crunchifyMsg = new SimpleMailMessage();
		crunchifyMsg.setFrom(fromAddress);
		crunchifyMsg.setTo(toAddress);
		crunchifyMsg.setSubject(subject);
		crunchifyMsg.setText(msgBody);
		mailSender.send(crunchifyMsg);
        System.out.println("MAIL SENT ");
		}
		catch(Exception e) {System.out.println("SENDMAILERROR: "+e.getMessage());}
	}
}