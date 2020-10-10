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
			message.setSubject("[connecThink Korea] 이메일 인증번호가 도착 하였습니다.");
			
			String verifyCode = String.format("%06d", (int) (Math.random()*1000000));
			
			message.setContent("<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"table-layout:fixed;background-color:#f9f9f9\" id=\"bodyTable\">\n" + 
					"	<tbody>\n" + 
					"		<tr>\n" + 
					"			<td style=\"padding-right:10px;padding-left:10px;\" align=\"center\" valign=\"top\" id=\"bodyCell\">\n" + 
					"				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapperWebview\" style=\"max-width:600px\">\n" + 
					"					<tbody>\n" + 
					"						<tr>\n" + 
					"							<td align=\"center\" valign=\"top\">\n" + 
					"								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" + 
					"									<tbody>\n" + 
					"										<tr>\n" + 
					"											<td style=\"padding-top: 20px; padding-bottom: 20px; padding-right: 0px;\" align=\"right\" valign=\"middle\" class=\"webview\"> \n" + 
					"											</td>\n" + 
					"										</tr>\n" + 
					"									</tbody>\n" + 
					"								</table>\n" + 
					"							</td>\n" + 
					"						</tr>\n" + 
					"					</tbody>\n" + 
					"				</table>\n" + 
					"				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapperBody\" style=\"max-width:600px\">\n" + 
					"					<tbody>\n" + 
					"						<tr>\n" + 
					"							<td align=\"center\" valign=\"top\">\n" + 
					"								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"tableCard\" style=\"background-color:#fff;border-color:#e5e5e5;border-style:solid;border-width:0 1px 1px 1px;\">\n" + 
					"									<tbody>\n" + 
					"										<tr>\n" + 
					"											<td style=\"background-color:#00d2f4;font-size:1px;line-height:3px\" class=\"topBorder\" height=\"3\">&nbsp;</td>\n" + 
					"										</tr>\n" + 
					"										\n" + 
					"										<tr>\n" + 
					"											<td style=\"padding-bottom: 20px;\" align=\"center\" valign=\"top\" class=\"imgHero\">\n" + 
					"												<a href=\"#\" style=\"text-decoration:none\" target=\"_blank\">\n" + 
					"													<img alt=\"\" border=\"0\" src=\"http://email.aumfusion.com/vespro/img/hero-img/blue/heroGradient/user-account.png\" style=\"width:100%;max-width:600px;height:auto;display:block;color: #f9f9f9;\" width=\"600\">\n" + 
					"												</a>\n" + 
					"											</td>\n" + 
					"										</tr>\n" + 
					"										<tr>\n" + 
					"											<td style=\"padding-bottom: 5px; padding-left: 20px; padding-right: 20px;\" align=\"center\" valign=\"top\" class=\"mainTitle\">\n" + 
					"												<h2 class=\"text\" style=\"color:#000;font-family:Poppins,Helvetica,Arial,sans-serif;font-size:28px;font-weight:500;font-style:normal;letter-spacing:normal;line-height:36px;text-transform:none;text-align:center;padding:0;margin:0\">안녕하세요 connecThink 입니다.</h2>\n" + 
					"											</td>\n" + 
					"										</tr>\n" + 
					"										<tr>\n" + 
					"											<td style=\"padding-bottom: 30px; padding-left: 20px; padding-right: 20px;\" align=\"center\" valign=\"top\" class=\"subTitle\">\n" + 
					"												<h4 class=\"text\" style=\"color:#999;font-family:Poppins,Helvetica,Arial,sans-serif;font-size:16px;font-weight:500;font-style:normal;letter-spacing:normal;line-height:24px;text-transform:none;text-align:center;padding:0;margin:0\">아래의 인증번호를 복사하여 이메일 인증을 완료해 주세요.</h4>\n" + 
					"											</td>\n" + 
					"										</tr>\n" + 
					"										<tr>\n" + 
					"											<td style=\"padding-left:20px;padding-right:20px\" align=\"center\" valign=\"top\" class=\"containtTable ui-sortable\">\n" + 
					"												<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"tableDescription\" style=\"\">\n" + 
					"													<tbody>\n" + 
					"														<tr>\n" + 
					"															<td style=\"padding-bottom: 20px;\" align=\"center\" valign=\"top\" class=\"description\">\n" + 
					"																<p class=\"text\" style=\"color:#9aa6ff;font-family:Poppins,Helvetica,Arial,sans-serif;font-size:28px;font-weight:500;font-style:normal;letter-spacing:normal;line-height:36px;text-transform:none;text-align:center;padding:0;margin:0;\">\n" + 
					"                                  <strong>\n" + 
					"                                    "+verifyCode+"\n" + 
					"                                  </strong>	  \n" + 
					"																</p>\n" + 
					"															</td>\n" + 
					"														</tr>\n" + 
					"													</tbody>\n" + 
					"												</table>\n" + 
					"												<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"tableButton\" style=\"\">\n" + 
					"													<tbody>\n" + 
					"														<tr>\n" + 
					"															<td style=\"padding-top:20px;padding-bottom:20px\" align=\"center\" valign=\"top\">\n" + 
					"																\n" + 
					"															</td>\n" + 
					"														</tr>\n" + 
					"													</tbody>\n" + 
					"												</table>\n" + 
					"											</td>\n" + 
					"										</tr>\n" + 
					"										<tr>\n" + 
					"											<td style=\"font-size:1px;line-height:1px\" height=\"20\">&nbsp;</td>\n" + 
					"										</tr>\n" + 
					"										<tr>\n" + 
					"											<td align=\"center\" valign=\"middle\" style=\"padding-bottom: 40px;\" class=\"emailRegards\">\n" + 
					"												<!-- Image and Link // -->\n" + 
					"												<a href=\"#\" target=\"_blank\" style=\"text-decoration:none;\">\n" + 
					"													<img mc:edit=\"signature\" src=\"https://i.ibb.co/M627RRg/2020-10-06-3-03-42.png\" alt=\"\" width=\"500\" border=\"0\" style=\"width:100%;\n" + 
					"    max-width:150px; height:auto; display:block;\">\n" + 
					"												</a>\n" + 
					"											</td>\n" + 
					"										</tr>\n" + 
					"									</tbody>\n" + 
					"								</table>\n" + 
					"								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"space\">\n" + 
					"									<tbody>\n" + 
					"										<tr>\n" + 
					"											<td style=\"font-size:1px;line-height:1px\" height=\"30\">&nbsp;</td>\n" + 
					"										</tr>\n" + 
					"									</tbody>\n" + 
					"								</table>\n" + 
					"							</td>\n" + 
					"						</tr>\n" + 
					"					</tbody>\n" + 
					"				</table>\n" + 
					"				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapperFooter\" style=\"max-width:600px\">\n" + 
					"					<tbody>\n" + 
					"						<tr>\n" + 
					"							<td align=\"center\" valign=\"top\">\n" + 
					"								<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"footer\">\n" + 
					"									<tbody>\n" + 
					"										\n" + 
					"										<tr>\n" + 
					"											<td style=\"padding: 10px 10px 5px;\" align=\"center\" valign=\"top\" class=\"brandInfo\">\n" + 
					"												<p class=\"text\" style=\"color:#bbb;font-family:'Open Sans',Helvetica,Arial,sans-serif;font-size:12px;font-weight:400;font-style:normal;letter-spacing:normal;line-height:20px;text-transform:none;text-align:center;padding:0;margin:0\">©&nbsp;Vespro Inc. | 800 Broadway, Suite 1500 | New York, NY 000123, USA.</p>\n" + 
					"											</td>\n" + 
					"										</tr>\n" + 
					"										<tr>\n" + 
					"											\n" + 
					"										</tr>\n" + 
					"										<tr>\n" + 
					"											<td style=\"padding: 0px 10px 10px;\" align=\"center\" valign=\"top\" class=\"footerEmailInfo\">\n" + 
					"												<p class=\"text\" style=\"color:#bbb;font-family:'Open Sans',Helvetica,Arial,sans-serif;font-size:12px;font-weight:400;font-style:normal;letter-spacing:normal;line-height:20px;text-transform:none;text-align:center;padding:0;margin:0\">If you have any quetions please contact us <a href=\"#\" style=\"color:#bbb;text-decoration:underline\" target=\"_blank\">connecthinkteam@gmail.com.</a>\n" + 
					"													</p>\n" + 
					"											</td>\n" + 
					"										</tr>\n" + 
					"										\n" + 
					"										<tr>\n" + 
					"											<td style=\"font-size:1px;line-height:1px\" height=\"30\">&nbsp;</td>\n" + 
					"										</tr>\n" + 
					"									</tbody>\n" + 
					"								</table>\n" + 
					"							</td>\n" + 
					"						</tr>\n" + 
					"						<tr>\n" + 
					"							<td style=\"font-size:1px;line-height:1px\" height=\"30\">&nbsp;</td>\n" + 
					"						</tr>\n" + 
					"					</tbody>\n" + 
					"				</table>\n" + 
					"			</td>\n" + 
					"		</tr>\n" + 
					"	</tbody>\n" + 
					"</table>","text/html; charset=utf-8");
			// Send message
			Transport.send(message);
			System.out.println("message sent successfully....");

			httpSession.setAttribute("verifyCode", verifyCode);
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
}

	