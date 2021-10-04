<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String cb[] = request.getParameterValues("check");

	for (int i = 0; i < cb.length; i++) {
		System.out.print(cb[i]);
	}

%>
<script>
	let result = confirm('정말 삭제하시겠습니까?');
	
	if (result) {
		alert('회원 삭제 완료!');
		location.href='/admin/member/member.jsp';
	} else if (<%= cb.length %> == 0) {
		history.back();
	} else {
		history.back();
	}
	// 수정 부분!!
</script>