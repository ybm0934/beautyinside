<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주소검색</title>
    <link rel="stylesheet" type="text/css" href="css/zipcode.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>

    </script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <form name="zipcode" method="post" action="">
            <div id="search_div">
                <input type="text" name="search" id="search" placeholder="주소를 입력하세요." spellcheck="false">
                <span class="img_spn" id="cancel_spn">
                    <img src="../img/ico/cancel.png" alt="검색창 지우기">
                </span>
                <span class="img_spn" id="search_spn">
                    <img src="../img/ico/search.png" alt="검색하기">
                </span>
            </div>
            <div id="address_div_group">
                <div id="address_main">
                    <p class="tip">tip</p>
                    <p>아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.</p>
                    <p>도로명 + 건물번호</p>
                    <p class="ex_blue">예) 판교역로 235,  제주 첨단로 242</p>
                    <p>지역명(동/리) + 번지</p>
                    <p class="ex_blue">예) 삼평동 681,  제주 영평동 2181</p>
                    <p>지역명(동/리) + 건물명(아파트명)</p>
                    <p class="ex_blue">예) 분당 주공,  연수동 주공3차</p>
                    <p>사서함명 + 번호</p>
                    <p class="ex_blue">예) 분당우체국사서함 1~100</p>
                </div>
                
                <% %>
            	<!-- 반복문 시작 -->
                <div class="address_div">
                    <div>
                        <span class="zipcode">12345</span>
                    </div>
                    <div>
                        <span class="street">도로명</span>
                        <span class="address_spn">경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</span>
                    </div>
                    <div>
                        <span class="street">지 번</span>
                        <span class="address_spn">경기 성남시 분당구 삼평동</span>
                    </div>
                </div>
                <div class="address_div">
                    <div>
                        <span class="zipcode">12345</span>
                    </div>
                    <div>
                        <span class="street">도로명</span>
                        <span class="address_spn">경기 성남시 분당구 판교역로 235 (에이치스퀘어 엔동)</span>
                    </div>
                    <div>
                        <span class="street">지 번</span>
                        <span class="address_spn">경기 성남시 분당구 삼평동</span>
                    </div>
                </div>
                <div class="paging_div">
                    <span>1 / 1</span>
                </div>
            </div>
            <% %>

            <div id="footer">
                <span id="power">Powered by </span>
                <span>Beauty Inside.</span>
            </div>
        </form>
    </div>
</body>
</html>