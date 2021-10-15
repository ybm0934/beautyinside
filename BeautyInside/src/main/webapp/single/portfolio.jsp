<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<%@ include file="/top_a.jsp" %>
<link rel="stylesheet" type="text/css" href="/single/css/portfolio.css">
<div id="portfolio_div">
	<div id="wrap">
	    <table id="portfolio_table">
	        <tr>
	            <td class="moveTd">
	                <div class="moveDiv moveDiv1">
	                    <img src="/img/ico/left-arrow.png" id="left">
	                </div>
	            </td>
	            <td>
	                <div class="container">
	                    <ul class="inner">
	                    <%
	                	 // 이미지 폴더의 모든 사진 불러오기
	                	String path = "/img/portfolio/"; // 상대 경로
	                	String imgPath = application.getRealPath(path); //절대 경로

	                	File file = new File(imgPath);
	                	File[] files = file.listFiles();
	                	
	                    for(int i = 0; i < files.length; i++) {
	                		if(files[i].isFile()) {
	                			String fn = path + files[i].getName();
	                	%>
	                        <li>
	                            <img src="<%=fn %>">
	                        </li>
	                	<%
	                		}
	                    }
	                	%>
	                    </ul>
	                </div>
	            </td>
	            <td class="moveTd">
	                <div class="moveDiv moveDiv2">
	                    <img src="/img/ico/right-arrow.png" id="right">
	                </div>
	            </td>
	        </tr>
	    </table>
	</div>
</div>
<script>
    window.onload = function(){
        var move = 0;
        document.getElementById('left').addEventListener('click', function() {
            if(move == 0) return false;
            move += 100;
            document.querySelector('.container').style.transform = 'translate(' + move + '%)';
        });
        
        document.getElementById('right').addEventListener('click', function() {
            if(move == <%=(files.length - 1) * -100 %>) return false;
            move -= 100;
            document.querySelector('.container').style.transform = 'translate(' + move + '%)';
        });
    }
</script>
<%@ include file="/bottom.jsp" %>