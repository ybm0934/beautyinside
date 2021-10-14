<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.beauty.admin.total.AdminTotalDAO"/>
<%
	int result = dao.dateListDelete();

	if (result == 0) {
		%>
			<script>
				alert('검색 초기화 완료!');
				location.href='/admin/total/total.jsp';
			</script>
		<%
	}
%>