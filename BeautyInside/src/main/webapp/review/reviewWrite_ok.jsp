<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="yong.board.BoardDTO"%>
<%@page import="yong.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
	
	String savePath = application.getRealPath("/board/upload"); // 업로드 실제 경로
	String encType = "UTF-8"; // 인코딩 타입
	int maxSize = 1024 * 1024 * 30; // 최대 크기 30MB
	
	// DefaultFileRenamePolicy() : 파일명 중복 시 덮어쓰기 방지
	try {
		MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
		
		String fileName = mr.getFilesystemName("fileName");
		System.out.println("파일 이름 : " + fileName);
		System.out.println("저장 경로 : " + savePath);
		
		double fileSize = 0;
		if(fileName != null){
	File file = mr.getFile("fileName");
	fileSize = Math.round((file.length() / 1024.0 / 1024.0) * 100.0) / 100.0;
	System.out.println("파일 사이즈 : " + fileSize + "MB");
		}
		
		String name = mr.getParameter("name");
		String pwd = mr.getParameter("pwd");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		ReviewDTO boardDto = new ReviewDTO();
		
		boardDto.setName(name);
		boardDto.setPwd(pwd);
		boardDto.setTitle(title);
		boardDto.setContent(content);
		boardDto.setFileName(fileName);
		boardDto.setFileSize(fileSize);
		
		ReviewDAO boardDao = new ReviewDAO();
		
		int cnt = boardDao.write(boardDto);
		
		if(cnt > 0) {
%>
			<script>
				location.href = '<%=request.getContextPath()%>/board/list.jsp';
			</script>
			<%
		}else {
			%>
			<script>
				alert('글쓰기 실패!');
				location.href = '<%=request.getContextPath()%>/board/list.jsp';
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