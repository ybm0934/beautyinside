<%@page import="com.beauty.email.MailSend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	 
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	content = content.replace("\r\n", "<br>");

	MailSend.send(name, email, subject, content);
%>
<script>
	location.href = '<%=request.getContextPath() %>/main.jsp';
</script>