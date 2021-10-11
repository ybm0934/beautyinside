<%@page import="com.beauty.reserve.ReserveDAO"%>
<%@page import="com.beauty.reserve.ReserveDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/member/loginCheck.jsp" %>
<%
	if(cid != null) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String service = request.getParameter("service");
		String price = request.getParameter("price");
		String resDate = request.getParameter("resDate");
		String resTime = request.getParameter("resTime");
		String resWords = request.getParameter("resWords");
		if(resWords == null) resWords = "";
		String fullDate = resDate + resTime;
		
		ReserveDTO resDto = new ReserveDTO();
		resDto.setName(name);
		resDto.setEmail(email);
		resDto.setTel(tel);
		resDto.setService(service);
		resDto.setPrice(price);
		resDto.setResDate(fullDate);
		resDto.setResWords(resWords);
		
		ReserveDAO resDao = new ReserveDAO();
		int cnt = resDao.reserve(resDto);
		
		if(cnt > 0) {
			%>
				<script>
					alert('예약이 완료되었습니다.');
					location.href = '/main.jsp';
				</script>
			<%
		}else {
			%>
				<script>
					alert('예약 실패!');
					location.href = '/reserveMenu.jsp';
				</script>
			<%
		}
	}
%>