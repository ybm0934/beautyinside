<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.review.AdminReviewDAO"/>
<%
	String no = request.getParameter("no");
	
	int result = dao.reviewDelete(Integer.parseInt(no));
	
	if (result == 1) {
		%>
			<script>
				alert('리뷰 삭제 완료!');
				location.href='/admin/review/review.jsp';
			</script>
		<%
	}
%>