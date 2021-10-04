<%@page import="com.beauty.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String saveid = request.getParameter("saveid");
	
	MemberDAO memberDao = new MemberDAO();
	int n = memberDao.login(id, pwd);
	
	if(n == memberDao.LOGIN_OK) {
		%>
		<script>
			alert('로그인 성공!');
			location.href = '/main.jsp';
		</script>
		<%
	}else {
		%>
		<script>
			alert('아이디 혹은 비밀번호가 잘못 되었습니다.');
			location.href = '/member/login.jsp';
		</script>
		<%
	}
%>