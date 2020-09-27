package com.connecthink.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Mail {	
	private final String user = "connecthinkteam@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
    private final String password = "connecthink1234";   // 패스워드
    private HttpSession httpSession;
    private Session session;
    
    public Mail() {
        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.gmail.com"); 
          props.put("mail.smtp.port", "25"); 
          props.put("mail.debug", "true"); 
          props.put("mail.smtp.auth", "true"); 
          props.put("mail.smtp.starttls.enable","true"); 
          props.put("mail.smtp.EnableSSL.enable","true");
          props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
          props.setProperty("mail.smtp.socketFactory.fallback", "false");   
          props.setProperty("mail.smtp.port", "465");   
          props.setProperty("mail.smtp.socketFactory.port", "465"); 
          this.session = Session.getInstance(props, new javax.mail.Authenticator() {
              protected PasswordAuthentication getPasswordAuthentication() {
                  return new PasswordAuthentication(user, password);
              }
          });
	}

	public void sendVerification(String userMail) {
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userMail));
			message.setSubject("[이메일인증 - connecThink]");
			
			String verifyCode = String.format("%06d", (int) (Math.random()*1000000));
			
			String txt = "";
			txt += "<br>아래 코드를 입력하여 이메일 인증을 진행해주세요";
			txt += "<br><strong>" + verifyCode + "</strong>";
			message.setContent(txt, "text/html; charset=utf-8");
			// Send message
			Transport.send(message);
			System.out.println("message sent successfully....");

			httpSession.setAttribute("verifyCode", verifyCode);
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
}

	