<%@page import="com.beauty.review.CommentDAO"%>
<%@page import="com.beauty.review.CommentDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/member/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	if(cid != null) {
		int ogNo = Integer.parseInt(request.getParameter("ogNo"));
		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		
		CommentDTO comDto = new CommentDTO();
		comDto.setOgNo(ogNo);
		comDto.setId(userid);
		comDto.setName(name);
		comDto.setContent(content);
		
		CommentDAO comDao = new CommentDAO();
		int cnt = comDao.commentWrite(comDto);
	}
%>