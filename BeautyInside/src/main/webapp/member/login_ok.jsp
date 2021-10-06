<%@page import="java.time.LocalTime"%>
<%@page import="com.beauty.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String saveid = request.getParameter("saveid");
	System.out.println("saveid : " + saveid);
	
	MemberDAO memberDao = new MemberDAO();
	int n = memberDao.login(id, pwd);
	
	if(n == memberDao.LOGIN_OK) {
		// 세션 생성
		session.setAttribute("userid", id); // 로그인 아이디
		session.setAttribute("logtime", System.currentTimeMillis()); // 로그인 시간 기록
		session.setMaxInactiveInterval(60 * 10 + 2); // 세션 만료 시간 10분 + 새로고침 딜레이 2초
		
		// 아이디 저장하기 체크
		if(saveid.equals("true")) {
			Cookie ck = new Cookie("saveid", id);
			ck.setMaxAge(60 * 60 * 24 * 100); // 100일 저장
			ck.setPath("/");
			response.addCookie(ck);
		}else {
			Cookie[] cks = request.getCookies();
			
			if(cks != null){
				for(int i = 0; i < cks.length; i++) {
					String ckName = cks[i].getName();
					
					if(ckName.equals("saveid")) {
						cks[i].setMaxAge(0);
						cks[i].setPath("/");
						response.addCookie(cks[i]);
						
						break;
					}
				}// for
			}// if
		}// if
		
		%>
		<script>
			location.href = '/main.jsp';
		</script>
		<%
	}else {
		%>
		<p>아이디 혹은 비밀번호가 잘못되었습니다.</p>
		<%
	}
%>