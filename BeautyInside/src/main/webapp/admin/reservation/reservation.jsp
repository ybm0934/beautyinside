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
<%@ page import="com.beauty.admin.reservation.AdminReservationDTO" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dao" class="com.beauty.admin.reservation.AdminReservationDAO"/>
<%
	String con = request.getParameter("con");
	// 검색 파라미터
	String search_title = request.getParameter("search_title");
	String search_text = request.getParameter("search_text");
	
	if (search_title == null) {
		search_title = "";
	}
	if (search_text == null) {
		search_text = "";
	}
	if (con == null) {
		con = "";
	}
	
	// 목록 생성
	ArrayList<AdminReservationDTO> arr = dao.reservationList(search_title, search_text, con);
	
	// 페이징 변수
		int currentPage = 1; // 현재 페이지
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int totalRecord = arr.size(); // 총 레코드 수
		int pageSize = 4; // 보여지는 레코드 수
		int blockSize = 5; // 보여지는 페이지 버튼 수
		int totalPage = (int) Math.ceil((double) totalRecord / pageSize); // 총 페이지수 
		int firstPage = currentPage - ((currentPage - 1) % blockSize); // 버튼 시작시점
		int lastPage = firstPage + (blockSize - 1); // 버튼의 마지막지점
		int curPos = (currentPage - 1) * pageSize; // rownum
		int num = totalRecord - (curPos); // 브레이크
	
	// 총 예약 수
	int reservation = arr.size();
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
    <link rel="stylesheet" type="text/css" href="/admin/reservation/css/reservation.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>관리자페이지-예약관리</title>
</head>
<body>
<%@ include file="/admin/index/header.jsp" %>
	<h1 class="a">예약관리</h1>
        	<!-- 메인 테이블 -->
   	<div style="text-align: center;">
   		<span style="font-size: 14px">[총 예약수: <%= reservation %>]</span>
   	</div>
   	<form name="con_fm" action="../reservation/reservation.jsp">
	    <div style="float: left">
	       <select name="con" id=con onchange="consend()" style="width: 90px; height: 22px;">
	           <option value="" selected="selected" >상세 조건</option>
	           <option value="regdateup">등록날짜 ↑</option>
	           <option value="regdatedown">등록날짜 ↓</option>
	           <option value="rsvdateup">예약날짜 ↑</option>
	           <option value="rsvdatedown">예약날짜 ↓</option>
	       </select>
	       <script>
	       		let flag = '<%= con %>';
	       		$('#con').val(flag);
	       </script>
	    </div>
	</form>
	<script type="text/javascript">
		function consend() {
			var f = document.con_fm;
			if (f.con.value == "") {
				
			} else {
				f.submit();
			}
		}
	</script>
    <form action="/admin/reservation/reservation.jsp">
        <div style="float: right; margin-bottom: 5px;">
            <select name="search_title" id=sear style="width: 80px; height: 22px; width: 100px; padding-left: 10px; padding-right: 10px; text-align: left">
            	<option value="" selected="selected">검색 조건</option>
                <option value="service" >서비스</option>
                <option value="status">상태</option>
            </select>
            <script>
            	let flag = '<%= search_title %>';
            	$('#sear').val(flag);
            </script>
            <input type="text" name="search_text" value="<%= search_text %>">
            <input type="submit" id="search_btn" value="검색">
        </div>
    </form>
    <div>
        <table >
            <thead>
                    <tr>
                        <th>예약번호</th>
                        <th colspan="2">예약자 정보</th>
                        <th style="width: 200px">남길 메세지</th>
                        <th>서비스</th>
                        <th>상태</th>
                        <th style="width: 200px;">예약날짜</th>
                        <th>등록날짜</th>
                        <th>기능</th>
                    </tr>
            </thead>
               		 <tbody style="border: 1px solid black;">
                	<%
                		// 목록 출력
                		for (int i = 0; i < pageSize; i++) {
                			// 페이징 브레이크 걸어주기
                			if (num < 1) break;
                			AdminReservationDTO dto = arr.get(curPos++);
                			num--;
                			%>
    					<form action="/admin/reservation/reservation_update.jsp">
	                	<tr>
		                    <td rowspan="3"><input type="hidden" name="no" value="<%= dto.getNo() %>"><%= dto.getNo() %></td>
		                    <th>예약자</th>
		                    <td colspan="1" style="text-align: left; padding-left: 3.7%;"><input type="text" name="name" value="<%= dto.getName() %>" style="width: 25%; text-align: center; border: none; color: #754100; font-size: 15px"></td>
		                    <%
		                    	if (dto.getReswords() == null) {
		                    		%>
			                    		<td rowspan="3"></td>
		                    		<%
		                    	} else {
		                    		%>
					                    <td rowspan="3"><%= dto.getReswords() %></td>
		                    		<%
		                    	}
		                    %>
		                    <td rowspan="3">
		                    	<%
		                    		if (dto.getService().equals("젤 매니큐어")) {
		                    			%>
		                    				<select name="service">
		                    					<option value="젤 매니큐어" selected="selected" >젤 매니큐어</option>
		                    					<option value="페디큐어">페디큐어</option>
		                    					<option value="네일 아트">네일 아트</option>
		                    					<option value="매니큐어 손질">매니큐어 손질</option>
		                    					<option value="퓨어 클렌징">퓨어 클렌징</option>
		                    					<option value="퓨어 마사지">퓨어 마사지</option>
		                    					<option value="수분 공급">수분 공급</option>
		                    				</select>
		                    			<%
		                    		} else if (dto.getService().equals("페디큐어")) {
		                    			%>
		                    				<select name="service">
		                    					<option value="페디큐어" selected="selected" >페디큐어</option>
		                    					<option value="젤 매니큐어">젤 매니큐어</option>
		                    					<option value="네일 아트">네일 아트</option>
		                    					<option value="매니큐어 손질">매니큐어 손질</option>
		                    					<option value="퓨어 클렌징">퓨어 클렌징</option>
		                    					<option value="퓨어 마사지">퓨어 마사지</option>
		                    					<option value="수분 공급">수분 공급</option>
		                    				</select>
	                    				<%
		                    		} else if (dto.getService().equals("네일 아트")) {
		                    			%>
		                    				<select name="service">
		                    					<option value="네일 아트" selected="selected" >네일 아트</option>
		                    					<option value="젤 매니큐어">젤 매니큐어</option>
		                    					<option value="페디큐어">페디큐어</option>
		                    					<option value="매니큐어 손질">매니큐어 손질</option>
		                    					<option value="퓨어 클렌징">퓨어 클렌징</option>
		                    					<option value="퓨어 마사지">퓨어 마사지</option>
		                    					<option value="수분 공급">수분 공급</option>
		                    				</select>
                    					<%
		                    		} else if (dto.getService().equals("매니큐어 손질")) {
		                    			%>
		                    				<select name="service">
		                    					<option value="매니큐어 손질" selected="selected" >매니큐어 손질</option>
		                    					<option value="젤 매니큐어">젤 매니큐어</option>
		                    					<option value="페디큐어">페디큐어</option>
		                    					<option value="네일 아트">네일 아트</option>
		                    					<option value="퓨어 클렌징">퓨어 클렌징</option>
		                    					<option value="퓨어 마사지">퓨어 마사지</option>
		                    					<option value="수분 공급">수분 공급</option>
		                    				</select>
                						<%
		                    		} else if (dto.getService().equals("퓨어 클렌징")) {
		                    			%>
		                    				<select name="service">
		                    					<option value="퓨어 클렌징" selected="selected" >퓨어 클렌징</option>
		                    					<option value="젤 매니큐어">젤 매니큐어</option>
		                    					<option value="페디큐어">페디큐어</option>
		                    					<option value="네일 아트">네일 아트</option>
		                    					<option value="매니큐어 손질">매니큐어 손질</option>
		                    					<option value="퓨어 마사지">퓨어 마사지</option>
		                    					<option value="수분 공급">수분 공급</option>
		                    				</select>
            							<%
		                    		} else if (dto.getService().equals("퓨어 마사지")) {
		                    			%>
		                    				<select name="service">
		                    					<option value="퓨어 마사지" selected="selected" >퓨어 마사지</option>
		                    					<option value="젤 매니큐어">젤 매니큐어</option>
		                    					<option value="페디큐어">페디큐어</option>
		                    					<option value="네일 아트">네일 아트</option>
		                    					<option value="매니큐어 손질">매니큐어 손질</option>
		                    					<option value="퓨어 클렌징">퓨어 클렌징</option>
		                    					<option value="수분 공급">수분 공급</option>
		                    				</select>
        								<%
		                    		} else if (dto.getService().equals("수분 공급")) {
		                    			%>
		                    				<select name="service">
		                    					<option value="수분 공급" selected="selected" >수분 공급</option>
		                    					<option value="젤 매니큐어">젤 매니큐어</option>
		                    					<option value="페디큐어">페디큐어</option>
		                    					<option value="네일 아트">네일 아트</option>
		                    					<option value="매니큐어 손질">매니큐어 손질</option>
		                    					<option value="퓨어 클렌징">퓨어 클렌징</option>
		                    					<option value="퓨어 마사지">퓨어 마사지</option>
		                    				</select>
    									<%
		                    		}
		                    	%>
		                    </td>
		                    <td rowspan="3">
		                    	<%
		                    		if (dto.getStatus().equals("예약 대기")) {
		                    			%>
		                    				<select name="status">
		                    					<option value="예약 대기" selected="selected">예약 대기</option>
		                    					<option value="예약 완료">예약 완료</option>
		                    					<option value="예약 취소">예약 취소</option>
		                    				</select>
		                    			<%
		                    		} else if (dto.getStatus().equals("예약 완료")) {
		                    			%>
		                    				<select name="status">
		                    					<option value="예약 완료" selected="selected">예약 완료</option>
		                    					<option value="예약 대기">예약 대기</option>
		                    					<option value="예약 취소">예약 취소</option>
		                    				</select>
                    					<%
		                    		} else if (dto.getStatus().equals("예약 취소")) {
		                    			%>
				                    		<select name="status">
		                    					<option value="예약 취소" selected="selected">예약 취소</option>
		                    					<option value="예약 대기">예약 대기</option>
		                    					<option value="예약 완료">예약 완료</option>
		                    				</select>
		                    			<%
		                    		}
		                    	%>
		                    </td>
		                    <td rowspan="3">
		                        <input type="text" name="resdate" value="<%= dto.getResdate() %>" style="text-align: center; border: none; font-size: 15px">
		                    </td>
		                    <td rowspan="3"><input type="hidden" name="regdate" value="<%= dto.getRegdate() %>"><%= dto.getRegdate().substring(0, 10) %></td>
		                    <td rowspan="3"><input type="submit" value="변경" style="background-color: #ffd400; border: none; color: white;"></td>
		               </tr>
		               <tr>
		                   <th>이메일</th>
		                   <td colspan="1" style="text-align: left; padding-left: 2.7%;"><input type="text" name="email" value="<%= dto.getEmail() %>" style="width: 70%; text-align: center; border: none; color: skyblue; font-size: 15px"></td>
		               </tr>
		               <tr style="border-bottom: 1px solid gray;">
		                   <th>전화번호</th>
		                   <td colspan="1" style="text-align: left; padding-left: 3.7%;"><input type="text" name="tel" value="<%= dto.getTel() %>" style="width: 50%; text-align: center; border: none; color: #f55354; font-size: 15px"></td>
		               </tr>
  				 </form>
               	 <%
                  	}
                	if (totalPage == 0) {
            			%>	                      
            				<tr id="tr_null">
            					<td colspan="10" align="center" style="padding-top: 180px;"><img src="/admin/img/icon_magnifier_black.png"></td>
            				</tr>
            				 <tr id="tr_null">	                            
            					<td colspan="10" align="center" id="td_null" style="padding-top: 30px; padding-bottom: 120px">예약된 결과가 없습니다!</td>
            				</tr>
            			<%
            		}
              	%>
            </tbody>
        </table>
    </div>
	 <div class="page_btn">
            	<% 
            		if (firstPage > 1 ) {
            			%>
            				<a href="/admin/reservation/reservation.jsp?currentPage=<%= firstPage - 1 %>&search_title=<%= search_title %>&search_text=<%= search_text %>">◁</a>
            			<%
            		}
            		for (int i = firstPage; i <= lastPage; i++) {
            			if (i == currentPage) {
                			%>
            				<span><%= i %></span>
            				<%
            			} else {
                			%>
            				<a href="/admin/reservation/reservation.jsp?currentPage=<%= i %>&search_title=<%= search_title %>&search_text=<%= search_text %>"><%= i %></a>
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
            				<a href="/admin/reservation/reservation.jsp?currentPage=<%= lastPage + 1%>&search_title=<%= search_title %>&search_text=<%= search_text %>">▷</a>
            			<%
            		}
            	%>
            </div>
<%@ include file="/admin/index/footer.jsp" %>
</body>
</html>