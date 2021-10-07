<%@page import="com.beauty.review.CommentDAO"%>
<%@page import="com.beauty.review.CommentDTO"%>
<%@page import="com.beauty.review.ReviewDTO"%>
<%@page import="com.beauty.review.ReviewDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<%
	String no = request.getParameter("no");

	ReviewDAO reviewDao = new ReviewDAO();
	ReviewDTO reviewDto = new ReviewDTO();
	reviewDto = reviewDao.reviewByNo(Integer.parseInt(no), userid);
	
	if(reviewDto == null) {
		response.sendRedirect("/review/reviewList.jsp");
	}
	
	String fileName = reviewDto.getFileName();
	String path = request.getContextPath() + "/review/upload/" + fileName;
	System.out.println("path = " + path);
	
	CommentDAO comDao = new CommentDAO();
	ArrayList<CommentDTO> comList = comDao.commentList(Integer.parseInt(no));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd. HH:mm:ss");
	String placeholder = "아름다운 댓글 문화를 만들어 갑시다.";
%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/review/css/reviewDetail.css">
    <script>
	    $(document).ready(function(){
	    	$('#list_btn').click(function(){
	    		location.href = '<%=request.getContextPath() %>/review/reviewList.jsp';
	    	});
	    	
	        // 댓글 등록 Ajax
	        $('#reply_regit_btn').click(function(){
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
		            	   id : '<%=userid %>',
		            	   name : '<%=memberDto.getName() %>',
		            	   content : $('#comment').val()
		               },
		               datatype : 'JSON',
		               success : function(data){
		                   $('#reply_table tbody').html(data);
		                   $('#comment').val('');
		               },
		               error : function(){
		                   alert('댓글 등록 실패');
		               }
	            	});
	        	}
	        }); // 댓글 등록 Ajax
	    });
	    
	    // 대댓글 창 띄우기
        function rerefunc(num) {
        	$(document).ready(function(){
        		alert(num);
        		
	        	var flag = false;
	        	
	        	var recomment = '';
	            recomment += '<tr>';
	            recomment +=    '<td class="reply_trtd">';
	            recomment +=    	'<div class="reply_txtarea_div">';
	            recomment +=        	'<textarea class="re_textarea" id="write_rere_textarea" placeholder="~님께 답글쓰기" spellcheck="false"></textarea>';
	            recomment +=    	'</div>';
	            recomment +=    	'<div class="reply_regBtn_div">';
	            recomment +=       	 	'<input type="button" class="re_btn" id="rere_cancel_btn" value="취소">&nbsp;';
	            recomment +=        	'<input type="button" class="re_btn regit_btn" id="rere_regit_btn" value="등록">';
	            recomment +=    	'</div>';
	            recomment +=    '</td>';
	            recomment += '</tr>';
	
	            if(flag == false) {
	                $('tr').has('#number').after(recomment);
	            }else {
	                return false;
	            }
	            
	            flag = true;
	        
		        $('#rere_cancel_btn').click(function(){
		            $('tr').has('#number').siblings('.rr_tr').remove();
		            flag = false;
		        });
        	});
        }
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
		            <td colspan="2" id="title_td"><%=reviewDto.getTitle() %></td>
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
		<div id="reply_div">
			<h3>댓글 <span style="color:red;"><%=comList.size() %></span>개</h3>
	        <table id="reply_table">
				<caption>댓글 테이블</caption>
				<thead></thead>
				<tfoot>
	                <tr>
	                    <td style="text-align: right;">
	                    	<div class="reply_txtarea_div">
	                        	<textarea name="comment" id="comment" class="re_textarea" placeholder="<%=placeholder %>" spellcheck="false"></textarea>
	                    	</div>
	                    	<div class="reply_regBtn_div">
	                        	<input type="button" class="re_btn regit_btn" id="reply_regit_btn" value="등록">
	                    	</div>
	                    </td>
	                </tr>
				</tfoot>
				<tbody>
					<%
					if(comList != null) {
						for(int i = 0; i < comList.size(); i++) {
							CommentDTO comDto = comList.get(i);
							String dtoCon = comDto.getContent().replace("\n", "<br>");
					%>
					<tr>
						<td class="reply_trtd">
							<span class="reply_imgSpn">
								<img src="/img/ico/bubbleChat.png" alt="댓글 이미지">
							</span>
							<span class="reply_nameSpn"><%=comDto.getName() %></span>
							<span class="reply_dateSpn"><%=sdf.format(comDto.getRegdate()) %></span>
						</td>
					</tr>
					<tr>
					    <td class="reply_trtd_2">
					        <span class="comment"><%=dtoCon %></span>
					        <div class="replrepl_div">
								<a id="re<%=comDto.getOgNo() %>" class="re_spn" onclick="rerefunc('<%=comDto.getOgNo() %>');">답글쓰기</a>
					        </div>
					    </td>
					</tr>
					<%
						}
					}
					%>
				</tbody>
			</table>
		</div>
    </div>
</div>
<%@ include file="/bottom.jsp" %>