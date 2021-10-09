<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();

	// 마지막 접속했던 페이지로 이동
	String back = request.getHeader("Referer");
	response.sendRedirect(back);
%>