<%@page import="com.beauty.chat.ChatDTO"%>
<%@page import="com.beauty.chat.ChatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String admin = request.getParameter("admin");
	String select = (admin == null) ? name : admin;
	
	
	
	
	
	
	
	
	
	System.out.println("@@@@@@@@@@@@@@@name : " + name);
	System.out.println("@@@@@@@@@@@@@@@admin : " + admin);
	System.out.println("@@@@@@@@@@@@@@@select : " + select);
	String content = request.getParameter("content");
	if(content == null) content = "";
	
	ChatDTO chatDto = new ChatDTO();
	chatDto.setId(id);
	chatDto.setName(select);
	chatDto.setContent(content);
	
	ChatDAO chatDao = new ChatDAO();
	chatDao.chatWrite(chatDto);
%>