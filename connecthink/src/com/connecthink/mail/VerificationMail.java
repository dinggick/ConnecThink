package com.connecthink.mail;

import javax.servlet.http.HttpSession;

public class VerificationMail implements Runnable{
	private Mail mail;
	private String userMail;
	
	public VerificationMail(String userMail, HttpSession session) {
		this.userMail = userMail;
		this.mail = new Mail();
		this.mail.setHttpSession(session);
	}
	
	@Override
	public void run() {
		mail.sendVerification(userMail);
		System.out.println("mail sended");
	}
		
} 

