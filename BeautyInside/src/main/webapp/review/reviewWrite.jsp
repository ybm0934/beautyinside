<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<%@ include file="/member/loginCheck.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/review/css/reviewWrite.css">
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
    				location.href = '<%=request.getContextPath() %>/review/reviewList.jsp';
    			}
    		});
    	});
    </script>
<div id="wrap">
    <div id="reviewWrite_div">
        <form name="write" method="post" action="<%=request.getContextPath() %>/review/reviewWrite_ok.jsp" enctype="multipart/form-data">
            <table id="write_table">
                <caption>글쓰기 테이블</caption>
                <thead>
                	<input type="hidden" name="name" value="<%=memberDto.getName() %>">
                </thead>
                <tfoot>
                    <tr>
                        <th colspan="2">
                            <input type="submit" class="btn" id="write_btn" value="등록하기">
                            <input type="button" class="btn" id="cancel_btn" value="취소하기">
                        </th>
                    </tr>
                </tfoot>
                <tbody>
                    <tr>
                        <th>제 목</th>
                        <td>
                            <input type="text" name="title" class="textbox" id="title" placeholder="제목을 입력하세요." spellcheck="false">
                        </td>
                    </tr>
                    <tr>
                        <th>사진 올리기</th>
                        <td>
                            <input type="file" name="fileName" accept="image/gif, image/jpeg, image/png, imgae/tiff">
                            <span style="font-size:0.8em; color:gray;">(최대 30MB)</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan=2>
                            <textarea name="content" id="editor" spellcheck="false"></textarea>
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