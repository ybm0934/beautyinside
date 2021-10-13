<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	if (session.getAttribute("NAME") == null) {
		%>
			<script>
				alert('잘못된 접근입니다!');
				location.href ='/admin/login/login.jsp';
			</script>
		<%
	}
%>
<%@ page import="java.util.*" %>
<%@ page import="com.beauty.admin.chat.AdminChatDTO" %>
<jsp:useBean id = "dao" class="com.beauty.admin.chat.AdminChatDAO"/>
<%
	ArrayList<AdminChatDTO> arr = dao.chatList();

	//페이징 변수
	int currentPage = 1; // 현재 페이지
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int totalRecord = arr.size(); // 총 레코드 수
	int pageSize = 10; // 보여지는 레코드 수
	int blockSize = 5; // 보여지는 페이지 버튼 수
	int totalPage = (int) Math.ceil((double) totalRecord / pageSize); // 총 페이지수 
	int firstPage = currentPage - ((currentPage - 1) % blockSize); // 버튼 시작시점
	int lastPage = firstPage + (blockSize - 1); // 버튼의 마지막지점
	int curPos = (currentPage - 1) * pageSize; // rownum
	int num = totalRecord - (curPos); // 브레이크
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300&display=swap">
<link rel="stylesheet" type="text/css" href="/admin/css/reset.css">
<link rel="stylesheet" type="text/css" href="/admin/chat/css/chat.css">
<title>관리자페이지-채팅관리</title>
</head>
<body>
<%@ include file="../index/header.jsp" %>
	<h1 class="a">채팅관리</h1>
    <div>
        <table>
            <thead>
                <tr>
                    <th style="width: 150px;">아이디(이름)</th>
                    <th style="width: 500px;">채팅 내용</th>
                    <th style="width: 200px;">날짜</th>
                </tr>
            </thead>
            <tbody>
            	<%
            		for (int i = 0; i < pageSize; i++) {
            			
            			if (num < 1) break;
            			AdminChatDTO dto = arr.get(curPos++);
            			num--;
            			%>
            				<tr>
			                    <td><%= dto.getId() %>(<%= dto.getName() %>)</td>
			                    <td style="border-left: 1px solid black; border-right: 1px solid black;"><%= dto.getContent() %></td>
			                    <td><%= dto.getRegdate() %></td>
			                </tr>
            			<%
            		}
	        		if (totalPage == 0) {
	        			%>	                      
	        				<tr id="tr_null">
	        					<td colspan="5" align="center" style="padding-top: 150px;"><img src="/admin/img/icon_magnifier_black.png"></td>
	        				</tr>
	        				 <tr id="tr_null">	                            
	        					<td colspan="5" align="center" id="td_null" style="padding-top: 30px;">채팅이 없습니다!</td>
	        				</tr>
	        			<%
	        		}
            	%>
            </tbody>
        </table>
        <div class="page_btn">
            	<% 
            		if (firstPage > 1 ) {
            			%>
            				<a href="/admin/chat/chat.jsp?currentPage=<%= firstPage - 1 %>">◁</a>
            			<%
            		}
            		for (int i = firstPage; i <= lastPage; i++) {
            			if (i == currentPage) {
                			%>
            				<span><%= i %></span>
            				<%
            			} else {
                			%>
            				<a href="/admin/chat/chat.jsp?currentPage=<%= i %>"><%= i %></a>
            				<%	
            			}
            			if (i == totalPage) {
            				break;
            			}
   						if (totalPage == 0) {
   							break;
   						}
            		}
            		if (lastPage < totalPage) {
            			%>
            				<a href="/admin/chat/chat.jsp?currentPage=<%= lastPage + 1%>">▷</a>
            			<%
            		}
            	%>
            </div>
    </div>
<%@ include file="../index/footer.jsp" %>
</body>
</html>