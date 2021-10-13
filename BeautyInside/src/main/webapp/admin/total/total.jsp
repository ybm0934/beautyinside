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
<%@page import="java.util.ArrayList"%>
<%@ page import="com.beauty.admin.total.AdminTotalDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.total.AdminTotalDAO"></jsp:useBean>
<%
	String year = request.getParameter("year");
	if (year == null) {
		year = "2021";
	}
	ArrayList<String> arr = dao.serviceList(year);
	
	String date = request.getParameter("date");
	
	if (!(date == null)) {
		// 서비스건수
		int service = dao.serviceCount(date);
		// 매출액
		int take = dao.take(date);
		// 가입수
		int joinCount = dao.joinCount(date);
		// 리뷰수
		int reviewCount = dao.reviewCount(date);
		
		dao.dateSearch(date, service, take, joinCount, reviewCount);	
	}
	
	ArrayList<AdminTotalDTO> list = dao.datelist();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300&display=swap">
<link rel="stylesheet" type="text/css" href="/admin/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/admin/total/css/total.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>관리자페이지-통합관리</title>
</head>
<body>
<%@ include file="../index/header.jsp" %>
	<h1 class="a">통합관리</h1>
    <div style="float: left">
        <h2 style="margin-top: 50px; margin-bottom: 10px">서비스 통계</h2>
        <form name="year_fm" action="../total/total.jsp">
		<div style="text-align: center">
	        <select name="year" id=year onchange="yearsend()" style="width: 100px; text-align: center">
	        	<option value="2021" selected="selected">2021년</option>
	        	<option value="2020">2020년</option>
	        	<option value="2019">2019년</option>
	        	<option value="2018">2018년</option>
	        </select>
	        <script type="text/javascript">
				let flag = '<%= year %>';
				$('#year').val(flag);
	        </script>
        <script type="text/javascript">
        	function yearsend() {
				document.year_fm.submit();
			}
        </script>
        </div>
        </form>
        <table>
            <tbody>
                <tr>
                    <th style="width: 33%">젤 매니큐어</th>
                    <th style="border-left: 1px solid black; border-right: 1px solid black;">페디큐어</th>
                    <th>네일아트</th>
                </tr>
                <tr style="border-bottom: 0.5px solid gray;">
                    <td><%= arr.get(1) %>회</td>
                    <td style="border-left: 1px solid black; border-right: 1px solid black;"><%= arr.get(2) %>회</td>
                    <td><%= arr.get(3) %>회</td>
                </tr>
                <tr>
                    <th>매니큐어 손질</th>
                    <th style="border-left: 1px solid black; border-right: 1px solid black;">퓨어 클렌징</th>
                    <th>퓨어 마사지</th>
                </tr>
                <tr style="border-bottom: 0.5px solid gray;">
                    <td><%= arr.get(4) %>회</td>
                    <td style="border-left: 1px solid black; border-right: 1px solid black;"><%= arr.get(5) %>회</td>
                    <td><%= arr.get(6) %>회</td>
                </tr>
                <tr>
                    <th colspan="3">수분공급<th>
                </tr>
                <tr>
                    <td colspan="3"><%= arr.get(0) %>회</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div>
        <h2 style="margin-top: 65px; margin-bottom: 32px; margin-right: 40px">일자별 요약</h2>
        <table>
            <thead>
                <tr style="height: 20px">
                    <th>일자</th>
                    <th>서비스</th>
                    <th>매출액</th>
                    <th>가입</th>
                    <th>리뷰</th>
                </tr>
            </thead>
            <tbody>
            	<%
            		for (int i = 0; i < list.size(); i++) {
            			%>
            				 <tr style="border-bottom: 0.5px solid black;">
			                    <td><%= list.get(i).getRegdate().substring(0,10) %></td>
			                    <td><%= list.get(i).getService() %>회</td>
			                    <td><%= list.get(i).getTake() %>원</td>
			                    <td><%= list.get(i).getUserjoin() %>명</td>
			                    <td><%= list.get(i).getReview() %>건</td>
			                </tr>
            			<%
            		}
            	%>
            </tbody>
        </table>
    </div>
    <form name="search" action="../total/total.jsp">
    <div class="search">
    	<input type="button" style="width:100px; height:25px; color: white; background-color: #ff4040; border:none; margin-right: 50px" value="검색 초기화" onclick="location.href='../total/total_delete_action.jsp'">
    	<input type="text" name="date" placeholder="ex) 20201225">
 		<span id="search_btn" style="margin-left: 10px;">
			<img src="/admin/img/icon_magnifier_black.png">
		</span>
    </div>
    </form>
   	<script>
		$(document).ready(function () {
			$('#search_btn').click(function () {
				$('form[name=search]').submit();
			});
		});
	</script>
<%@ include file="../index/footer.jsp" %>
</body>
</html>