<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<%@ include file="/member/loginCheckNot.jsp" %>
<link rel="stylesheet" type="text/css" href="css/register.css">
<script>
	$(document).ready(function(){
		// 페이지 이동 감지 경고창
		var checkUnload = true;
	    $(window).on("beforeunload", function(){
	        if(checkUnload) return "";
	    });
	    
		//정규 표현식
		var reg_exp = /[^a-z0-9A-Z]/gi; // 영문 & 숫자만
		
		$("#id").keyup(function(e) {
			var input = $(this).val();
			
			// 영문 & 숫자 아닐 시 초기화
			if (!(e.keyCode >= 37 && e.keyCode <= 40)) {
				// 영문 & 숫자 아닐 시 에러
				if(reg_exp.test(input)) {
					$('#id_error').html('영문 및 숫자만 입력 가능합니다.');
					$(this).val('');
				}else {
					$(this).val(input.replace(reg_exp, ''));
				}
			}
			
			$('#idCheck').val('');
		});
		
		// 아이디 중복검사 유효성 검사 및 Ajax 통신
		$('#duplbtn').click(function(){
			var id = $('#id').val();
			
			if(reg_exp.test(id)) {
				$('#id_error').html('영문 및 숫자만 입력 가능합니다.');
				$('#id').val('');
				
				return;
			}else if(id.length < 1) {
				$('#id_error').html('아이디를 입력하세요.');
				$('#id').focus();
				
				return;
			}else if(id.length > 10){
				$('#id_error').html('아이디는 10글자까지 가능합니다.');
				$('#id').focus();
				
				return;
			}else {
				// 중복검사 Ajax 통신 구현
				$.ajax({
					url : '<%=request.getContextPath() %>/member/idCheck.jsp',
					type : 'POST',
					data : {
						id : id
					},
					datatype : 'JSON',
					success : function(data){
							$('#id_error').html(data);
						},
					error : function(){
						alert('통신 실패');
					}
				}); // ajax
			}
		});
		
		// 주소검색 새창 가운데 띄우기
		$('#addr_search_btn').click(function(){
			var _width = 450;
			var _height = 700;
			var _left = (window.screen.width / 2) - (_width / 2);
			var _top = (window.screen.height / 2) - (_height / 2);
			
			window.open('<%=request.getContextPath() %>/member/zipcode.jsp', '주소 검색', 'width = ' + _width + ', height = ' + _height + ', top = ' + _top + ', left = ' + _left);
		});
		
		// 정규 표현식
		var reg_exp = /[^a-z0-9A-Z]/gi; // 영문 & 숫자만
		
		// 값이 있을 경우 error 메세지 초기화
		$('#id').focusout(function(){
			if($(this).val().length > 0 && (typeof $('#idCheck').val() == 'undefined' || $('#idCheck').val() == '')) {
				$('#id_error').html('');
			}
		});
		
		$('#password').focusout(function(){
			if($(this).val().length > 0) {
				$('#password_error').html('');
			}
		});
		
		$('#password_ok').focusout(function(){
			if($(this).val().length > 0) {
				$('#password_ok_error').html('');
			}
		});
		
		$('#name').focusout(function(){
			if($(this).val().length > 0) {
				$('#name_error').html('');
			}
		});
		
		$('#birth_year').focusout(function(){
			if($(this).val().length > 0) {
				$('#birth_error').html('');
			}
		});
		
		$('#birth_monday').change(function(){
			if($(this).val().length > 0) {
				$('#birth_error').html('');
			}
		});
		
		$('#birth_day').focusout(function(){
			if($(this).val().length > 0) {
				$('#birth_error').html('');
			}
		});
		
		$('#gender').change(function(){
			if($(this).val().length > 0) {
				$('#gender_error').html('');
			}
		});
		
		$('#email').focusout(function(){
			if($(this).val().length > 0) {
				$('#email_error').html('');
			}
		});
		
		$('#tel2').focusout(function(){
			if($(this).val().length > 0) {
				$('#tel_error').html('');
			}
		});
		
		$(document).mousemove(function(){
			if($('#zipcode').val().length > 0) {
				$('#address_error').html('');
			}
		});
		
		// 생년 예외처리
		$('#birth_year').focusout(function(){
			if(isNaN($(this).val())){
				$('#birth_error').html('숫자만 입력 가능합니다.');
				$(this).val('');
				$(this).focus();
			}else {
				$('#birth_error').html('');
			}
		});
		
		// 생일 예외처리
		$('#birth_day').focusout(function(){
			if(isNaN($(this).val())){
				$('#birth_error').html('숫자만 입력 가능합니다.');
				$(this).val('');
				$(this).focus();
			}else {
				$('#birth_error').html('');
			}
		});
		
		// submit 전 유효성 검사
		$('#regbtn').click(function(){
			// 새로고침 경고 해제
			checkUnload = false;
			
			// 아이디 중복 확인
			var flag = $('#idCheck').val();
			
			// 생일 합치기
			var year = $('#birth_year').val();
			var monday = $('#birth_monday').val();
			var day = $('#birth_day').val();
			var birthday = year + '-' + monday + '-' + day;
			$('#birthday').val(birthday);
			
			// 전화번호 합치기
			var tel1 = $('#tel1').val();
			var tel2 = $('#tel2').val();
			var tel3 = tel2.substr(0, 4);
			var tel4 = tel2.substr(4);
			var tel = tel1 + '-' + tel3 + '-' + tel4;
			$('#tel').val(tel);
			
			if($('#id').val() == ''){
				$('#id').focus();
				$('#id_error').html('아이디를 입력하세요.');
				
				return false;
			}else if(typeof flag == 'undefined' || flag == 'true') {
				$('#id_error').html('아이디 중복 검사를 해주세요.');
				$('#id').focus();
				
				return false;
			}else if($('#password').val() == '') {
				$('#password').focus();
				$('#password_error').html('비밀번호를 입력하세요.');
				
				return false;
			}else if($('#password_ok').val() == ''){
				$('#password_ok').focus();
				$('#password_ok_error').html('비밀번호 확인을 입력하세요.');
				
				return false;
			}else if($('#password').val() != $('#password_ok').val()){
				$('#password_ok').focus();
				$('#password_ok_error').html('비밀번호를 잘못 입력하셨습니다.');
				
				return false;
			}else if($('#name').val() == ''){
				$('#name').focus();
				$('#name_error').html('이름을 입력하세요.');
				
				return false;
			}else if($('#name').val() == '관리자'){
				$('#name').focus();
				$('#name_error').html('해당 이름은 사용할 수 없습니다.');
				
				return false;
			}else if(year == '') {
				$('#birth_year').focus();
				$('#birth_error').html('년을 입력하세요.');
				
				return false;
			}else if(monday == '') {
				$('#birth_monday').focus();
				$('#birth_error').html('월을 입력하세요.');
				
				return false;
			}else if(day == '') {
				$('#birth_day').focus();
				$('#birth_error').html('일을 입력하세요.');
				
				return false;
			}else if($('#gender').val() == '') {
				$('#gender').focus();
				$('#gender_error').html('성별을 입력하세요.');
				
				return false;
			}else if($('#email').val() == '') {
				$('#email').focus();
				$('#email_error').html('이메일을 입력하세요.');
				
				return false;
			}else if($('#tel2').val() == ''){
				$('#tel2').focus();
				$('#tel_error').html('전화번호를 입력하세요.');
				
				return false;
			}else if($('#zipcode').val() == ''){
				$('#zipcode').focus();
				$('#address_error').html('주소를 입력하세요.');
				
				return false;
			}
			
		});
	});
</script>
</head>
<!--
	oncontextmenu='return false': 우클릭 방지
	onselectstart='return false': 블록선택 방지
	ondragstart='return false': 드래그 방지
-->
<div id="wrap">
	<div id="register_div">
		<form name="register" method="post" action="<%=request.getContextPath()%>/member/register_ok.jsp">
		    <div id="logo_div">
		        <h1>회원가입</h1>
		    </div>
		    <div id="id_div">
		        <h3>아이디</h3>
		        <div class="box">
		            <input type="text" id="id" name="id" class="textbox" placeholder="중복검사를 누르세요." maxlength="20">
		            <input type="button" id="duplbtn" class="btn" value="중복검사">
		        </div>
		        <span id="id_error" class="error"></span>
		    </div>
		    <div id="password_div">
		        <h3>비밀번호</h3>
		        <div class="box">
		            <input type="password" name="password" id="password" class="textbox" maxlength="15" placeholder="비밀번호 입력">
		        </div>
		        <span id="password_error" class="error"></span>
		    </div>
		    <div id="password_ok_div">
		        <h3>비밀번호 확인</h3>
		        <div class="box">
		            <input type="password" name="password_ok" id="password_ok" class="textbox" maxlength="15" placeholder="비밀번호 입력">
		        </div>
		        <span id="password_ok_error" class="error"></span>
		    </div>
		    <div id="name_div">
		        <h3>이름</h3>
		        <div class="box">
		            <input type="text" name="name" id="name" class="textbox" maxlength="7" placeholder="이름 입력">
		        </div>
		        <span id="name_error" class="error"></span>
		    </div>
		    <div id="birthday_div">
		        <h3>생년월일</h3>
		        <span class="birth_box">
		            <input type="text" id="birth_year" class="birth_textbox" placeholder="년(4자)" maxlength="4">
		        </span>
		        <span class="birth_box">
		            <select id="birth_monday">
		                <option value="">월</option>
		                <option value="1">1</option>
		                <option value="2">2</option>
		                <option value="3">3</option>
		                <option value="4">4</option>
		                <option value="5">5</option>
		                <option value="6">6</option>
		                <option value="7">7</option>
		                <option value="8">8</option>
		                <option value="9">9</option>
		                <option value="10">10</option>
		                <option value="11">11</option>
		                <option value="12">12</option>
		            </select>
		        </span>
		        <span class="birth_box">
		            <input type="text" id="birth_day" class="birth_textbox" placeholder="일" maxlength="2">
		        </span>
		        <input type="hidden" name="birthday" id="birthday">
		        <span id="birth_error" class="error"></span>
		    </div>
		    <div id="gender_div">
		        <h3>성별</h3>
		        <div>
		            <select id="gender" name="gender">
		                <option value="">성별</option>
		                <option value="남자">남자</option>
		                <option value="여자">여자</option>
		            </select>
		        </div>
		        <span id="gender_error" class="error"></span>
		    </div>
		    <div id="email_div">
		        <h3>이메일</h3>
		        <div class="box">
		            <input type="text" name="email" id="email" class="textbox" placeholder="이메일 입력" maxlength="20">
		        </div>
		        <span id="email_error" class="error"></span>
		    </div>
		    <div id="tel_div">
		        <h3>전화번호</h3>
		        <span class="tel_box1">
		            <select id="tel1" name="tel1">
		                <option value="010">010</option>
		                <option value="011">011</option>
		                <option value="012">012</option>
		                <option value="013">013</option>
		                <option value="014">014</option>
		                <option value="015">015</option>
		                <option value="016">016</option>
		                <option value="017">017</option>
		                <option value="018">018</option>
		                <option value="019">019</option>
		            </select>
		        </span>
		        <span class="tel_box2">
		            <input type="text" name="tel2" id="tel2" class="textbox" placeholder="전화번호 입력" maxlength="8">
		        </span>
		        <input type="hidden" name="tel" id="tel"> 
		        <span id="tel_error" class="error"></span>
		    </div>
		    <div id="address_div">
		        <h3>주소</h3>
		        <div class="box">
		            <input type="text" name="zipcode" id="zipcode" class="textbox" placeholder="주소찾기를 누르세요." readonly="readonly">
		            <input type="button" id="addr_search_btn" class="btn" value="주소찾기">
		        </div>
		        <div class="box">
		            <input type="text" name="address1" id="address1" class="textbox" readonly="readonly">
		        </div>
		        <div class="box">
		            <input type="text" name="address2" id="address2" class="textbox" maxlength="50">
		        </div>
		        <span id="address_error" class="error"></span>
		    </div>
		    <div id="button_div">
		        <input type="submit" id="regbtn" class="btn" value="가입하기">
		    </div>
		</form>
	</div>
</div>
<%@ include file="/bottom.jsp" %>