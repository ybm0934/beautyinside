<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/admin/css/header.css">
<header>
	<!-- 상단 헤더 -->
    <div class="header_div">
        <div class="header_logo">
            <a href="/admin/index/main.jsp" class="logo">PURE</a>
        </div>
        <form action="/admin/login/logout_action.jsp">
	        <div class="header_logout">
	            <span><%= session.getAttribute("NAME") %></span>
	            <input type="submit" class="logout_btn" value="로그아웃">
	        </div>
	    </form>
    </div>
    <!-- 상단 네비 버튼 -->
    <nav>
        <div class="main_menubar">
            <input type="button" class="main_btn" value="회원관리" onclick="location.href='/admin/member/member.jsp'">
            <input type="button" class="main_btn" value="리뷰관리" onclick="location.href='/admin/reviewbbs/reviewbbs.jsp'">
            <input type="button" class="main_btn" value="게시판관리">
            <input type="button" class="main_btn" value="예약관리">
            <input type="button" class="main_btn" value="채팅관리">
        </div>
    </nav>
</header>