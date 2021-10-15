<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.chat.AdminChatDAO"/>
<%
	String id = request.getParameter("id");
	System.out.println("삭제될 아이디 = " + id);
	int result = dao.chatDelete(id);
	System.out.println("삭제 결과 result =" + result);
	if (result > 0) {
		System.out.println("result 1일떄 들어옴");
		%>
			<script>
				alert('채팅 삭제 완료!');
				location.href='/admin/chat/chat.jsp';
			</script>
		<%
		System.out.println("result 1일떄  나감");
	}
%>