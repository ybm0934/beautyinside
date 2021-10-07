<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%
	/*
		200 - 요청이 정삭적으로 처리됨
		307 - 임시로 페이지가 리다이렉트됨
		400 - 클라이언트의 요청이 잘못된 구문으로 구성됨
		401 - 접근이 허용되지 않음
		404 - 지정된 URL을 처리하기 위한 자원이 존재하지 않음
		405 - 요청된 메서드는 허용되지 않음
		500 - 서버 내부 에러, JSP에서 Exception이 발생하는 경우를 포함
		503 - 서버가 일시적으로 서비스를 제공할 수 없음. 과부하가 걸리거나 임시보수중일 때 해당됨.
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
<style>
	#error_div {
		text-align: center;
	}
</style>
</head>
<body>
	<div id="error_div">
		<h1 style="color:red;">죄송합니다. 페이지가 작동하지 않습니다.</h1>
		<br>
		<h2>요청하신 페이지에 문제가 발생하였습니다.</h2>
		<h2>빠른 시일 내에 처리하도록 하겠습니다.</h2>
		<h2>이용에 불편을 드려 대단히 죄송합니다.</h2>
	</div>
</body>
</html>