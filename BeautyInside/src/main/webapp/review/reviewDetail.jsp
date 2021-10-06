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
	
	String fileName = reviewDto.getFileName();
	
	CommentDAO comDao = new CommentDAO();
	
	ArrayList<CommentDTO> list = comDao.commentList();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd. HH:mm:ss");
%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/review/css/reviewDetail.css">
    <script>
	    $(document).ready(function(){
	    	$('#list_btn').click(function(){
	    		location.href = '<%=request.getContextPath() %>/board/list.jsp';
	    	});
	    	
	        // 댓글 등록 Ajax
	        $('#reply_regit_btn').click(function(){
	            $.ajax({
	               url : '<%=request.getContextPath() %>/review/commentWrite_ok.jsp',
	               type : 'POST',
	               data : {
	            	   ogNo : <%=no %>,
	            	   comment : $('#comment').val()
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
	
	        }) // 댓글 등록 Ajax
	
	        // 대댓글 창 띄우기
	        var flag = false;
	
	        $('').click(function(){
	            var recomment = '';
	                recomment += '<tr class="rr_tr">';
	                recomment +=    '<th>닉네임</th>';
	                recomment +=    '<td>';
	                recomment +=        '<input type="text" name="name" class="textbox" id="name" placeholder="닉네임 입력" spellcheck="false">';
	                recomment +=    '</td>';
	                recomment +=    '<th>비밀번호</th>';
	                recomment +=    '<td>';
	                recomment +=        '<input type="password" name="pwd" class="textbox" id="pwd" placeholder="비밀번호 입력">';
	                recomment +=    '</td>';
	                recomment += '</tr>';
	                recomment += '<tr class="underline_tr rr_tr">';
	                recomment +=    '<td colspan="4" style="text-align: right;">';
	                recomment +=        '<textarea class="re_textarea" id="write_rere_textarea" placeholder="~님께 답글쓰기" spellcheck="false"></textarea>';
	                recomment +=        '<br><br>';
	                recomment +=        '<input type="button" class="re_btn" id="rere_cancel_btn" value="취소">&nbsp;';
	                recomment +=        '<input type="button" class="re_btn regit_btn" id="rere_regit_btn" value="등록">';
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
	        }); // 대댓글 창 띄우기
	    });
	</script>
</head>
    <div id="wrap">
		<h1>글 상세보기</h1>
		<table id="write_table">
		    <caption>글 상세보기 테이블</caption>
		    <thead></thead>
		    <tfoot>
		        <tr>
		            <td colspan="4">
		                <input type="button" class="btn" id="list_btn" value="목록">
		                <input type="button" class="btn" id="reWrite_btn" value="답변쓰기">
		                <input type="submit" class="btn" id="write_btn" value="수정하기">
		                <input type="button" class="btn" id="cancel_btn" value="삭제하기">
		            </td>
		        </tr>
		    </tfoot>
		    <tbody>
		        <tr>
		            <td colspan="4" id="title_td"><%=reviewDto.getTitle() %></td>
		        </tr>
		        <tr>
		            <th>닉네임</th>
		            <td><%=reviewDto.getName() %></td>
		            <th>조회수</th>
		            <td><%=reviewDto.getCount() %></td>
		        </tr>
		        <tr>
		            <th>첨부파일</th>
		            <td colspan="3">
		            	<a href="#"><% %></a>
		            </td>
		        </tr>
		        <tr>
		            <td colspan="4">
		            	<div id="content"><%=reviewDto.getContent() %></div>
		            </td>
		        </tr>
		    </tbody>
		</table>
		<h3>댓글 9</h3>
        <table id="reply_table">
			<caption>댓글 테이블</caption>
			<thead></thead>
			<tfoot>
                <tr>
                    <th>닉네임</th>
                    <td>
                        <input type="text" name="name" class="textbox" id="name" placeholder="닉네임 입력" spellcheck="false">
                    </td>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" name="pwd" class="textbox" id="pwd" placeholder="비밀번호 입력">
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: right;">
                        <textarea name="comment" class="re_textarea" id="comment" placeholder="댓글을 입력해주세요." spellcheck="false"></textarea>
                        <br><br>
                        <input type="button" class="re_btn regit_btn" id="reply_regit_btn" value="등록">
                    </td>
                </tr>
			</tfoot>
			<tbody>
			<%
				if(list != null) {
					for(int i = 0; i < list.size(); i++) {
						CommentDTO comDto = list.get(i);
			%>
				<tr class="re_tbody_first_tr">
					<th style="text-align: left;"><%=comDto.getName() %></th>
					<td colspan="3" class="re_tbody_first_tr_td"><%=sdf.format(comDto.getRegdate()) %></td>
				</tr>
				<tr class="re_tbody_second_tr">
				    <td colspan="4">
				        <span class="comment"><%=comDto.getContent() %></span>
						<br><br>
						<span class="re_spn" id="re<%=comDto.getOgNo() %>" onclick="rerefunc();">답글쓰기</span>
				    </td>
				</tr>
			<%
					}
				}
			%>
			</tbody>
		</table>
    </div>
<%@ include file="/bottom.jsp" %>