<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<%@ include file="/member/loginCheckNot.jsp" %>
<link rel="stylesheet" type="text/css" href="/member/css/clause.css">
<script>
	function agree() {
		var check = document.getElementById('agreeCheck').checked;
		if(check == false) {
			alert('약관에 동의 하셔야 합니다.');
			return false;
		}else {
			location.href = '/member/register.jsp';
		}
	}
	
	function disagree() {
		location.href = '/main.jsp';
	}
</script>
<div id="wrap">
    <div id="clauseDiv">
        <div class="contentDiv">
            <div class="subjectDiv">
                <h1 class="subject">이용약관 동의 (필수)</h1>
<textarea class="content" spellcheck="false">
여러분을 환영합니다.
Beauty Inside Pure 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 Beauty Inside Pure 서비스의 이용과 관련하여 Beauty Inside Pure 서비스를 제공하는 Beauty Inside Pure 주식회사(이하 ‘Beauty Inside Pure’)와 이를 이용하는 Beauty Inside Pure 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 Beauty Inside Pure 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
1. “사이버몰”이란 회사가 상품 또는 용역 등(일정한 시설을 이용하거나 용역을 제공받을 수 있는 권리를 포함하며, 이하 “상품 등”)을 회원에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 상품 등을 거래할 수 있도록 설정한 가상의 영업장(http://www.beauty.com 등 회사가 운영하는 웹사이트 및 모바일 웹, 앱 등을 모두 포함)을 의미합니다.
2. “회원”이라 함은 사이버몰에 회원등록을 한 자로서, 계속적으로 사이버몰에서 제공하는 서비스를 이용할 수 있는 자를 말하며, 회사의 별도 기준에 따라 구분되는 “일반 회원”과 “Beauty Inside Pure 비즈 회원”을 통칭합니다.
</textarea>
            </div>
            <div class="subjectDiv">
                <h1 class="subject">개인정보 수집 및 이용에 대한 안내 (필수)</h1>
<textarea class="content" spellcheck="false">
여러분을 환영합니다.
Beauty Inside Pure 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 Beauty Inside Pure 서비스의 이용과 관련하여 Beauty Inside Pure 서비스를 제공하는 Beauty Inside Pure 주식회사(이하 ‘Beauty Inside Pure’)와 이를 이용하는 Beauty Inside Pure 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 Beauty Inside Pure 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
1. “사이버몰”이란 회사가 상품 또는 용역 등(일정한 시설을 이용하거나 용역을 제공받을 수 있는 권리를 포함하며, 이하 “상품 등”)을 회원에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 상품 등을 거래할 수 있도록 설정한 가상의 영업장(http://www.beauty.com 등 회사가 운영하는 웹사이트 및 모바일 웹, 앱 등을 모두 포함)을 의미합니다.
2. “회원”이라 함은 사이버몰에 회원등록을 한 자로서, 계속적으로 사이버몰에서 제공하는 서비스를 이용할 수 있는 자를 말하며, 회사의 별도 기준에 따라 구분되는 “일반 회원”과 “Beauty Inside Pure 비즈 회원”을 통칭합니다.
</textarea>
            </div>
            <div class="subjectDiv">
                <h1 class="subject">위치정보 이용약관 동의 (필수)</h1>
<textarea class="content" spellcheck="false">
여러분을 환영합니다.
Beauty Inside Pure 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 Beauty Inside Pure 서비스의 이용과 관련하여 Beauty Inside Pure 서비스를 제공하는 Beauty Inside Pure 주식회사(이하 ‘Beauty Inside Pure’)와 이를 이용하는 Beauty Inside Pure 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 Beauty Inside Pure 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
1. “사이버몰”이란 회사가 상품 또는 용역 등(일정한 시설을 이용하거나 용역을 제공받을 수 있는 권리를 포함하며, 이하 “상품 등”)을 회원에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 상품 등을 거래할 수 있도록 설정한 가상의 영업장(http://www..com 등 회사가 운영하는 웹사이트 및 모바일 웹, 앱 등을 모두 포함)을 의미합니다.
2. “회원”이라 함은 사이버몰에 회원등록을 한 자로서, 계속적으로 사이버몰에서 제공하는 서비스를 이용할 수 있는 자를 말하며, 회사의 별도 기준에 따라 구분되는 “일반 회원”과 “Beauty Inside Pure 비즈 회원”을 통칭합니다.
</textarea>
            </div>
            <div class="subjectDiv">
                <h1 class="subject">
					<input type="checkbox" id="agreeCheck">
					<label for="agreeCheck">
						이용약관, 개인정보 수집 및 이용, 위치정보 이용약관에 모두 동의합니다.
					</label>
                </h1>
            </div>
        </div>
    </div>
    <div class="btnDiv">
        <input type="button" id="disagree" class="btn" value="비동의" onclick="disagree();">
        <input type="button" id="agree" class="btn" value="동의" onclick="agree();">
    </div>
</div>
<%@ include file="/bottom.jsp" %>