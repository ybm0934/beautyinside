<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("loginCheckNot.jsp 실행");

	String cid = (String) session.getAttribute("userid");
	System.out.println("cid : " + cid);
	
	// 로그인이 되어 있으면 접근 금지
	if(cid != null) {
		response.sendRedirect("/main.jsp");
	}
%>