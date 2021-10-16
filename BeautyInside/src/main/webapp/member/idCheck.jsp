<%@page import="com.beauty.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");

	MemberDAO memberDao = new MemberDAO();

	boolean flag = memberDao.idCheck(id);
%>
	<% if(flag == false) { %>
		<span style="color:green !important;">
			사용 가능한 아이디입니다.
		</span>
	<% }else if(flag == true) { %>
		<span>
			'<%=id %>' 이미 사용 중인 아이디입니다.
		</span>
	<% } %>
<input type="hidden" id="idCheck" value="<%=flag %>">