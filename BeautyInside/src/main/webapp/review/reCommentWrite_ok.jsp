<%@page import="com.beauty.review.CommentDAO"%>
<%@page import="com.beauty.review.CommentDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/member/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	if(cid != null) {
		int no = Integer.parseInt(request.getParameter("no"));
		int ogNo = Integer.parseInt(request.getParameter("ogNo"));
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String userid = request.getParameter("userid");
		
		CommentDTO comDto = new CommentDTO();
		comDto.setNo(no);
		comDto.setOgNo(ogNo);
		comDto.setId(id);
		comDto.setName(name);
		comDto.setContent(content);
		
		CommentDAO CommentDAO = new CommentDAO();
		int cnt = CommentDAO.reCommentWrite(comDto);
		
		ArrayList<CommentDTO> list = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		
		if(cnt > 0) {
			list = CommentDAO.commentList(ogNo);
		} else {
%>
		<script>
			alert('댓글 등록 실패!');
			history.back();
		</script>
<%
		} // if
	
		if(list != null) {
			for(int i = 0; i < list.size(); i++) {
				comDto = list.get(i);
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
				<tr id="re<%=comDto.getNo() %>" class="reply_tr">
				    <td class="reply_trtd_2">
				    	<div class="replyComment_div">
				        	<span class="comment"><%=dtoCon %></span>
				    	</div>
				        <div class="replrepl_div">
				        <%if(!comDto.getId().equals(userid)) { %>
							<a class="re_spn" onclick="rrWrite('<%=comDto.getNo() %>', '<%=comDto.getName() %>');">답글쓰기</a>
				        <%}else { %>
							<a class="re_spn" onclick="rrEdit('<%=comDto.getNo() %>', '<%=comDto.getContent() %>');">수정하기</a>
							&nbsp;
							<a class="re_spn" onclick="rrDelete('<%=comDto.getNo() %>');">삭제하기</a>
				        <%} %>
				        </div>
				    </td>
				</tr>
<%
			} // for
		}// if
	} // if
%>