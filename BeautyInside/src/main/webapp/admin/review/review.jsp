<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	if (session.getAttribute("userid") == null) {
		%>
			<script>
				alert('잘못된 접근입니다!');
				location.href ='/admin/login/login.jsp';
			</script>
		<%
	}
%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.beauty.admin.review.AdminReviewDTO" %>  
<%@ page import="java.util.*" %>
<jsp:useBean id="dao" class="com.beauty.admin.review.AdminReviewDAO"/>
<%	
	// 검색 파라미터
	String search_title = request.getParameter("search_title");
	String search_text = request.getParameter("search_text");
	
	if (search_title == null) {
		search_title = "";
	}
	if (search_text == null) {
		search_text = "";
	}
	// 목록 생성
	ArrayList<AdminReviewDTO> arr = dao.reviewList(search_title, search_text);
	
	// 페이징 변수
		int currentPage = 1; // 현재 페이지
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int totalRecord = arr.size(); // 총 레코드 수
		int pageSize = 10; // 보여지는 레코드 수
		int blockSize = 5; // 보여지는 페이지 버튼 수
		int totalPage = (int) Math.ceil((double) totalRecord / pageSize); // 총 페이지수 
		int firstPage = currentPage - ((currentPage - 1) % blockSize); // 버튼 시작시점
		int lastPage = firstPage + (blockSize - 1); // 버튼의 마지막지점
		int curPos = (currentPage - 1) * pageSize; // rownum
		int num = totalRecord - (curPos); // 브레이크
	// 총 리뷰 수
	int reviewCount = dao.reviewCount();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300&display=swap">
<link rel="stylesheet" type="text/css" href="/admin/css/reset.css">
<link rel="stylesheet" type="text/css" href="/admin/review/css/review.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>관리자페이지-리뷰관리</title>
</head>
<body>
<%@ include file="/admin/index/header.jsp" %>
<main>
    <section>
        <article>
        	<h1 class="a">리뷰관리</h1>
        	<!-- 메인 테이블 -->
        	<div style="text-align: center;">
        		<span style="font-size: 14px">[총 리뷰수: <%= reviewCount %>]</span>
        	</div>
        	<form name="review_fm" method="get">
          	<table class="back_table">
                <tr>
                    <td>
                        <div class="body_scroll">
                            <table class="body_table">
                                <colgroup>
                                    <col style="width: 100px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 200px;" />
                                    <col style="width: 80px;" />
                                    <col style="width: 120px;" />
                                    <col style="width: 120px;" />
                                    <col style="width: 120px;" />
                                    <col style="width: 150px;" />
                                </colgroup>
                                <thead>
	                                <tr valign="middle">
	                                    <th>리뷰번호</th>
	                                    <th>아이디</th>
	                                    <th>이름</th>
	                                    <th>제목</th>
	                                    <th>조회수</th>
	                                    <th>작성일</th>
	                                    <th>파일명</th>
	                                    <th>파일크기</th>
	                                    <th>기능</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<%		           
	                            		// 목록 출력
                           		        for (int i = 0; i < pageSize; i++) {
                           		        	// 페이징 브레이크 걸어주기
                           		        	if (num < 1) break;
                           		        	AdminReviewDTO dto = arr.get(curPos++);
                           		        	num--;
	                            			%>
	                            			<tr>
			                                    <td class="content"><%= dto.getNo() %></td>
			                                    <td class="content"><%= dto.getId() %></td>
			                                    <td class="content"><%= dto.getName() %></td>
			                                    <td class="content"><a href="/admin/review/review_content.jsp?no=<%= dto.getNo() %>" style="color: blue"><%= dto.getTitle() %></a></td>
			                                    <td class="content"><%= dto.getCount() %></td>
			                                    <td class="content"><%= dto.getRegdate() %></td>
			                                    <td class="content"><%= dto.getFilename() %></td>
			                                    <td class="content"><%= dto.getFilesize() %></td>
			                                    <td class="content"><input type="button" value="수정" style="width:60px; height:25px; color: white; background-color: #ff4040; border:none" onclick="location.href='/admin/review/review_update.jsp?no=<%= dto.getNo() %>';"><input type="submit" value="삭제" style="width:60px; height: 25px; color: white; background-color: #0080ff; border:none" onclick='review_delete();'><input type="hidden" name="no" value="<%= arr.get(i).getNo()%>"></td>
			                                    <script>
										    		function review_delete() {
										    			let result = confirm('정말 삭제하시겠습니까?');
														if (result) {
															review_fm.action='../review/review_delete.jsp';
														} else {
															history.back();
														}
													}
									            </script>
	                            			</tr>
	                            			<%
                           		        }
	                            		// 목록 출력 할게 없을떄
	                            		if (totalPage == 0) {
	                            			%>	                      
	                            				<tr id="tr_null">
	                            					<td colspan="9" align="center" style="padding-top: 200px;"><img src="/admin/img/icon_magnifier_black.png"></td>
	                            				</tr>
	                            				 <tr id="tr_null">	                            
	                            					<td colspan="9" align="center" id="td_null" style="padding-top: 30px;">검색된 결과가 없습니다!</td>
	                            				</tr>
	                            			<%
	                            		}
	                            	%>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
            </form>
            <!-- 페이징 버튼 -->
            <div class="page_btn">
            	<% 
            		if (firstPage > 1 ) {
            			%>
            				<a href="/admin/review/review.jsp?currentPage=<%= firstPage - 1 %>&search_title=<%= search_title %>&search_text=<%= search_text %>">◁</a>
            			<%
            		}
            		for (int i = firstPage; i <= lastPage; i++) {
            			if (i == currentPage) {
                			%>
            				<span><%= i %></span>
            				<%
            			} else {
                			%>
            				<a href="/admin/review/review.jsp?currentPage=<%= i %>&search_title=<%= search_title %>&search_text=<%= search_text %>"><%= i %></a>
            				<%	
            			}
            			if (i == totalPage) {
            				break;
            			}
   						if (totalPage == 0) {
   							break;
   						}
            		}
            		if (lastPage < totalPage) {
            			%>
            				<a href="/admin/review/review.jsp?currentPage=<%= lastPage + 1%>&search_title=<%= search_title %>&search_text=<%= search_text %>">▷</a>
            			<%
            		}
            	%>
            </div>
            <!-- 검색 기능 -->
           	 <form name="search" action="/admin/review/review.jsp">
	            <div class="select_search">
	            	<select name="search_title" id=sear>
	            		<option value="" selected="selected" hidden="hidden">검색조건</option>
	            		<option value="id">아이디</option>
	            		<option value="name">이름</option>
     			        <option value="title">제목</option>
	            	</select>
	            	<script type="text/javascript">
	            		let flag = '<%= search_title %>';
	            		$('#sear').val(flag);
	            	</script>
	            	<input type="text" name="search_text" class="text_search" value=<%= search_text %>>
					<script>
						$(document).ready(function () {
							$('#search_btn').click(function () {
								$('form[name=search]').submit();
							});
						});
					</script>
					<span id="search_btn">
						<img src="/admin/img/icon_magnifier_black.png">
					</span>
	           	</div>
	        </form>
        </article>
    </section>
</main>
<footer>
	<!-- 하단 푸터 -->
	<div>
		<span>COPYRIGHT (C) 2021 PURE ALL RIGHTS RESERVED.</span>
	</div>
</footer>  
</body>
</html>