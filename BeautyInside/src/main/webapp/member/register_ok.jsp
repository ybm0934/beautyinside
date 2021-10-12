<%@page import="com.beauty.member.MemberDTO"%>
<%@page import="com.beauty.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("password_ok");
	String name = request.getParameter("name");
	String birth = request.getParameter("birthday");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	int zipcode = Integer.parseInt(request.getParameter("zipcode"));
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	System.out.println("@@@@@@@@@@@@@tel : " + tel);
	
	MemberDTO memberDto = new MemberDTO();
	memberDto.setId(id);
	memberDto.setPwd(pwd);
	memberDto.setName(name);
	memberDto.setBirth(birth);
	memberDto.setGender(gender);
	memberDto.setEmail(email);
	memberDto.setTel(tel);
	memberDto.setZipcode(zipcode);
	memberDto.setAddress1(address1);
	memberDto.setAddress2(address2);
	MemberDAO memberDao = new MemberDAO();
	int cnt = memberDao.register(memberDto);
	
	if(cnt > 0) {
		%>
		<script>
			alert('회원가입을 축하합니다!');
			location.href = '/member/login.jsp';
		</script>
		<%
	}else {
		%>
		<script>
			alert('회원가입 실패!');
			location.href = '/member/login.jsp';
		</script>
		<%
	}
%>