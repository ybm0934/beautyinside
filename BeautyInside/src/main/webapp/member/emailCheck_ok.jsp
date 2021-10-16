<%@page import="com.beauty.email.MailSend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String toEmail = request.getParameter("email");
	String key = request.getParameter("key");
	
	MailSend mailSend = new MailSend();
	boolean flag = mailSend.emailGetKey(toEmail, key);
	
	if(flag == true) {
%>
	<span style="color:green !important;">
		이메일이 인증 되었습니다.
	</span>
	<script>
		$('#emailTimer').hide();
	</script>
<%		
	}else {
%>
	<span>
		인증번호가 일치하지 않습니다.
	</span>
<%} %>
	<input type="hidden" name="emailCheck" id="emailCheck" value="<%=flag %>">