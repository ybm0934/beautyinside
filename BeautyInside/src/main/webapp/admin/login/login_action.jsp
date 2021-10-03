<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.AdminDAO"/>
<jsp:useBean id="dto" class="com.beauty.admin.AdminDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	int result = dao.login(dto.getId(), dto.getPwd());
	
	if (result == 1) {
		// 로그인 성공
		String name = dao.loginName(dto.getId());
		session.setAttribute("NAME", name);
		%>
			<script>
				location.href = '/admin/index/main.jsp';
			</script>
		<%
	} else if (result == -1) {
		// 로그인 실패
		%>
			<script>
				alert('로그인 실패!');
				history.back();
			</script>
		<%
	}
%>
