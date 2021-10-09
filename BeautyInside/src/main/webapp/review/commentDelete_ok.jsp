<%@page import="com.beauty.review.CommentDTO"%>
<%@page import="com.beauty.review.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/member/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	int no = Integer.parseInt(request.getParameter("no"));
	int sortNo = Integer.parseInt(request.getParameter("sortNo"));
	
	CommentDAO comDao = new CommentDAO();
	boolean flag = comDao.identify(no, cid);
	
	if(cid != null) {
		if(flag == true) {
			int cnt = comDao.commentDelete(no, sortNo);
		}
	}// if
%>