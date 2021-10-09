<%@page import="com.beauty.review.ReviewDTO"%>
<%@page import="com.beauty.review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<%@ include file="/member/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	int no = Integer.parseInt(request.getParameter("no"));
	if(userid == null) userid = "";
	
	ReviewDAO reviewDao = new ReviewDAO();
	ReviewDTO reviewDto = new ReviewDTO();
	reviewDto = reviewDao.reviewByNo(no);
	if(!userid.equals(reviewDto.getId())) {
		response.sendRedirect("/review/reviewList.jsp");
	}
%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/review/css/reviewEdit.css">
    <script src="https://cdn.ckeditor.com/ckeditor5/29.2.0/classic/ckeditor.js"></script>
    <script>
    	$(document).ready(function(){
    		$('#write_btn').click(function(){
    			if($('#title').val() == '') {
    				alert('제목을 입력하세요.');
    				$('#title').focus();
    				
    				return false;
    			}
    		});
    		
    		$('#cancel_btn').click(function(){
    			if(confirm('내용이 모두 지워질 수 있습니다. 취소하시겠습니까?')){
    				location.href = '<%=request.getContextPath() %>/review/reviewDetail.jsp?no=' + <%=no %>;
    			}
    		});
    	});
    </script>
<div id="wrap">
    <div id="reviewWrite_div">
        <form name="edit" method="post" action="<%=request.getContextPath() %>/review/reviewEdit_ok.jsp" enctype="multipart/form-data">
	        <input type="hidden" name="no" value="<%=no %>">
	        <input type="hidden" name="oldFile" value="<%=reviewDto.getFileName() %>">
	        <input type="hidden" name="fileSize" value="<%=reviewDto.getFileSize() %>">
            <table id="write_table">
                <caption>리뷰 수정하기 테이블</caption>
                <thead>
                </thead>
                <tfoot>
                    <tr>
                        <th colspan="2">
                            <input type="submit" class="btn" id="write_btn" value="수정하기">
                            <input type="button" class="btn" id="cancel_btn" value="취소하기">
                        </th>
                    </tr>
                </tfoot>
                <tbody>
                    <tr>
                        <th>제 목</th>
                        <td>
                            <input type="text" name="title" class="textbox" id="title" placeholder="제목을 입력하세요." spellcheck="false" maxlength="40" value="<%=reviewDto.getTitle() %>">
                        </td>
                    </tr>
                    <tr>
                        <th>사진 올리기</th>
                        <td>
                            <input type="file" name="fileName" accept="image/gif, image/jpeg, image/png, imgae/tiff">
                            <span style="font-size:0.8em; color:gray;">(최대 30MB)</span>
                        </td>
                    </tr>
                    <%if(reviewDto.getFileName() != null) { %>
                    <tr>
                        <th>기존 사진</th>
                        <td>
                        	<span style="vertical-align: middle;">
                        		<img src="/img/ico/disk.png" alt="첨부파일 아이콘" style="width: 20px;">
                        	</span>
                            <span style="font-size:0.9em; color:gray; margin-left: 5px;">
								<%=reviewDto.getFileName() %>
							</span>
                            <span style="font-size:0.8em; color:green; font-weight: bold; margin-left: 10px;">
                            	※ 새로 업로드 시 기존 사진은 삭제 됩니다.
                            </span>
                        </td>
                    </tr>
                    <%} %>
                    <tr>
                        <td colspan=2>
                            <textarea name="content" id="editor" spellcheck="false"><%=reviewDto.getContent() %></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
<script>
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );
</script>
<%@ include file="/bottom.jsp" %>