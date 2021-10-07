<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.beauty.admin.review.AdminReviewDTO" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dao" class="com.beauty.admin.review.AdminReviewDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300&display=swap">
<link rel="stylesheet" type="text/css" href="/admin/css/reset.css">
<link rel="stylesheet" type="text/css" href="/admin/css/review_update.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>관리자페이지-리뷰수정</title>
</head>
<body>
<%@ include file ="/admin/index/header.jsp" %>
<main>
	<section>
		<article>
		<h1 class="a">리뷰수정</h1>
		<form action="/admin/review/review_update_action.jsp">
        <table class="review_table">
            <tbody>
            	<%
            		int no = Integer.parseInt(request.getParameter("no"));
            		ArrayList<AdminReviewDTO> arr = dao.reviewContent(no);
            		for (int i = 0; i < arr.size(); i++) {
            	%>
	            	<tr>
	            		<th>제목</th>
	            		<td colspan="8"><input type="text" name="title" value="<%= arr.get(i).getTitle() %>" style="width:100%;"><input type="hidden" name="no" value="<%= arr.get(i).getNo()%>"></td>
	            	</tr>
	                <tr>
	                    <th>닉네임</th>
	                    <td colspan="3"><%= arr.get(i).getId() %></td>
	                    <th colspan="2">조회수</th>
	                    <td colspan="2"><%= arr.get(i).getCount() %></td>
	                </tr>
	                <tr>
	                    <th>첨부파일</th>
	                    <td colspan="3"><%= arr.get(i).getFilename() %></td>
	                    <th>작성일</th>
	                    <td colspan="3"><%= arr.get(i).getRegdate() %></td>
	                </tr>
	                <tr>
	                    <td colspan="9">
	                        <textarea name="content"><%= arr.get(i).getContent() %></textarea>
	                    </td>
	                </tr>
                <%
            		}
                %>
            </tbody>
        </table>
       	<div class="update_btn">
     		<input type="reset" value="되돌리기">
     		<input type="submit" value="수정하기">
     	</div>
        </form>
		</article>
	</section>
</main>
<%@ include file ="/admin/index/footer.jsp" %>
</body>
</html>