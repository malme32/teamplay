package com.phonebook.service;

public interface MailService {
	public void sendMailExt(String toAddress, String fromAddress, String subject, String msgBody, String filePath);
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody);
}
