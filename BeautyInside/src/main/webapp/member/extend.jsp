<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 시간 연장하기
	
	String id = (String) session.getAttribute("userid"); // 기존 세션값 파라미터
	
	session.setAttribute("userid", id); // 로그인 아이디
	session.setAttribute("logtime", System.currentTimeMillis()); // 로그인 시간 기록
	session.setMaxInactiveInterval(60 * 10 + 2); // 세션 만료 시간 10분 + 새로고침 딜레이 2초
%>