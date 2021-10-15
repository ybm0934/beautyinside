<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.chat.AdminChatDAO"/>
<%
	String id = request.getParameter("id");

	int result = dao.chatDelete(id);
	
	if (result == 1) {
		%>
			<script>
				alert('채팅 삭제 완료!');
				location.href='/admin/chat/chat.jsp';
			</script>
		<%
	}
%>