<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#main_a').click(function(){
			location.href = '<%=request.getContextPath() %>/main.jsp';	
		});
		
		$('#about_a').click(function(){
			location.href = '<%=request.getContextPath() %>/main.jsp?target=#about';
		});
		
		$('#service_a').click(function(){
			location.href = '<%=request.getContextPath() %>/main.jsp?target=#service';
		});
		
		$('#portfolio_a').click(function(){
			location.href = '<%=request.getContextPath() %>/single/portfolio.jsp';
		});
		
		$('#contact_a').click(function(){
			location.href = '<%=request.getContextPath() %>/main.jsp?target=#contact';
		});
	});
</script>