<%@page import="java.io.File"%>
<%@page import="com.beauty.review.ReviewDTO"%>
<%@page import="com.beauty.review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/member/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	int no = Integer.parseInt(request.getParameter("no"));
	
	if(cid != null) {
		ReviewDAO reviewDao = new ReviewDAO();
		ReviewDTO reviewDto = new ReviewDTO();
		reviewDto = reviewDao.reviewByNo(no);
		if(reviewDto == null) response.sendRedirect("/review/reviewList.jsp");
		String fileName = reviewDto.getFileName();
		
		// 올린 파일이 있는지 확인
		String savePath = application.getRealPath("/review/upload"); // 업로드 절대 경로
		File file = new File(savePath, fileName);
		if(file.exists()){
			file.delete();
		}
		
		int cnt = reviewDao.reviewDelete(no, cid);
		
		if(cnt > 0){
%>
			<script>
				alert('글을 삭제하였습니다.');
				location.href = '/review/reviewList.jsp';
			</script>
<%			
		}else {
%>
			<script>
				alert('글 삭제 실패!');
				location.href = '/review/reviewDetail.jsp?no=' + <%=no %>;
			</script>
<%			
		}
	}// if
%>