<%@page import="com.beauty.review.CommentDAO"%>
<%@page import="com.beauty.review.CommentDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

	int ogNo = Integer.parseInt(request.getParameter("ogNo"));
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("comment");
	
	CommentDTO comDto = new CommentDTO();
	comDto.setOgNo(ogNo);
	comDto.setName(name);
	comDto.setContent(content);
	
	CommentDAO CommentDAO = new CommentDAO();
	int cnt = CommentDAO.commentWrite(comDto);
	
	ArrayList<CommentDTO> list = null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	
	if(cnt > 0) {
		list = CommentDAO.commentList();
	} else {
%>
	<script>
		alert('댓글 등록 실패!');
		history.back();
	</script>
<%	} %>
<%
	if(list != null) {
		for(int i = 0; i < list.size(); i++) {
			comDto = list.get(i);
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