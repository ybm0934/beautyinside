<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.member.AdminMemberDAO"/>
<%
	String cb[] = request.getParameterValues("check");
	
	if (cb == null) {
		%>
			<script>
				alert('삭제할 회원을 체크해주세요!');
				history.back();
			</script>
		<%
	}
	if (!(cb == null)){
		for (int i = 0; i < cb.length; i++) {
			String no = (cb[i]);
			dao.memberDelete(no);
		}
		%>
			<script>
				alert('회원 삭제 완료!');
				location.href='/admin/member/member.jsp';
			</script>
		<%
	}
%>