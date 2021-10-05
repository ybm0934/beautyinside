<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.beauty.admin.member.AdminMemberDTO" %>  
<%@ page import="java.util.*" %>
<jsp:useBean id="dao" class="com.beauty.admin.member.AdminMemberDAO"/>
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
	ArrayList<AdminMemberDTO> arr = dao.memberList(search_title, search_text);
	
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
<link rel="stylesheet" type="text/css" href="/admin/css/member.css">
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
        	<form name="main_fm" method="post">
          	<table class="back_table">
                <tr>
                    <td>
                        <div class="body_scroll">
                            <table class="body_table">
                                <colgroup>
                                    <col style="width: 10px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 205px;" />
                                    <col style="width: 50px;" />
                                    <col style="width: 200px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 500px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 80px;" />
                                </colgroup>
                                <thead>
	                                <tr valign="middle">
	                                    <th></th>
	                                    <th>회원번호</th>
	                                    <th>아이디</th>
	                                    <th>이름</th>
	                                    <th>생년월일</th>
	                                    <th>전화번호</th>
	                                    <th>성별</th>
	                                    <th>이메일</th>
	                                    <th>우편번호</th>
	                                    <th>주소</th>
	                                    <th>가입일</th>
	                                    <th>휴면여부</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<%		           
	                            		// 목록 출력
                           		        for (int i = 0; i < pageSize; i++) {
                           		        	// 페이징 브레이크 걸어주기
                           		        	if (num < 1) break;
                           		        	AdminMemberDTO dto = arr.get(curPos++);
                           		        	num--;
	                            			%>
	                            			<tr>
	                            				<td><input type="checkbox" name="check" value="<%= dto.getNo() %>"></td>
			                                    <td class="content"><%= dto.getNo() %></td>
			                                    <td class="content"><%= dto.getId() %></td>
			                                    <td class="content"><%= dto.getName() %></td>
			                                    <td class="content"><%= dto.getBirth() %></td>
			                                    <td class="content"><%= dto.getTel() %></td>
			                                    <td class="content"><%= dto.getGender() %></td>
			                                    <td class="content"><%= dto.getEmail() %></td>
			                                    <td class="content"><%= dto.getZipcode() %></td>
			                                    <td class="content"><%= dto.getAddress1() %><%= dto.getAddress2() %></td>
			                                    <td class="content"><%= dto.getRegdate() %></td>
			                                    <td class="content"><%= dto.getDormant() %></td>
	                            			</tr>
	                            			<%
                           		        }
	                            		// 목록 출력 할게 없을떄
	                            		if (totalPage == 0) {
	                            			%>	                      
	                            				<tr id="tr_null">
	                            					<td colspan="14" align="center" style="padding-top: 150px;"><img src="/admin/img/icon_magnifier_black.png"></td>
	                            				</tr>
	                            				 <tr id="tr_null">	                            
	                            					<td colspan="14" align="center" id="td_null" style="padding-top: 30px;">검색된 결과가 없습니다!</td>
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
            <!-- 체크박스 전체 선택 전체 해제 -->
            <div class="selectAll_btn">
                <input type="button" value="전체선택" onclick="selectAll()">
                <script>
                	function selectAll() {
						$('[name=check]').prop('checked', true);
					}
                </script>
                <input type="button" value="전체해제" onclick="selectRelease()">
                <script type="text/javascript">
                	function selectRelease() {
                		$('[name=check]').prop('checked', false);
					}
                </script>
               	<!-- 수정, 삭제 -->
                <div class="delete_btn">
                	<input type="submit" value="수정" onclick='member_update();'>
            		<input type="submit" value="삭제" onclick='member_delete();'>
            	</div>
            	<script>
            		function member_update() {
						main_fm.action='../member/member_update.jsp'; // 줄여보자
					}
            		function member_delete() {
            			let result = confirm('정말 삭제하시겠습니까?');
						if (result) {
							main_fm.action='../member/member_delete.jsp';
						} else {
							history.back();
						}
					}
            	</script>
            </div>
            </form>
            <!-- 페이징 버튼 -->
            <div class="page_btn">
            	<% 
            		if (firstPage > 1 ) {
            			%>
            				<a href="/admin/member/member.jsp?currentPage=<%= firstPage - 1 %>&search_title=<%= search_title %>&search_text=<%= search_text %>">◁</a>
            			<%
            		}
            		for (int i = firstPage; i <= lastPage; i++) {
            			if (i == currentPage) {
                			%>
            				<span><%= i %></span>
            				<%
            			} else {
                			%>
            				<a href="/admin/member/member.jsp?currentPage=<%= i %>&search_title=<%= search_title %>&search_text=<%= search_text %>"><%= i %></a>
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
            				<a href="/admin/member/member.jsp?currentPage=<%= lastPage + 1%>&search_title=<%= search_title %>&search_text=<%= search_text %>">▷</a>
            			<%
            		}
            	%>
            </div>
            <!-- 검색 기능 -->
            <form name="search" action="/admin/member/member.jsp">
	            <div class="select_search">
	            	<select name="search_title" id=sear>
	            		<option value="" selected="selected" hidden="hidden">검색조건</option>
	            		<option value="name">제목</option>
	            		<option value="id">내용</option>
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
<%@ include file="/admin/index/footer.jsp" %>    
</body>
</html>