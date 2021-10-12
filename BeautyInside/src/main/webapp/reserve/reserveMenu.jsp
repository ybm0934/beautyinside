<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<link rel="stylesheet" type="text/css" href="/reserve/css/reserveMenu.css">
<script>
	function service(service, price) {
		document.reserveMenu.service.value = service;
		document.reserveMenu.price.value = price;
		
		document.reserveMenu.submit();
	}
</script>
<div id="wrap">
    <form name="reserveMenu" method="post" action="/reserve/reserve.jsp">
        <input type="hidden" name="service" id="service">
        <input type="hidden" name="price" id="price">
    </form>
    <div id="title_div">
        <h1>RESERVE</h1>
    </div>
    <table id="reserveMenu_table">
        <caption>예약 메뉴 테이블</caption>
        <tr>
            <td>
                <div class="imgWrap">
                    <div class="menu" id="menu1" onclick="service('젤 매니큐어', '15000')">
                        <div class="menuTitle">
                            <span class="titleSpn">젤 매니큐어</span>
                        </div>
                        <div class="menuSubtitle">
                            <span class="subtitleSpn">
                                A chemical combination similar to acrylics.
                            </span>
                        </div>
                        <div class="menuPrice">
                            <span class="priceSpn">&#8361; 15,000</span>
                        </div>
                        <div class="menuBtn">
                            <input type="button" class="reserveBtn" value="예약하기">
                        </div>
                    </div>
                </div>
            </td>
            <td>
                <div class="imgWrap">
                    <div class="menu" id="menu2" onclick="service('네일 아트', '25000')">
                        <div class="menuTitle">
                            <span class="titleSpn">네일 아트</span>
                        </div>
                        <div class="menuSubtitle">
                            <span class="subtitleSpn">
                                The nail-care industry has been growing.
                            </span>
                        </div>
                        <div class="menuPrice">
                            <span class="priceSpn">&#8361; 25,000</span>
                        </div>
                        <div class="menuBtn">
                            <input type="button" class="reserveBtn" value="예약하기">
                        </div>
                    </div>
                </div>
            </td>
            <td>
                <div class="imgWrap">
                    <div class="menu" id="menu3" onclick="service('매니큐어 손질', '35000')">
                        <div class="menuTitle">
                            <span class="titleSpn">매니큐어 손질</span>
                        </div>
                        <div class="menuSubtitle">
                            <span class="subtitleSpn">
                                A lacquer applied to nails to protect or as a base color.
                            </span>
                        </div>
                        <div class="menuPrice">
                            <span class="priceSpn">&#8361; 35,000</span>
                        </div>
                        <div class="menuBtn">
                            <input type="button" class="reserveBtn" value="예약하기">
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="imgWrap">
                    <div class="menu" id="menu4" onclick="service('퓨어 클렌징', '70000')">
                        <div class="menuTitle">
                            <span class="titleSpn">퓨어 클렌징</span>
                        </div>
                        <div class="menuSubtitle">
                            <span class="subtitleSpn">
                                The term cleanser refers to a product that cleans.
                            </span>
                        </div>
                        <div class="menuPrice">
                            <span class="priceSpn">&#8361; 70,000</span>
                        </div>
                        <div class="menuBtn">
                            <input type="button" class="reserveBtn" value="예약하기">
                        </div>
                    </div>
                </div>
            </td>
            <td>
                <div class="imgWrap">
                    <div class="menu" id="menu5" onclick="service('퓨어 마사지', '70000')">
                        <div class="menuTitle">
                            <span class="titleSpn">퓨어 마사지</span>
                        </div>
                        <div class="menuSubtitle">
                            <span class="subtitleSpn">
                                Massage is the manipulation of the body's soft tissues.
                            </span>
                        </div>
                        <div class="menuPrice">
                            <span class="priceSpn">&#8361; 70,000</span>
                        </div>
                        <div class="menuBtn">
                            <input type="button" class="reserveBtn" value="예약하기">
                        </div>
                    </div>
                </div>
            </td>
            <td>
                <div class="imgWrap">
                    <div class="menu" id="menu6" onclick="service('수분 공급', '50000')">
                        <div class="menuTitle">
                            <span class="titleSpn">수분 공급</span>
                        </div>
                        <div class="menuSubtitle">
                            <span class="subtitleSpn">
                                It keeps your skin refreshing all day.
                            </span>
                        </div>
                        <div class="menuPrice">
                            <span class="priceSpn">&#8361; 50,000</span>
                        </div>
                        <div class="menuBtn">
                            <input type="button" class="reserveBtn" value="예약하기">
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
<%@ include file="/bottom.jsp" %>