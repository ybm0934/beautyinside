<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<%@ include file="/member/loginCheckNot.jsp" %>
<%
	Cookie[] cks = request.getCookies();
	
	String saveid = "N";
	String ckValue = "";
	
	if(cks != null) {
		for(int i = 0; i < cks.length; i++) {
			String ckName = cks[i].getName();
			ckValue = cks[i].getValue();
			
			if(ckName.equals("saveid")) {
				saveid = "Y";
				break;
			}else {
				ckValue = "";
			}// if
		}// for
	}// if
%>
<script>
	$(document).ready(function(){
		$('form[name=login]').submit(function(){
			if($('#id').val() == ''){
				return false;
			}else if($('#id').val() == 'admin') {
				alert('해당 계정으로 접근할 수 없습니다.');
				$('#id').val('');
				$('#pwd').val('');
				$('#id').focus();
				
				return false;
			}else if($('#pwd').val() == '') {
				return false;
			}else {
				$.ajax({
					url : '<%=request.getContextPath() %>/member/login_ok.jsp',
					type : 'POST',
					data : {
						id : $('#id').val(),
						pwd : $('#pwd').val(),
						saveid : $('#saveid').is(':checked')
						},
					datatype : 'JSON',
					success : function(data){
						$('#error_spn').html(data);
						},
					error : function(){
						alert('로그인 ajax 통신 실패!');
						}
				}); // ajax
				return false;
			}
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="css/login.css">
<div id="wrap">
	<div id="login_div">
	    <div class="block block1">
	        <div class="block1_title">
	            <span>&copy; BEAUTY INSIDE</span>
	        </div>
	        <div class="block1_div1">
	            <span>Nice to see you again</span>
	        </div>
	        <div class="block1_div2">
	            <span>WELCOME BACK</span>
	        </div>
	        <div class="block1_div3">
	            <p>
	                I sincerely welcome you to Beauty Inside. I sincerely welcome you to A. We hope you will receive high quality here.
	            </p>
	        </div>
	    </div>
	    <div class="block block2">
	        <form name="login" method="post" action="<%=request.getContextPath() %>/member/login_ok.jsp">
	            <div class="block2_title">
	                <h1>Login Account</h1>
	            </div>
	            <div class="block2_subtitle">
	                <p>Log in and you can use a variety of services. If you're not a member, join! We will provide you with the best service.</p>
	            </div>
	            <div class="text_div">
	                <input type="text" name="id" id="id" class="textbox" placeholder="ID" spellcheck="false" maxlength="20" required="required" value="<%=ckValue %>">
	            </div>
	            <div class="text_div">
	                <input type="password" name="pwd" id="pwd" class="textbox" placeholder="PASSWORD" spellcheck="false" maxlength="20" required="required">
	            </div>
	            <div class="error_div">
	            	<span id="error_spn"></span>
	            </div>
	            <div class="saveid_div">
	                <label for="saveid">
	                    <input type="checkbox" name="saveid" id="saveid" <%if(saveid.equals("Y")) { %> checked="checked" <% } %>>
	                    <span>아이디 저장하기</span>
	                </label>
	            </div>
	            <div class="btn_div">
	                <input type="submit" id="login_btn" class="btn" value="LOGIN">
	            </div>
	            <div class="forgot_div">
	            	<span class="forgot_spn1">아직 회원이 아니신가요?</span>
	                <span class="forgot_spn2">
	                	<a href="/member/clause.jsp">Sign up</a>
	                </span>
	            </div>
	        </form>
	    </div>
	</div>
</div>
<%@ include file="/bottom.jsp" %>