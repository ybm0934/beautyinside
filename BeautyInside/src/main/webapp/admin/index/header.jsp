<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/admin/index/css/header.css">
<header>
	<!-- 상단 헤더 -->
    <div class="header_div">
        <div class="header_logo">
            <a href="/admin/index/main.jsp" class="logo"><img alt="헤더로고" src="/admin/img/test4.png"></a>
        </div>
        <form name="logout_fm" action="/admin/login/logout_action.jsp">
	        <div class="header_logout">
	            <span style="margin: 20px;"><%= session.getAttribute("NAME")%>님</span>
					<span id="logout_btn">
						<img src="/admin/img/icon_logout.png">
					</span>
	        </div>
	    </form>
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	         	        	<script>
	            	$(document).ready(function () {
						$('#logout_btn').click(function () {
							$('form[name=logout_fm]').submit();
						});
					});
		            </script>
    </div>
    <!-- 상단 네비 버튼 -->
    <nav>
        <div class="main_menubar">
            <input type="button" class="main_btn" value="회원관리" onclick="location.href='/admin/member/member.jsp'">
            <input type="button" class="main_btn" value="리뷰관리" onclick="location.href='/admin/review/review.jsp'">
            <input type="button" class="main_btn" value="통합관리" onclick="location.href='/admin/total/total.jsp'">
            <input type="button" class="main_btn" value="예약관리" onclick="location.href='/admin/reservation/reservation.jsp'">
            <input type="button" class="main_btn" value="채팅관리" onclick="location.href='/admin/chat/chat.jsp'">
        </div>
    </nav>
</header>