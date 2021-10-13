<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/chat/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String admin = request.getParameter("admin");
	String select = (admin == null) ? "관리자" : name;
	System.out.println("###########name : " + name);
	
	long today = System.currentTimeMillis();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>:: BEAUTY INSIDE 채팅 ::</title>
    <link rel="stylesheet" type="text/css" href="/chat/css/chat.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
	    function chatList() {
			$(document).ready(function(){
				$.ajax({
					url : '<%=request.getContextPath() %>/chat/chatList.jsp',
					type : 'POST',
					datatype : 'JSON',
					data : {
						id : '<%=id %>',
						name : '<%=name %>',
						admin: '<%=admin %>'
					},
					success : function(data) {
						$('#listDiv').html(data);
					},
					error : function() {
						alert('채팅 리스트 불러오기 실패!');
						self.close();
					}
				}); // ajax
			});
		} // chatList
		
		setInterval(function() {
			chatList();
		}, 1000);
	
    	$(document).ready(function(){
    		$('#writeArea').focus();
    		
    		// 아무 것도 입력하지 않았을 시 전송 버튼 비활성화
    		if($('#writeArea').val() == '') {
    			$('#sendBtn').attr('disabled', 'disabled');
    		}
    		
    		// 입력 시 활성화
    		$('#writeArea').keyup(function(e){
	    		if($.trim($(this).val()).length == 0) {
	    			$('#sendBtn').attr('disabled', 'disabled');
	    		}else {
	    			$('#sendBtn').removeAttr('disabled');
	    		}
    		});
    		
    		// 전송 버튼 클릭 시 데이터 전송
    		$('#sendBtn').click(function(){
   				$('#writeArea').val($.trim($('#writeArea').val()));
    			chatSend();
    		});
    		
    		// 엔터 누르면 전송
       		$('#writeArea').keydown(function(e){
       			if(!(e.shiftKey && e.keyCode == 13) && e.keyCode == 13) {
	       			if($.trim($(this).val()).length == 0) {
	       				$(this).val('');
	       				return false;
       				}else {
       					$(this).val($.trim($(this).val()));
	       				chatSend();
	       			}
       			}
       		});
    		
    		function chatSend() {
    			$.ajax({
    				url : '<%=request.getContextPath() %>/chat/chatSend_ok.jsp',
    				type : 'POST',
    				datatype : 'JSON',
    				data : {
    					id : '<%=id %>',
    					name : '<%=name %>',
    					admin : '<%=admin %>',
    					content : $('#writeArea').val()
    				},
    				success : function(data) {
    					$('#writeArea').val('');
    					$('#writeArea').focus();
    					chatList();
    					$("#listDiv").scrollTop($("#listDiv")[0].scrollHeight); // 스크롤 맨 아래로
    				},
    				error : function() {
    					alert('채팅 전송 실패!');
    					self.close();
    				}
    			}); // ajax
    		}
    	});
    </script>
</head>
<body>
<div id="wrap">
    <div class="topDiv">
        <span class="targetSpn"><%=select %>님과의 대화</span>
    </div>
    <div class="topDiv">
        <span class="todaySpn"><%=sdf.format(today) %></span>
    </div>
    
    <div class="listDiv" id="listDiv"></div>
    
    <div id="sendDiv">
        <div id="textareaDiv">
            <textarea name="writeArea" id="writeArea" spellcheck="false"></textarea>
        </div>
        <div id="buttonDiv">
            <input type="button" id="sendBtn" value="전송">
        </div>
    </div>
</div>
</body>
</html>