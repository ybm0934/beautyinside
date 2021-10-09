<%@page import="com.beauty.review.CommentDTO"%>
<%@page import="com.beauty.review.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/member/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	int no = Integer.parseInt(request.getParameter("no"));
	String content = request.getParameter("content");
	
	CommentDAO comDao = new CommentDAO();
	boolean flag = comDao.identify(no, cid);
	
	if(cid != null) {
		if(flag == true) {
			CommentDTO comDto = new CommentDTO();
			comDto.setNo(no);
			comDto.setContent(content);
			
			int cnt = comDao.commentEdit(comDto);
		}
	}// if
%>