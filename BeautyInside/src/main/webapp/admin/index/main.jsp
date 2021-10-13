<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("userid") == null) {
		%>
			<script>
				alert('잘못된 접근입니다!');
				location.href ='/admin/login/login.jsp';
			</script>
		<%
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300&display=swap">
<link rel="stylesheet" type="text/css" href="/admin/css/reset.css">
<link rel="stylesheet" type="text/css" href="/admin/index/css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>관리자페이지-메인</title>
</head>
<body>
<%@ include file="/admin/index/header.jsp" %>
<main>
	<!-- 메인 화면 -->
    <div class="main_div">
        <div class="main_logo">
            <span>PURE</span>
        </div>
    </div>
</main>
<%@ include file="/admin/index/footer.jsp" %>
</body>
</html>