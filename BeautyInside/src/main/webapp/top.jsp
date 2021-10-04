<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>:: BEAUTY INSIDE ::</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/top.css">
</head>
<header id="header">
    <div id="top">
    <% %>
        <span class="sign">
            <a href="<%=request.getContextPath() %>/member/login.jsp" alt="로그인">로그인</a>
        </span>
        <span class="sign" style="color:gray; font-size: 0.7em;"> | </span>
        <span class="sign">
            <a href="<%=request.getContextPath() %>/member/register.jsp" alt="회원가입">회원가입</a>
        </span>
	<% %>
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
                <a href="https://www.facebook.com" alt="facebook" target="_blank">
                    <img src="/img/ico/facebook.png" alt="sns_logo">
                </a>
                <a href="https://www.instagram.com" alt="instagram" target="_blank">
                    <img src="/img/ico/instagram.png" alt="sns_logo">
                </a>
                <a href="https://www.twitter.com" alt="twitter" target="_blank">
                    <img src="/img/ico/twitter.png" alt="sns_logo">
                </a>
            </span>
        </li>
    </ul>
</header>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">