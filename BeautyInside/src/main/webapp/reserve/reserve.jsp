<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/top.jsp" %> --%>
<%-- <%@ include file="/top_a.jsp" %> --%>
<%
	request.setCharacterEncoding("UTF-8");

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
	
	String now = year + "년 " + (month + 1) + "월";
	
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#prevMonth').click(function(){
			$('input[name=year]').val(<%=prevY %>);
			$('input[name=month]').val(<%=prevM %>);
			$('form[name=reserve]').submit();
		});
		
		$('#nextMonth').click(function(){
			$('input[name=year]').val(<%=nextY %>);
			$('input[name=month]').val(<%=nextM %>);
			$('form[name=reserve]').submit();
		});
	});
	
	// 캘린더 선택
	function revDate(year, month, date) {
		$(document).ready(function(){
			$('#reserve_table a').removeClass('selected');
			$('#a' + date).addClass('selected');
			$('#date_ok').html(year + '년 ' + month + '월 ' + date + '일');
		});
	}// revDate
	
	// 시간 선택
	function revTime(hour, minute) {
		$(document).ready(function(){
			$('#time_div a').removeClass('selected');
			$('#ta' + hour + minute).addClass('selected');
			$('#time_ok').html(hour + ':' + minute);
		});
	}// revTime
</script>
<link rel="stylesheet" type="text/css" href="/reserve/css/reserve.css">
<div id="reserve_div">
<form name="reserve" method="post" action="/reserve/reserve.jsp">
	<input type="hidden" name="year"> 
	<input type="hidden" name="month"> 
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
	        		<a href="#" class="dateA" id="a<%=cr.get(Calendar.DATE) %>" onclick="revDate('<%=cr.get(Calendar.YEAR)%>', '<%=cr.get(Calendar.MONTH) %>', '<%=cr.get(Calendar.DATE) %>')">
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
   				<a href="#" class="timeA" id="ta<%=i %><%=str %>" onclick="revTime('<%=i %>', '<%=str %>')">
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
    <div id="aside_div">
    	<table id="aside_table">
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
    			<th>서비스명</th>
    			<td>
    				<span id="service_ok"></span>
    			</td>
    		</tr>
    		<tr>
    			<th>남기실 말씀</th>
    			<td>
    				<textarea id="sayArea" spellcheck="false"></textarea>
    			</td>
    		</tr>
    	</table>
    </div>
</form>
</div>
<%-- <%@ include file="/bottom.jsp" %> --%>