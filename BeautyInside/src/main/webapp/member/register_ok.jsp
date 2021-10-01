<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("password_ok");
	String name = request.getParameter("name");
	String birth = request.getParameter("birthday");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	int zipcode = Integer.parseInt(request.getParameter("zipcode"));
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	
	
	
%>