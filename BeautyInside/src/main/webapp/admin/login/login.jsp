<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/admin/css/reset.css">
<link rel="stylesheet" type="text/css" href="/admin/login/css/login.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300&display=swap">
<title>PURE-로그인</title>
</head>
<body>
<header>
    <h1>PURE</h1>
</header>
<main>
	<!-- 로그인 화면 -->
    <div class="login_div">
        <form method="post" action="/admin/login/login_action.jsp">
            <div><input type="text" name="id" placeholder="ID" class="login_input"></div>
            <div><input type="password" name="pwd" placeholder="PWD" class="login_input"></div>
            <input type="submit" value="로그인" class="login_btn">
        </form>
    </div>
</main>
<footer>
	<div>
		<span>COPYRIGHT (C) 2021 PURE ALL RIGHTS RESERVED.</span>
	</div>
</footer>
</body>
</html>