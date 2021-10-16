package com.beauty.email;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.beauty.connection.ConnectionPoolMgr;

public class MailSend {

	ConnectionPoolMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public MailSend() {
		pool = new ConnectionPoolMgr();
	}

	// gmail은 보안을 해제해야만 작동함에 주의
	private static String adminEmail = "beautyinside404@gmail.com"; // 관리자 이메일
	private static String adminID = "beautyinside404"; // 관리자 이메일 아이디
	private static String adminPWD = "@01092602518"; // 관리자 이메일 패스워드

	// SMTP(Simple Mail Transfer Protocol) : Email을 전송할 때 사용하는 메일 서버의 기본 프로토콜
	private static class SMTPAuthenticator extends Authenticator {
		@Override
		public PasswordAuthentication getPasswordAuthentication() {
			// 관리자 구글 아이디, 암호 셋팅
			return new PasswordAuthentication(adminID, adminPWD);
		}
	}

	// 보내기
	public static void send(MailDTO mailDto) {
		System.out.println("MailSend 실행");
		System.out.println("파라미터 mailDto = " + mailDto);

		Properties p = new Properties();
		p.put("mail.smtp.user", adminEmail); // 보내는 이 (관리자 gmail)
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

			// 제목
			msg.setSubject(mailDto.getSubject());

			// 보내는 이
			Address fromAddr = new InternetAddress(adminEmail);
			msg.setFrom(fromAddr);

			// 받는 이
			Address toAddr = new InternetAddress(adminEmail);
			msg.addRecipient(Message.RecipientType.TO, toAddr);

			// 내용
			msg.setContent(mailDto.getContent(), "text/html;charset=UTF-8");

			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// send

	// 이메일 인증
	public static String emailCertify(String toEmail) {
		System.out.println("emailCertify 실행");
		System.out.println("파라미터 toEmail : " + toEmail);

		String subject = ":: Beauty Inside Pure :: 이메일 인증입니다.";
		String certify = "";
		// 15자리 문자열 생성
		for (int i = 0; i < 15; i++) {
			char c = (char) ((Math.random() * 26) + 65);
			certify += c;
		}
		String content = "아래 인증번호를 입력해주세요.";
		content += "<br><br>";
		content += "인증번호 : ";
		content += certify;

		MailDTO mailDto = new MailDTO();
		mailDto.setSubject(subject);
		mailDto.setToEmail(toEmail);
		mailDto.setContent(content);

		send(mailDto);

		return certify;
	}// emailCertify

	// 인증키 DB에 저장
	public void emailSetKey(String toEmail, String key) throws SQLException {
		try {
			System.out.println("emailSetKey 실행");

			con = pool.getConnection();

			String sql = "insert into emailKey values(emailKey_seq.nextval, ?, ?, default)";
			ps = con.prepareStatement(sql);
			ps.setString(1, toEmail);
			ps.setString(2, key);
			int cnt = ps.executeUpdate();

			System.out.println("인증키 입력 결과 cnt : " + cnt);
			System.out.println("파라미터 toEmail : " + toEmail + ", key : " + key);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}
	}// emailSetKey

	// 인증키 일치 확인
	public boolean emailGetKey(String toEmail, String key) throws SQLException {
		boolean flag = false;
		try {
			System.out.println("emailGetKey 실행");

			con = pool.getConnection();

			String sql = "select key from emailKey where email = ? and sysdate <= regdate + (interval '3' minute) order by no desc";
			ps = con.prepareStatement(sql);
			ps.setString(1, toEmail);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (key.equals(rs.getString(1))) {
					flag = true;
				}
			}

			System.out.println("인증키 입력 결과 flag : " + flag);
			System.out.println("파라미터 toEmail : " + toEmail + ", key : " + key);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}
		
		return flag;
	}// emailGetKey

}
