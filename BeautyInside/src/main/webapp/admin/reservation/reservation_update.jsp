<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.reservation.AdminReservationDAO" />
<jsp:useBean id="dto" class="com.beauty.admin.reservation.AdminReservationDTO" />
<jsp:setProperty property="*" name="dto"/>
<%
	
	int result = dao.reservationUpdate(dto);
	
	if (result == 1) {
		%>
			<script>
				alert('예약 변경 완료!');
				location.href='/admin/reservation/reservation.jsp';
			</script>
		<%
	}
%>

