<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.review.AdminReviewDAO" />
<jsp:useBean id="dto" class="com.beauty.admin.review.AdminReviewDTO" />
<jsp:setProperty property="*" name="dto"/>
<%
	String no = request.getParameter("no");

	int result = dao.reviewUpdate(dto, Integer.parseInt(no));
	
	if (result == 1) {
		%>
			<script>
				alert('문의 수정 완료');
				location.href='/admin/review/review.jsp';
			</script>
		<%
	} else {
		%>
			<script>
				alert('입력이 안된 곳이 있습니다');
				history.back();
			</script>
		<%
	}
%> 
