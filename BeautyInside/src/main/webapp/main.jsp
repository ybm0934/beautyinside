<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String target = request.getParameter("target");
	if(target == null) target = "";
%>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script>
    $(document).ready(function() {
		// 앵커 슬라이드 효과
        $('a[href^="#"]').on('click', function(e) {
            e.preventDefault();

            var target = this.hash;
            var $target = $(target);

            $('html, body').stop().animate({
                'scrollTop': $target.offset().top
            }, 1500, 'swing', function () {
                window.location.hash = target;
            });
        });
		
        // 타이틀 슬라이드 효과
        $('#main_title_2').animate({opacity : 1, marginLeft : 200}, 2000);

        setInterval(function() {
            $('#main_title, #main_title_dot').animate({opacity : 0}, 500);
            $('#main_title, #main_title_dot').animate({opacity : 1}, 1000);
            $('#main_title_2').animate({opacity : 0}, 1000);
            $('#main_title_2').animate({opacity : 1}, 1000);
        }, 5000);
    });
    
 	window.onload = function() {
 		acMove(<%=target %>);
 	}
 	
 	// 파라미터 앵커
 	function acMove(target) {
 		$(document).ready(function(){
			var offset = $(target).offset();
			$('html, body').animate({scrollTop : offset.top}, 500);
 		});
    }
 	
 	// 포트폴리오 이동
 	function portfolio() {
 		location.href = '/single/portfolio.jsp';
 	}
</script>
<div id="main_div">
    <div class="main_div_class" id="main">
        <span id="main_title">PURE</span>
        <span id="main_title_dot">.</span>
        <br>
        <span id="main_title_2">마법같은 메이크업!</span>
    </div>
    <div class="main_div_class" id="blank"></div>
    <%@ include file="/single/introduce.jsp" %>
    <%@ include file="/single/service.jsp" %>
    <div id="portfolio">
        <table id="portfolio_table">
            <caption>포트폴리오 테이블</caption>
            <thead></thead>
            <tfoot></tfoot>
            <tbody>
                <tr>
                    <td>
                        <a href="#" onclick="portfolio();">
                            <img src="/img/StockSnap_P1KLMCNBPU.jpg" alt="포트폴리오 이미지">
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="portfolio();">
                            <img src="/img/shutterstock_748987114.jpg" alt="포트폴리오 이미지">
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="portfolio();">
                            <img src="/img/245i23905285902.jpg" alt="포트폴리오 이미지">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="#" onclick="portfolio();">
                        	<img src="/img/StockSnap_LRSAT4NCLS.jpg" alt="포트폴리오 이미지">
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="portfolio();">
                            <img src="/img/PICO+GENESIS+FINAL.jpg" alt="포트폴리오 이미지">
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="portfolio();">
                            <img src="/img/StockSnap_VTD0ZZ6HOV.jpg" alt="포트폴리오 이미지">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="#" onclick="portfolio();">
                            <img src="/img/s898787433609788098_p246_i1_w1400.jpeg" alt="포트폴리오 이미지">
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="portfolio();">
                            <img src="/img/shutterstock_1171351564.jpg" alt="포트폴리오 이미지">
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="portfolio();">
                            <img src="/img/headergraphic1-1024x614.jpg" alt="포트폴리오 이미지">
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="main_div_class" id="blank2"></div>
    <%@ include file="/single/contact.jsp" %>
</div>
<%@ include file="/bottom.jsp" %>