<%@page import="com.beauty.review.ReviewDAO"%>
<%@page import="com.beauty.review.ReviewDTO"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/member/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String savePath = application.getRealPath("/review/upload"); // 업로드 절대 경로
	String encType = "UTF-8"; // 인코딩 타입
	int maxSize = 1024 * 1024 * 30; // 최대 크기 30MB
	
	// DefaultFileRenamePolicy : 파일명 중복 시 덮어쓰기 방지. 파일명 + 1, 2, 3... 처리
	try {
		MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
		
		String fileName = mr.getFilesystemName("fileName"); // 중복 파일명
		String orgFileName = mr.getOriginalFileName("fileName"); // 원본 파일명
		System.out.println("중복 파일 이름 : " + fileName);
		System.out.println("원본 파일 이름 : " + orgFileName);
		System.out.println("저장 경로 : " + savePath);
		
		// 파일 사이즈를 MB로 변환
		double fileSize = 0;
		if(fileName != null) {
			File file = mr.getFile("fileName");
			fileSize = Math.round((file.length() / 1024.0 / 1024.0) * 100.0) / 100.0;
			System.out.println("파일 사이즈 : " + fileSize + "MB");
			
			// 기존 파일 삭제
			File oldFile = new File(savePath, mr.getParameter("oldFile"));
			if(oldFile.exists()) oldFile.delete();
		}else {
			fileName = mr.getParameter("oldFile");
			orgFileName = mr.getParameter("oldOrgFile");
			fileSize = Double.parseDouble(mr.getParameter("fileSize"));
		}
		
		int no = Integer.parseInt(mr.getParameter("no"));
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		ReviewDTO reviewDto = new ReviewDTO();
		reviewDto.setNo(no);
		reviewDto.setId(cid);
		reviewDto.setTitle(title);
		reviewDto.setContent(content);
		reviewDto.setFileName(fileName);
		reviewDto.setOrgfileName(orgFileName);
		reviewDto.setFileSize(fileSize);
		
		ReviewDAO reviewDao = new ReviewDAO();
		int cnt = reviewDao.reviewUpdate(reviewDto);
		
		if(cnt > 0) {
%>
			<script>
				location.href = '<%=request.getContextPath()%>/review/reviewDetail.jsp?no=<%=no %>';
			</script>
			<%
		}else {
			%>
			<script>
				alert('글 수정 실패!');
				location.href = '<%=request.getContextPath()%>/review/reviewDetail.jsp?no=<%=no %>';
			</script>
			<%
		}
	}catch(IOException e){
		%>
		<script>
			alert('30MB 이상의 파일은 업로드 할 수 없습니다.');
			history.back();
		</script>
		<%
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}
%>