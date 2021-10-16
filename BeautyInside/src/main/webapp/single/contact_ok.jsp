<%@page import="com.beauty.email.MailDTO"%>
<%@page import="com.beauty.email.MailSend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	 
	String name = request.getParameter("name");
	String fromEmail = request.getParameter("email");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	content = content.replace("\n", "<br>");
	String message = "";
	message += "보내는 이 : " + name;
	message += "<br>";
	message += "메일 주소 : " + fromEmail;
	message += "<br><br>";
	message += content;

	MailDTO mailDto = new MailDTO();
	mailDto.setName(name);
	mailDto.setFromEmail(fromEmail);
	mailDto.setSubject(subject);
	mailDto.setContent(message);
	
	MailSend.send(mailDto);
%>
<script>
	alert('메일이 전송되었습니다.');
	location.href = '<%=request.getContextPath() %>/main.jsp';
</script>