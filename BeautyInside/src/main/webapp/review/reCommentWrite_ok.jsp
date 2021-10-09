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
		int groupNo = Integer.parseInt(request.getParameter("groupNo"));
		int ogNo = Integer.parseInt(request.getParameter("ogNo"));
		int sortNo = Integer.parseInt(request.getParameter("sortNo"));
		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
		String target = request.getParameter("target");
		String content = request.getParameter("content");
		
		CommentDTO comDto = new CommentDTO();
		comDto.setGroupNo(groupNo);
		comDto.setOgNo(ogNo);
		comDto.setSortNo(sortNo);
		comDto.setId(userid);
		comDto.setName(name);
		comDto.setTarget(target);
		comDto.setContent(content);
		
		CommentDAO comDao = new CommentDAO();
		int cnt = comDao.reCommentWrite(comDto);
		
		ArrayList<CommentDTO> list = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		
		if(cnt > 0) {
			list = comDao.commentList(ogNo);
		}
	} // if
%>