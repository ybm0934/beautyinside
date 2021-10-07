<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.member.AdminMemberDAO"/>
<%
	String cb[] = request.getParameterValues("check");

	if (cb == null) {
		%>
			<script>
				alert('휴면등록할 회원을 체크해주세요!');
				history.back();
			</script>
		<%
	} else {
		for (int i = 0; i < cb.length; i++) {
			int no = Integer.parseInt(cb[i]);
			dao.memberDormantUpdate(no);
		}
		%>
			<script>
				alert('회원 휴면등록 완료!');
				location.href='/admin/member/member.jsp';
			</script>
		<%
	}
%>
