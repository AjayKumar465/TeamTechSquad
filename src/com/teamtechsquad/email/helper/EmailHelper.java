package com.teamtechsquad.email.helper;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailHelper {

	/**
	 * Utility method to send simple HTML email
	 * 
	 * @param session
	 * @param toEmail
	 * @param subject
	 * @param body
	 * @throws Exception 
	 */
	public static void sendEmail(String toEmail, String subject, String body) throws Exception {
		try {

			final String fromEmail = "nutrients.on.a.click@gmail.com"; // requires valid
															// gmail id
			final String password = "Pa$$word1"; // correct password for gmail

			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
			props.put("mail.smtp.port", "465"); // TLS Port
			props.put("mail.smtp.auth", "true"); // enable authentication
					props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			// create Authenticator object to pass in Session.getInstance
			// argument
			Authenticator auth = new Authenticator() {
				// override the getPasswordAuthentication method
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
			};
			Session session = Session.getInstance(props, auth);
			MimeMessage msg = new MimeMessage(session);
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			msg.setContent(body, "text/html; charset=utf-8");
			msg.addHeader("format", "flowed");
			msg.addHeader("Content-Transfer-Encoding", "8bit");
			msg.setFrom(new InternetAddress(fromEmail));
			msg.setSubject(subject, "UTF-8");
			msg.setSentDate(new Date());
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
			System.out.println("Message is ready");
			Transport.send(msg);
			System.out.println("EMail Sent Successfully!!");
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}
}