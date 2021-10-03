<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>BEAUTY INSIDE</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // 앵커 슬라이드 효과
            $('a[href^="#"]').on('click',function (e) {
                e.preventDefault();

                var target = this.hash;
                var $target = $(target);

                $('html, body').stop().animate({
                    'scrollTop': $target.offset().top
                }, 900, 'swing', function () {
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
</head>
<body>
    <header id="header">
        <div id="top">
            <span class="sign">
                <a href="#" alt="로그인">로그인</a>
            </span>
            <span class="sign" style="color:gray; font-size: 0.7em;"> | </span>
            <span class="sign">
                <a href="#" alt="회원가입">회원가입</a>
            </span>
        </div>
        <ul id="main_ul">
            <li>
                <span class="ul_spn">
                    <a href="#main" id="main_a">메인</a>
                </span>
            </li>
            <li>
                <span class="ul_spn">
                    <a href="#about">소개</a>
                </span>
            </li>
            <li>
                <span class="ul_spn">
                    <a href="#service">서비스</a>
                </span>
            </li>
            <li>
                <span class="ul_spn">
                    <a href="#portfolio">포트폴리오</a>
                </span>
            </li>
            <li>
                <span class="ul_spn">
                    <a href="#">후기</a>
                </span>
            </li>
            <li>
                <span class="ul_spn">
                    <a href="#contact">문의</a>
                </span>
            </li>
            <li>
                <span class="ul_spn">
                    <a href="#">예약</a>
                </span>
            </li>
            <li>
                <span class="sns_logo_spn">
                    <a href="https://www.facebook.com" alt="facebook" target="_blank">
                        <img src="../img/ico/facebook.png" alt="sns_logo">
                    </a>
                    <a href="https://www.instagram.com" alt="instagram" target="_blank">
                        <img src="../img/ico/instagram.png" alt="sns_logo">
                    </a>
                    <a href="https://www.twitter.com" alt="twitter" target="_blank">
                        <img src="../img/ico/twitter.png" alt="sns_logo">
                    </a>
                </span>
            </li>
        </ul>
    </header>
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
                                <img src="../img/portfolio (1).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="../img/portfolio (2).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="../img/portfolio (3).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">
                                <img src="../img/portfolio (4).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="../img/portfolio (5).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="../img/portfolio (6).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">
                                <img src="../img/portfolio (7).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="../img/portfolio (8).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <img src="../img/portfolio (9).jpg" alt="포트폴리오 이미지">
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="main_div_class" id="blank3"></div>
        <div class="main_div_class" id="contact"></div>
    </div>
    <footer id="footer">
        <span>&copy; 2023 by BeautyInside. Proudly created with beauty.com</span>
        <br>
        <span class="sns_logo_spn">
            <a href="https://www.facebook.com" alt="facebook" target="_blank">
                <img src="../img/ico/facebook.png" alt="sns_logo">
            </a>
            <a href="https://www.instagram.com" alt="instagram" target="_blank">
                <img src="../img/ico/instagram.png" alt="sns_logo">
            </a>
            <a href="https://www.twitter.com" alt="twitter" target="_blank">
                <img src="../img/ico/twitter.png" alt="sns_logo">
            </a>
        </span>
    </footer>
</body>
</html>