<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("loginCheck.jsp 실행");

	String cid = (String) session.getAttribute("userid");
	System.out.println("cid : " + cid);
	
	// 로그인이 되어 있지 않으면 접근 금지
	if(cid == null) {
%>
		<script>
			alert('로그인이 필요한 서비스입니다.');
			location.href = '/member/login.jsp';
		</script>
<%	} %>