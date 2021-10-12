<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<%@ include file="/member/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String service = request.getParameter("service");
	String price = request.getParameter("price");
	if(service == null || price == null) {
		service = "";
		price = "";
	}

	Calendar cr = Calendar.getInstance();
	int year = cr.get(Calendar.YEAR);
	int month = cr.get(Calendar.MONTH);
	int date = cr.get(Calendar.DATE);
	
	if(request.getParameter("year") != null)
		year = Integer.parseInt(request.getParameter("year"));
	
	if(request.getParameter("month") != null)
		month = Integer.parseInt(request.getParameter("month")) - 1;
	
	// 현재 년월일 입력
	cr.set(year, month, 1);
	
	// 이전 년월 계산
	int prevY = year;
	int prevM = (month + 1) - 1;
	int nextY = year;
	int nextM = (month + 1) + 1;
	
	if(prevM < 1) {
		prevY--;
		prevM = 12;
	}
	
	if(nextM > 12) {
		nextY++;
		nextM = 1;
	}
	
	String now = year + "년 " + String.format("%02d", (month + 1)) + "월";
	
	int startDate = cr.getMinimum(Calendar.DATE);
	int endDate = cr.getActualMaximum(Calendar.DATE);
	int startDay = cr.get(Calendar.DAY_OF_WEEK);
	
	System.out.println("year : " + year);
	System.out.println("month : " + (month + 1));
	System.out.println("date : " + date);
	System.out.println("endDate : " + endDate);
	System.out.println("startDay : " + startDay);
	System.out.println();
%>
<script>
	$(document).ready(function(){
		$('#prevMonth').click(function(){
			$('input[name=year]').val('<%=prevY %>');
			$('input[name=month]').val('<%=prevM %>');
			$('input[name=service]').val('<%=service %>');
			$('input[name=price]').val('<%=price %>');
			$('form[name=reserve]').submit();
		});
		
		$('#nextMonth').click(function(){
			$('input[name=year]').val('<%=nextY %>');
			$('input[name=month]').val('<%=nextM %>');
			$('input[name=service]').val('<%=service %>');
			$('input[name=price]').val('<%=price %>');
			$('form[name=reserve]').submit();
		});
		
		$('#reserveBtn').click(function(){
			if($('input[name=resDate]').val() == '') {
				alert('예약 날짜를 선택해주세요.');
				
				return false;
			}else if($('input[name=resTime]').val() == ''){
				alert('예약 시간을 선택해주세요.');
				
				return false;
			}else if($('input[name=service]').val() == ''){
				alert('받으실 서비스를 선택해주세요.');
				location.href = '/reserve/reserveMenu.jsp';
				
				return false;
			}
			
			$('form[name=reserve_ok]').submit();
		});
	});
	
	// 캘린더 선택
	function resDate(year, month, date) {
		$(document).ready(function(){
			var fullDate = year + '년 ' + month + '월 ' + date + '일';
			$('#reserve_table a').removeClass('selected');
			$('#a' + date).addClass('selected');
			$('#date_ok').html(fullDate);
			$('input[name=resDate]').val(fullDate);
		});
	}// resDate
	
	// 시간 선택
	function resTime(hour, minute) {
		$(document).ready(function(){
			var fullTime = hour + ':' + minute;
			$('#time_div a').removeClass('selected');
			$('#ta' + hour + minute).addClass('selected');
			$('#time_ok').html(fullTime);
			$('input[name=resTime]').val(fullTime);
		});
	}// resTime
	
	window.onload = function() {
		nowTime();
	}
	
	// 현재 시각 계산
	function nowTime() {
		var now = new Date();
		var y = now.getFullYear();
		var m = now.getMonth() + 1;;
		var d = now.getDate();
		var h = now.getHours();
		var m_ = now.getMinutes();
		var s = now.getSeconds();
		
		var nowDate = y + '년 ' + ('00' + m).slice(-2) + '월 ' + ('00' + d).slice(-2) + '일 ';
		var nowTime = ('00' + h).slice(-2) + ':' + ('00' + m_).slice(-2) + ':' + ('00' + s).slice(-2);
		
		document.getElementById('nowDate').innerHTML = nowDate;
		document.getElementById('nowTime').innerHTML = nowTime;
	}
	
	setInterval(function() {
		nowTime();
	}, 1000);
</script>
<link rel="stylesheet" type="text/css" href="/reserve/css/reserve.css">
<div id="wrap">
	<div id="reserve_div">
		<form name="reserve" method="post" action="/reserve/reserve.jsp">
			<input type="hidden" name="year"> 
			<input type="hidden" name="month"> 
			<input type="hidden" name="service" value="<%=service %>">
			<input type="hidden" name="price" value="<%=price %>">
		</form>
		<div class="title_div">
			<h1>Calendar</h1>
		</div>
		<table id="reserve_table">
		    <caption>예약하기 테이블</caption>
		    <thead>
		        <tr>
		        	<th>
		            	<a href="#" id="prevMonth">
			            	<img src="/img/ico/left-arrow.png" alt="이전 월" class="ico">
		            	</a>
		        	</th>
		            <th colspan="5">
		                <span class="nowSpn"><%=now %></span>
		            </th>
		        	<th>
		            	<a href="#" id="nextMonth">
			            	<img src="/img/ico/right-arrow.png" alt="이전 월" class="ico">
		            	</a>
		        	</th>
		        </tr>
		        <tr id="week_tr">
		            <th class="sun">SUN</th>
		            <th>MON</th>
		            <th>TUE</th>
		            <th>WED</th>
		            <th>THU</th>
		            <th>FRI</th>
		            <th class="sat">SAT</th>
		        </tr>
		    </thead>
		    <tfoot></tfoot>
		    <tbody>
		        <tr>
		        <%for(int i = 1; i < startDay; i++) { %>
		        	<td></td>
		        <%} %>
		        <%while(cr.get(Calendar.MONTH) == month) { %>
		        <%	if(cr.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) { %>
		        	<td class="sat">
		        <%	}else if(cr.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) { %>
		        	<td class="sun">
		        <%	}else { %>
		        	<td>
		        <%	}%>
		        		<a href="#" class="dateA" id="a<%=cr.get(Calendar.DATE) %>" onclick="resDate('<%=cr.get(Calendar.YEAR)%>', '<%=cr.get(Calendar.MONTH) + 1 %>', '<%=cr.get(Calendar.DATE) %>')">
		        			<%=cr.get(Calendar.DATE) %>
		        		</a>
		        	</td>
		        <%	if(cr.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) { %>
		        	</tr><tr>
		        <%	} %>
		        <%	cr.set(cr.get(Calendar.YEAR), cr.get(Calendar.MONTH), cr.get(Calendar.DATE) + 1); %>
		        <%} %>
		        <%if(cr.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) { %>
		        <%	for(int i = cr.get(Calendar.DAY_OF_WEEK); i <= 7; i++) { %>
					<td></td>
		        <%} %>
		        <%	} %>
		        </tr>
	        </tbody>
	    </table>
	    <div id="time_div">
	    	<fieldset id="field">
	    		<legend>시간 선택</legend>
	    	<%
	   			for(int i = 10; i <= 20; i++) {
	   				int num = 0;
		   			int three = 0;
		   			String str = "";
	   				while(num < 2) {
	   					if(three == 0) {
	   					 	str = String.format("%02d", num); 
	   					}else {
	   						str = Integer.toString(three);
	   					}
	   		%>
	   				<a href="#" class="timeA" id="ta<%=i %><%=str %>" onclick="resTime('<%=i %>', '<%=str %>')">
	   					<%=i %>:<%=str %>
	   				</a>
	   		<%
	   					three += 30;
	   					num++;
	   				}// while
	   			}// for
	   		%>
	   		</fieldset>
	    </div>
    </div>
    <div id="aside_div">
    	<form name="reserve_ok" method="post" action="/reserve/reserve_ok.jsp">
    		<input type="hidden" name="name" value="<%=memberDto.getName() %>">
    		<input type="hidden" name="email" value="<%=memberDto.getEmail() %>">
    		<input type="hidden" name="tel" value="<%=memberDto.getTel() %>">
    		<input type="hidden" name="service" value="<%=service %>">
    		<input type="hidden" name="price" value="<%=price %>">
    		<input type="hidden" name="resDate">
    		<input type="hidden" name="resTime">
	    	<table id="aside_table">
	    		<tr>
	    			<th>현재 시각</th>
	    			<td>
	    				<span id="nowDate"></span>
	    				<br>
	    				<span id="nowTime"></span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>서비스명</th>
	    			<td>
	    				<span id="service_ok"><%=service %></span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>예약 날짜</th>
	    			<td>
	    				<span id="date_ok"></span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>예약 시간</th>
	    			<td>
	    				<span id="time_ok"></span>
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>남기실 말씀</th>
	    			<td>
	    				<textarea id="sayArea" name="resWords" spellcheck="false" maxlength="50"></textarea>
	    			</td>
	    		</tr>
	    	</table>
		    <div class="reserveBtnDiv">
		    	<input type="button" class="reserveBtn" id="reserveBtn" value="예약하기">
		    </div>
	    </form>
    </div>
</div>
<%@ include file="/bottom.jsp" %>