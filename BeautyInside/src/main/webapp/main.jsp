<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="/single/css/contact.css">
<script>
    $(document).ready(function() {
		// 앵커 슬라이드 효과
        $('a[href^="#"]').on('click',function (e) {
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
</script>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="main_div">
        <div class="main_div_class" id="main">
            <span id="main_title">PURE</span>
            <span id="main_title_dot">.</span>
            <br>
            <span id="main_title_2">마법같은 메이크업!</span>
        </div>
        <div class="main_div_class" id="blank"></div>
        <div class="main_div_class" id="about"></div>
        <div class="main_div_class" id="service"></div>
        <div class="main_div_class" id="blank2"></div>
        <div id="portfolio">
            <table id="portfolio_table">
                <caption>포트폴리오 테이블</caption>
                <thead></thead>
                <tfoot></tfoot>
                <tbody>
                    <tr>
                        <td>
                            <a href="#">
                                <img src="/img/portfolio (1).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="/img/portfolio (2).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="/img/portfolio (3).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">
                                <img src="/img/portfolio (4).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="/img/portfolio (5).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="/img/portfolio (6).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">
                                <img src="/img/portfolio (7).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="/img/portfolio (8).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="/img/portfolio (9).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="main_div_class" id="blank3"></div>
        <%@ include file="/single/contact.jsp" %>
    </div>
<%@ include file="/bottom.jsp" %>