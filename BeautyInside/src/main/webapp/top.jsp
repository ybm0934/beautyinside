<%@page import="com.beauty.member.MemberDAO"%>
<%@page import="com.beauty.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = (String) session.getAttribute("userid");
	long logtime = 100000000000000L;
	if(session.getAttribute("logtime") != null) {
		logtime = (long) session.getAttribute("logtime");
	}
	
	// int GMT = 1000 * 60 * 60 * 9; // 그리니치 천문대 기준 9시간 설정
	// long remainTime = (System.currentTimeMillis() - logtime) - GMT; // 경과된 시간 계산
	// long ten = 1000 * 60 * 10; // 10분
	// SimpleDateFormat sdf = new SimpleDateFormat("mm:ss");
	
	MemberDTO memberDto = new MemberDTO();
	MemberDAO memberDao = new MemberDAO();
	memberDto = memberDao.selectByNo(userid);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>:: BEAUTY INSIDE ::</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/top.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			var timer = 30; // 유효 시간 설정
			var logtime = <%=logtime %>;
			var ten = logtime + (1000 * 60 * timer + 2000); // 새로고침 딜레이 2초
			
			setInterval(function() {
				setClock();
			}, 1000);
			
			function setClock() {
				var now = new Date().getTime();
				var distance = ten - now; // 10분 밀리초 환산
				
				// 남은 시간 경과되면 세션 만료
				if(distance <= 0) {
					location.href = '/member/logout.jsp';
					return false;
				}
				
				var _ss = 1000; // 초
				var _mm = _ss * 60; // 분
				var _hh = _mm * 60; // 시
				
				// 밀리초를 시분초로 변환하는 공식
				var mm = Math.floor((distance % _hh) / _mm);
				var ss = Math.floor((distance % _mm) / _ss);
				
				mm = mm.toString();
				ss = ss.toString();
				
				$('#time_spn a').html(('0' + mm).slice(-2) + ':' + ('0' + ss).slice(-2));
			}
			
			$('#extend').click(function(){
				$.ajax({
					url : '<%=request.getContextPath() %>/member/extend.jsp',
					type : 'POST',
					success : function(data){
						if(confirm('로그인 시간을 연장 하시겠습니까?')) {
							location.reload();
						}
					},
					error : function(){
						alert('extend 통신 실패!');
					}
				});
			});
		});
	</script>	
</head>
<header id="header">
    <div id="top">
    <%if(userid == null) { %>
        <span class="sign">
            <a href="<%=request.getContextPath() %>/member/login.jsp">로그인</a>
        </span>
        <span class="sign" style="color:gray; font-size: 0.7em;"> | </span>
        <span class="sign">
            <a href="<%=request.getContextPath() %>/member/register.jsp">회원가입</a>
        </span>
	<%}else { %>
		<span class="usersign userid_spn"><%=memberDto.getName() %></span>
		<span class="usersign wellcome_spn">님 반갑습니다!</span>
		<span class="usersign remainTime_spn">
			<span id="time_spn">
				[ <a href="#" id="extend">30:00</a> ]
			</span>
		</span>
		<span class="usersign">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
		<span class="sign">
			<a href="/member/logout.jsp">로그아웃</a>
		</span>
	<%} %>
    </div>
    <ul id="main_ul">
        <li>
            <span class="ul_spn">
                <a href="#main" id="main_a">메인</a>
            </span>
        </li>
        <li>
            <span class="ul_spn">
                <a href="#about" id="about_a">소개</a>
            </span>
        </li>
        <li>
            <span class="ul_spn">
                <a href="#service" id="service_a">서비스</a>
            </span>
        </li>
        <li>
            <span class="ul_spn">
                <a href="#portfolio" id="portfolio_a">포트폴리오</a>
            </span>
        </li>
        <li>
            <span class="ul_spn">
                <a href="<%=request.getContextPath() %>/review/reviewList.jsp">후기</a>
            </span>
        </li>
        <li>
            <span class="ul_spn">
                <a href="#contact" id="contact_a">문의</a>
            </span>
        </li>
        <li>
            <span class="ul_spn">
                <a href="<%=request.getContextPath() %>/reserve/reserve.jsp">예약</a>
            </span>
        </li>
        <li>
            <span class="sns_logo_spn">
                <a href="https://www.facebook.com" target="_blank">
                    <img src="/img/ico/facebook.png" alt="sns_logo">
                </a>
                <a href="https://www.instagram.com" target="_blank">
                    <img src="/img/ico/instagram.png" alt="sns_logo">
                </a>
                <a href="https://www.twitter.com" target="_blank">
                    <img src="/img/ico/twitter.png" alt="sns_logo">
                </a>
            </span>
        </li>
    </ul>
</header>
<body oncontextmenu = "return false">