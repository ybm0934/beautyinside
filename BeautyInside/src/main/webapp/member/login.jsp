<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<%@ include file="/member/loginCheck.jsp" %>
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
	                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
	                The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.
	            </p>
	        </div>
	    </div>
	    <div class="block block2">
	        <form name="login" method="post" action="<%=request.getContextPath() %>/member/login_ok.jsp">
	            <div class="block2_title">
	                <h1>Login Account</h1>
	            </div>
	            <div class="block2_subtitle">
	                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.</p>
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
	                <span class="forgot_spn">비밀번호 찾기</span>
	            </div>
	        </form>
	    </div>
	</div>
</div>
<%@ include file="/bottom.jsp" %>