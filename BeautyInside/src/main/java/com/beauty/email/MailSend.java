package com.beauty.email;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {

	// SMTP(Simple Mail Transfer Protocol) : Email을 전송할 때 사용하는 메일 서버의 기본 프로토콜
	private static class SMTPAuthenticator extends Authenticator {
		@Override
		public PasswordAuthentication getPasswordAuthentication() {
			// 관리자 구글 아이디, 암호 셋팅
			return new PasswordAuthentication("beautyinside404", "@01092602518");
		}
	}

	public static void send(String name, String fromEmail, String subject, String content) {

		String toEmail = "beautyinside404@gmail.com"; // 받는이
		// gmail은 보안을 해제해야만 작동함에 주의
		
		Properties p = new Properties();
		p.put("mail.smtp.user", fromEmail); // 관리자 gmail
		p.put("mail.smtp.host", "smtp.gmail.com"); // 구글 SMTP
		p.put("mail.smtp.port", "465"); // 구글 포트번호
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");

		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			session.setDebug(true);

			// 메일 내용을 담을 객체
			MimeMessage msg = new MimeMessage(session);
			String message = "";
			message += "보내는 이 : " + name;
			message += "<br>";
			message += "메일 주소 : " + fromEmail;
			message += "<br><br>";
			message += content;
			msg.setSubject(subject);

			// 보내는 이
			Address fromAddr = new InternetAddress(fromEmail);
			msg.setFrom(fromAddr);

			// 받는 이
			Address toAddr = new InternetAddress(toEmail);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(message, "text/html;charset=UTF-8");

			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
