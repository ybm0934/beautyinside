<%@page import="com.beauty.review.CommentDTO"%>
<%@page import="com.beauty.review.CommentDAO"%>
<%@page import="com.beauty.review.ReviewDTO"%>
<%@page import="com.beauty.review.ReviewDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String category = request.getParameter("category");
	String keyword = request.getParameter("keyword");
	System.out.println("pageSize = " + request.getParameter("pageSize"));
	
	if(category == null) category = "title";
	if(keyword == null) keyword = "";
	
	ReviewDAO reviewDao = new ReviewDAO();
	List<ReviewDTO> list = reviewDao.reviewList(category, keyword);
	SimpleDateFormat odf = new SimpleDateFormat("yyyy.MM.dd.");
	SimpleDateFormat ndf = new SimpleDateFormat("HH:mm");
	
	ArrayList<CommentDTO> comList = null;
	
	// 페이징 처리
	int currentPage = 1; // 현재 페이지
	
	// 페이지를 클릭했을 때 처리
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int totalRecord = list.size(); // 총 레코드 수
	int pageSize = 10; // 한 페이지에 보여질 레코드 수
	if(request.getParameter("pageSize") != null) {
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
	}
	int totalPage = (int) Math.ceil((double) totalRecord / pageSize); // 총 페이지 수
	int blockSize = 10; // 한 블럭에 보여줄 페이지 수
	int firstPage = currentPage - ((currentPage - 1) % blockSize); // 블럭 시작 페이지
	int lastPage = firstPage + (blockSize - 1); // 블럭 끝 페이지
	int curPos = (currentPage - 1) * pageSize; // 페이지 시작 글번호
	int num = totalRecord - curPos; // 페이지 반복 break
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/review/css/reviewList.css">
<script>
	$(document).ready(function() {
		$('#search_btn').click(function(){
			$('form[name=list]').submit();
		});
		
		$('#write_btn').click(function(){
			location.href = '<%=request.getContextPath()%>/review/reviewWrite.jsp';
		});
	});
</script>
<div id="wrap">
	<div id="reviewList_div">
		<h1>리뷰 게시판</h1>
		<form name="list" method="post" action="<%=request.getContextPath()%>/review/reviewList.jsp">
		<div id="select_div">
			<select name="pageSelect" onchange="location.href=this.value">
				<option value="<%=request.getContextPath() %>/review/reviewList.jsp?pageSize=10&category=<%=category%>&keyword=<%=keyword%>"
					<%if(pageSize == 10) { %>
						selected="selected"
					<%} %>>10개씩 보기</option>
				<option value="<%=request.getContextPath() %>/review/reviewList.jsp?pageSize=30&category=<%=category%>&keyword=<%=keyword%>"
					<%if(pageSize == 30) { %>
						selected="selected"
					<%} %>>30개씩 보기</option>
				<option value="<%=request.getContextPath() %>/review/reviewList.jsp?pageSize=50&category=<%=category%>&keyword=<%=keyword%>"
					<%if(pageSize == 50) { %>
						selected="selected"
					<%} %>>50개씩 보기</option>
			</select>
		</div>
		<table id="list_table">
			<caption>글목록 테이블</caption>
			<colgroup>
				<col width="10%;" />
				<col width="*" />
				<col width="15%;" />
				<col width="15%;" />
				<col width="10%;" />
			</colgroup>
		    <thead>
		        <tr>
		            <th>번호</th>
		            <th>제 목</th>
		            <th>작성자</th>
		            <th>등록일</th>
		            <th>조회수</th>
		        </tr>
		    </thead>
		    <tfoot></tfoot>
		    <tbody>
		    	<%
				if(list.size() == 0) {
		    	%>
		    	<tr>
		    		<td colspan="5" id="no_td">등록된 글이 없습니다.</td>
		    	</tr>
		    	<%
		    	}else {
		    		for(int i = 1; i <= pageSize; i++) {
		       			if(num < 1) break;
		       			ReviewDTO dto = list.get(curPos++);
		       			num--;
		       			
		       			String newTerm = "";
		       			if(dto.getNewTerm() > 24) {
	        				newTerm = odf.format(dto.getRegdate());
	        			}else if(dto.getNewTerm() <= 24){
	        				newTerm = ndf.format(dto.getRegdate());
		        		}
		       			
		       			CommentDAO comDao = new CommentDAO();
		       			comList = comDao.commentList(dto.getNo());
		    	%>
		        <tr>
		        	<td><%=dto.getNo() %></td>
		        	<td>
		        		<a href="<%=request.getContextPath() %>/review/reviewDetail.jsp?no=<%=dto.getNo() %>" class="title_link">
		        			<%=dto.getTitle() %>
						</a>
		        		<%if(dto.getFileName() != null) { %>
		        		<span class="fileSpn">
		        			<img src="/img/ico/imgico.png" alt="이미지 여부">
		        		</span>
		        		<%} %>
		        		<%if(comList.size() > 0) { %>
		        		<span class="fileSpn">
		        			<img src="/img/ico/chat.png" alt="댓글 여부">
		        			<%=comList.size() %>
		        		</span>
		        		<%} %>
		        	</td>
		        	<td><%=dto.getName() %></td>
		        	<td><%=newTerm %></td>
		        	<td><%=dto.getCount() %></td>
		        </tr>
		    	<%
		    		}
		    	}
		    	%>
		    </tbody>
		</table>
		<div class="list_foot_div">
		    <input type="button" name="write_btn" class="btn" id="write_btn" value="글쓰기">
		</div>
		<div class="list_paging_div">
			<%if(firstPage > 1) { %>
				<a href="<%=request.getContextPath() %>/review/reviewList.jsp?currentPage=<%=1%>&pageSize=<%=pageSize %>&category=<%=category%>&keyword=<%=keyword%>">&lt;&lt;</a>
				<a href="<%=request.getContextPath() %>/review/reviewList.jsp?currentPage=<%=firstPage - 1%>&pageSize=<%=pageSize %>&category=<%=category%>&keyword=<%=keyword%>">PREV</a>
			<%} %>
			<% for(int i = firstPage; i <= lastPage; i++){
			if(i > totalPage) break;
			if(i == currentPage) { %>
				<span><%=i %></span>
			<%		}else { %>
				<a href="<%=request.getContextPath() %>/review/reviewList.jsp?currentPage=<%=i%>&pageSize=<%=pageSize %>&category=<%=category%>&keyword=<%=keyword%>"><%=i %></a>
			<%		}// if
				}// for
			%>
			<%if(lastPage < totalPage){ %>
				<a href="<%=request.getContextPath() %>/review/reviewList.jsp?currentPage=<%=lastPage + 1%>&pageSize=<%=pageSize %>&category=<%=category%>&keyword=<%=keyword%>">NEXT</a>
				<a href="<%=request.getContextPath() %>/review/reviewList.jsp?currentPage=<%=totalPage%>&pageSize=<%=pageSize %>&category=<%=category%>&keyword=<%=keyword%>">&gt;&gt;</a>
			<%} %>
		</div>
		<div class="list_search_div">
		   <select name="category" id="category">
		       <option value="title"
		       <%if(category.equals("title")) %> selected="selected"
		       >제목</option>
		       <option value="content"
		       <%if(category.equals("content")) %> selected="selected"
		       >내용</option>
		       <option value="name"
		       <%if(category.equals("name")) %> selected="selected"
		       >작성자</option>
		   </select>
		   <input type="text" name="keyword" class="textbox" id="search_box" value="<%=keyword %>">
		    <input type="button" class="btn" id="search_btn" value="검색">
		 </div>
		</form>
	</div>
</div>
<%@ include file="/bottom.jsp" %>