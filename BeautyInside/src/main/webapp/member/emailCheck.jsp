<%@page import="com.beauty.email.MailSend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String toEmail = request.getParameter("email");
	
	MailSend mailSend = new MailSend();
	mailSend.emailSetKey(toEmail, MailSend.emailCertify(toEmail));
%>
<span>
	이메일을 발송하였습니다.
</span>
