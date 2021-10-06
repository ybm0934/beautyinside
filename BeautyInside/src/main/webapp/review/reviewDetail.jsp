<%@page import="java.text.SimpleDateFormat"%>
<%@page import="yong.board.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="yong.board.BoardDTO"%>
<%@ page import="yong.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String no = request.getParameter("no");

	ReviewDAO boardDao = new ReviewDAO();
	ReviewDTO boardDto = new ReviewDTO();
	
	boardDto = boardDao.detail(Integer.parseInt(no));
	
	String fileName = boardDto.getFileName();
	int downCount = boardDto.getDownCount();
	
	String attatch = (fileName == null) ? "" : fileName + "(" + downCount + ")";
	
	ArrayList<CommentDTO> list = boardDao.commentList();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글 상세보기</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/board/css/detail.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
	    $(document).ready(function(){
	    	$('#list_btn').click(function(){
	    		location.href = '<%=request.getContextPath() %>/board/list.jsp';
	    	});
	    	
	    	// 답변 쓰기 이동
	    	$('#reWrite_btn').click(function(){
	    		location.href = '<%=request.getContextPath() %>/board/reWrite.jsp?no=<%=no %>&groupno=<%=boardDto.getGroupno()%>&step=<%=boardDto.getStep()%>&sortno=<%=boardDto.getSortno()%>&title=<%=boardDto.getTitle()%>';
	    	});
	        
	        // 댓글 등록 Ajax
	        $('#reply_regit_btn').click(function(){
	            $.ajax({
	               url : '<%=request.getContextPath() %>/board/reply_ok.jsp',
	               type : 'POST',
	               data : {
	            	   ogNo : <%=no %>,
	            	   name : $('#name').val(),
	            	   pwd : $('#pwd').val(),
	            	   comment : $('#comment').val()
	               },
	               datatype : 'JSON',
	               success : function(data){
	                   $('#reply_table tbody').html(data);
	                   $('#name').val('');
	                   $('#pwd').val('');
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
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
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
		            <td colspan="4" id="title_td"><%=boardDto.getTitle() %></td>
		        </tr>
		        <tr>
		            <th>닉네임</th>
		            <td><%=boardDto.getName() %></td>
		            <th>조회수</th>
		            <td><%=boardDto.getCount() %></td>
		        </tr>
		        <tr>
		            <th>첨부파일</th>
		            <td colspan="3">
		            	<a href="#"><%=attatch %></a>
		            </td>
		        </tr>
		        <tr>
		            <td colspan="4">
		            	<div id="content"><%=boardDto.getContent() %></div>
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
</body>
</html>