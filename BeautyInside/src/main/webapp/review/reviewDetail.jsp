<%@page import="com.beauty.review.CommentDAO"%>
<%@page import="com.beauty.review.CommentDTO"%>
<%@page import="com.beauty.review.ReviewDTO"%>
<%@page import="com.beauty.review.ReviewDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<%
	String no = request.getParameter("no");

	ReviewDAO reviewDao = new ReviewDAO();
	ReviewDTO reviewDto = new ReviewDTO();
	reviewDto = reviewDao.reviewByNo(Integer.parseInt(no));
	if(reviewDto == null) response.sendRedirect("/review/reviewList.jsp");
	
	String fileName = reviewDto.getFileName();
	String path = request.getContextPath() + "/review/upload/" + fileName;
	System.out.println("path = " + path);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd. HH:mm:ss");
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/review/css/reviewDetail.css">
<script>
	// 로그인 여부 체크
	function loginCheck() {
		if('<%=userid %>' == null) {
			location.href = '/member/loginCheck.jsp';
			
			return false;
		}
	} // loginCheck
	
	//댓글 리스트
	function commentList() {
		$.ajax({
			url : '<%=request.getContextPath() %>/review/commentList.jsp',
			type : 'POST',
			datatype : 'JSON',
			data : {
				no : <%=no %>,
				userid : '<%=userid %>',
				name : '<%=memberDto.getName() %>'
			},
			success : function(data) {
				$('#reply_div').html(data);
			},
			error : function() {
				alert('댓글 리스트 불러오기 실패');
			}
		});
	} // commentList
	
    $(document).ready(function(){
    	commentList();
    	
    	// 목록으로 이동
    	$('#list_btn').click(function(){
    		location.href = '<%=request.getContextPath() %>/review/reviewList.jsp';
    	});
    	
    	// 상세보기 글 수정
    	$('#update_btn').click(function(){
    		location.href = '<%=request.getContextPath() %>/review/reviewEdit.jsp?no=' + <%=no %>;
    	});
    	
    	// 상세보기 글 삭제
    	$('#cancel_btn').click(function(){
    		location.href = '<%=request.getContextPath() %>/review/reviewDelete.jsp?no=' + <%=no %>;
    	});
	    	
   		// 댓글 등록 Ajax
   		// 자바스크립트를 이용해 동적으로 추가된 요소에 이벤트 핸들러를 만들어주면 동작하지 않는다.
   		// 이를 해결하기 위해서는 on 메서드를 사용해 함수를 바인딩 처리 해주어야 한다.
    	$(document).on('click', '#reply_regit_btn', function(){
   			if($('#comment').val() == '') {
   				alert('댓글을 입력해주세요.');
   				$('#comment').focus();
   			
   				return false;
   			}else {
   				$.ajax({
   		           url : '<%=request.getContextPath() %>/review/commentWrite_ok.jsp',
   		           type : 'POST',
   		           data : {
   		        	   ogNo : <%=no %>,
   		        	   userid : '<%=userid %>',
   		        	   name : '<%=memberDto.getName() %>',
   		        	   content : $('#comment').val()
   		           },
   		           datatype : 'JSON',
   		           success : function(data){
   		        		$('#wrap').after(data);
   		        		commentList();
   		           },
   		           error : function(){
   		               alert('댓글 등록 실패');
   		           }
   		    	});
   			}
		}); // 댓글 등록 Ajax
    });// ready
    
    // 창 중복 실행 방지 변수
	var flag = false;
    
	// 대댓글 창 띄우고 쓰기
	function rrWrite(no, groupNo, sortNo, name) {
		loginCheck();
		
		$(document).ready(function() {
			var recomment = '';
		    recomment += '<tr id="reCom'+ no +'">';
		    recomment +=    '<td>';
		    recomment +=    	'<div>';
		    recomment +=        	'<textarea name="rere_textarea" class="re_textarea" placeholder="' + name + '님께 답글쓰기" spellcheck="false"></textarea>';
		    recomment +=    	'</div>';
		    recomment +=    	'<div class="reply_regBtn_div">';
		    recomment +=       	 	'<input type="button" class="re_btn rere_cancel_btn" id="reCancel" value="취소">&nbsp;';
		    recomment +=        	'<input type="button" class="re_btn regit_btn" id="rere_regit_btn" value="등록">';
		    recomment +=    	'</div>';
		    recomment +=    '</td>';
		    recomment += '</tr>';
		
		    if(flag == false) {
		        $('#re' + no).after(recomment);
		    }else {
		        return false;
		    }
		    
		    flag = true;
		    $('#reCancel').click(function(){
		    	$('#reCom' + no).remove();
		        flag = false;
		    });
		    
		    $('#rere_regit_btn').click(function() {
		    	if($('textarea[name=rere_textarea]').val() == '') {
		    		alert('댓글을 입력해주세요.');
		    		$('textarea[name=rere_textarea]').focus();
		    		
		    		return false;
		    	}else {
		    		$.ajax({
		        		url : '<%=request.getContextPath() %>/review/reCommentWrite_ok.jsp',
		        		type : 'POST',
		        		datatype : 'JSON',
		        		data : {
		        			ogNo : <%=no %>,
		        			groupNo : groupNo,
		        			sortNo : sortNo,
		        			userid : '<%=userid %>',
		        			name : '<%=memberDto.getName() %>',
		        			target : name,
		        			content : $('textarea[name=rere_textarea]').val()
		        		},
		        		success : function(data) {
		                   	$('#wrap').after(data);
		                   	flag = false;
		                   	commentList();
		        		},
		        		error : function() {
		        			alert('대댓글 등록 실패!');
		        		}
		        	}); // ajax
		    	} // if
		    }); // click
		}); // ready
	}// rrWrite
	    	
   	// 댓글 수정
   	function rrEdit(no, content) {
   		$(document).ready(function(){
   			loginCheck();
   			
   			$(document).ready(function() {
   				var recomment = '';
   			    recomment += '<tr id="reCom'+ no +'">';
   			    recomment +=    '<td>';
   			    recomment +=    	'<div>';
   			    recomment +=        	'<textarea name="rere_textarea" class="re_textarea" spellcheck="false">' + content + '</textarea>';
   			    recomment +=    	'</div>';
   			    recomment +=    	'<div class="reply_regBtn_div">';
   			    recomment +=       	 	'<input type="button" class="re_btn rere_cancel_btn" id="reCancel" value="취소">&nbsp;';
   			    recomment +=        	'<input type="button" class="re_btn regit_btn" id="rere_edit_btn" value="완료">';
   			    recomment +=    	'</div>';
   			    recomment +=    '</td>';
   			    recomment += '</tr>';
   			
   			    if(flag == false) {
   			        $('#re' + no).hide();
   			        $('#re' + no).after(recomment);
   			    }else {
   			        return false;
   			    }
   			    
   			    flag = true;
   			    $('#reCancel').click(function() {
   			    	$('#reCom' + no).remove();
   			    	$('#re' + no).show();
   			        flag = false;
   			    });
   			    
   			    $('#rere_edit_btn').click(function() {
   			    	if($('textarea[name=rere_textarea]').val() == '') {
   			    		alert('댓글을 입력해주세요.');
   			    		$('textarea[name=rere_textarea]').focus();
   			    		
   			    		return false;
   			    	}else {
   			    		$.ajax({
   			        		url : '<%=request.getContextPath() %>/review/commentEdit_ok.jsp',
   			        		type : 'POST',
   			        		datatype : 'JSON',
   			        		data : {
   			        			no : no,
   			        			content : $('textarea[name=rere_textarea]').val()
   			        		},
   			        		success : function(data) {
   			        			$('#wrap').after(data);
   			                   	flag = false;
   			                   	commentList();
   			        		},
   			        		error : function() {
   			        			alert('대댓글 수정 실패!');
   			        		}
   			        	}); // ajax
   			    	} // if
   			    }); // click
   			}); // ready
   		});
   	}// rrEdit
   	
   	// 댓글 삭제
   	function rrDelete(no, sortNo) {
   		loginCheck();
   		
   		$(document).ready(function() {
   			if(confirm('댓글을 삭제하시겠습니까?')) {
   				$.ajax({
	        		url : '<%=request.getContextPath() %>/review/commentDelete_ok.jsp',
	        		type : 'POST',
	        		datatype : 'JSON',
	        		data : {
	        			no : no,
	        			sortNo : sortNo
	        		},
	        		success : function(data) {
	                   	commentList();
	        		},
	        		error : function() {
	        			alert('대댓글 삭제 실패!');
	        		}
	        	}); // ajax
   			}
		}); // ready
   	}// rrDelete
</script>
<div id="wrap">
    <div id="reviewDetail_div">
		<table id="write_table">
		    <caption>글 상세보기 테이블</caption>
		    <thead></thead>
		    <tfoot>
		        <tr>
		            <td colspan="3">
		                <input type="button" class="btn" id="list_btn" value="목록">
		                <%if(reviewDto.getId().equals(userid)) { %>
		                <input type="button" class="btn" id="update_btn" value="수정">
		                <input type="button" class="btn" id="cancel_btn" value="삭제">
		                <%} %>
		            </td>
		        </tr>
		    </tfoot>
		    <tbody>
		        <tr>
		            <td colspan="2" id="title_td">
		            	<span id="title_tdSpn"><%=reviewDto.getTitle() %></span>
		            </td>
		        </tr>
		        <tr>
		            <td>
		            	<span class="icoSpn">
		            		<img src="/img/ico/userico.png" alt="사람 아이콘" style="width: 20px;">
		            	</span>
		            	<%=reviewDto.getName() %>
		            	<span class="icoSpn icoEye">
		            		<img src="/img/ico/eye.png" alt="눈 아이콘" style="width: 20px;">
		            	</span>
		            	<%=reviewDto.getCount() %>
		            </td>
		            <td style="text-align: right;">
		            	<span class="icoSpn">
		            		<img src="/img/ico/clock.png" alt="시계 아이콘" style="width: 20px;">
		            	</span>
		            	<%=sdf.format(reviewDto.getRegdate()) %>
		            </td>
		        </tr>
		        <tr>
		            <td colspan="2">
			            <div id="content">
			            	<%if(reviewDto.getFileName() != null){ %>
			            	<div class="detailImg_div">
			            		<img src="<%=path %>" class="detailImg">
			            	</div>
			            	<%} %>
			            	<div class="contentTb_div"><%=reviewDto.getContent() %></div>
			            </div>
		            </td>
		        </tr>
		    </tbody>
		</table>
		<div id="reply_div"></div>
    </div>
</div>
<%@ include file="/bottom.jsp" %>