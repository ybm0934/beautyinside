<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.beauty.review.CommentDTO"%>
<%@page import="com.beauty.review.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
	String userid = request.getParameter("userid");

	CommentDAO comDao = new CommentDAO();
	ArrayList<CommentDTO> comList = comDao.commentList(Integer.parseInt(no));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd. HH:mm:ss");
	String placeholder = "아름다운 댓글 문화를 만들어 갑시다.";
%>
<h3>댓글 <span id="listSizeSpn"><%=comList.size() %></span>개</h3>
<table id="reply_table">
	<caption>댓글 테이블</caption>
	<thead></thead>
	<tfoot>
		<tr>
		    <td>
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
			<%	if(comDto.getSortNo() == 0) { %>
				<td class="reply_trtd">
			<%	}else { %>
				<td class="rereply_trtd">
			<%	} %>
					<span class="reply_imgSpn">
						<img src="/img/ico/bubbleChat.png" alt="댓글 이미지">
					</span>
					<span class="reply_nameSpn"><%=comDto.getName() %></span>
					<span class="reply_dateSpn"><%=sdf.format(comDto.getRegdate()) %></span>
				</td>
			</tr>
		<%	if(comDto.getDelFlag().equals("Y")) { %>
			<tr class="reply_tr">
				<td class="reply_trtd_2">
					<div class="replrepl_div">
						<span class="delSpn">삭제 된 댓글입니다.</span>
					</div>
				</td>
			</tr>
		<%	}else { %>
			<tr id="re<%=comDto.getNo() %>" class="reply_tr">
			<%	if(comDto.getSortNo() == 0) { %>
				<td class="reply_trtd_2">
			<%	}else { %>
				<td class="rereply_trtd_2">
			<%	} %>
			    	<div class="replyComment_div">
			        	<span class="comment">
			        	<%if(comDto.getTarget() != null) { %>
			        		<span class="targetSpn">&#64;<%=comDto.getTarget() %></span>
			        	<%} %>
			        		<%=dtoCon %>
			        	</span>
			    	</div>
			        <div class="replrepl_div">
			        <%if(!comDto.getId().equals(userid)) { %>
						<a class="re_spn" onclick="rrWrite('<%=comDto.getNo() %>', '<%=comDto.getGroupNo() %>', '<%=comDto.getSortNo() %>', '<%=comDto.getName() %>');">답글쓰기</a>
			        <%}else { %>
						<a class="re_spn" onclick="rrEdit('<%=comDto.getNo() %>', '<%=comDto.getContent() %>');">수정하기</a>
						&nbsp;
						<a class="re_spn" onclick="rrDelete('<%=comDto.getNo() %>', <%=comDto.getSortNo() %>);">삭제하기</a>
			        <%} %>
			        </div>
			    </td>
			</tr>
		<%	} // if %>
		<%
			} // for
		} // if
		%>
	</tbody>
</table>