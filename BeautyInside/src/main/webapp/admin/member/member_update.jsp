<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.beauty.admin.member.AdminMemberDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.member.AdminMemberDAO"/>
<jsp:useBean id="dto" class="com.beauty.admin.member.AdminMemberDTO"/>
<%
	String[] cks = request.getParameterValues("check");

	ArrayList<AdminMemberDTO> arr = new ArrayList<>();
	String cb[] = request.getParameterValues("check");
	if(cb != null){
		dto.setCd(cb);
		arr = dao.memberUpdateList(dto);
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300&display=swap">
<link rel="stylesheet" type="text/css" href="/admin/css/reset.css">
<link rel="stylesheet" type="text/css" href="/admin/css/member_update.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>관리자페이지-회원수정</title>
</head>
<body>
<%@ include file="/admin/index/header.jsp" %>
<main>
	 <section>
        <article>
        	<h1 class="a">회원수정</h1>
        	<!-- 메인 테이블 -->
        	<form action="/admin/member/member_update_action.jsp" method="post">
          	<table class="back_table">
                <tr>
                    <td>
                        <div class="body_scroll">
                            <table class="body_table">
                                <colgroup>
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
                           					if ((arr.size() > 0)) {
                           						for (int i = 0; i < arr.size(); i++) {
    	                           					%>
    	                           						<tr>	    		                               				
	    		    	                                    <td class="content"><input type="text" name="no" value="<%= arr.get(i).getNo() %>" readonly="readonly" style="width:30px; text-align: center;"></td>
	    		    	                                    <td class="content"><input type="text" name="id" value="<%= arr.get(i).getId() %>" readonly="readonly" style="width:50px; text-align: center;"></td>
	    		    	                                    <td class="content"><input type="text" name="name" value="<%= arr.get(i).getName()%>" style="width:50px; text-align: center"></td>
	    		    	                                    <td class="content"><input type="text" name="birth" value="<%= arr.get(i).getBirth()%>" style="width:80px; text-align: center"></td>
	    		    	                                    <td class="content"><input type="text" name="tel" value="<%= arr.get(i).getTel()%>" style="width:100px; text-align: center"></td>
	    		    	                                    <td class="content"><input type="text" name="gender" value="<%= arr.get(i).getGender()%>" style="width:32px; text-align: center"></td>
	    		    	                                    <td class="content"><input type="text" name="email" value="<%= arr.get(i).getEmail()%>" style="width:120px; text-align: center"></td>
	    		    	                                    <td class="content"><input type="text" name="zipcode" value="<%= arr.get(i).getZipcode()%>" style="width:65px; text-align: center"></td>
	    		    	                                    <td class="content"><input type="text" name="address1" value="<%= arr.get(i).getAddress1()%>" style="width:250px; text-align: center; border: 1px solid; border-right: none; "><input type="text" name="address2" value="<%= arr.get(i).getAddress2()%>" style="width:150px; text-align: center; border: 1px solid; border-left: none;"></td>
	    		    	                                    <td class="content"><input type="text" name="regdate" value="<%= arr.get(i).getRegdate()%>" style="width:80px; text-align: center"></td>
	    		    	                                    <td class="content"><input type="text" name="dormant" value="<%= arr.get(i).getDormant()%>" style="width:20px; text-align: center"></td>
                                                     	</tr>
    	    	                                    <%
    	                           				}
                           					} else {
                           						%>
                           							<script>
                           								alert('수정할 회원을 체크해주세요!');
                           								history.back();
                           							</script>
                           						<%
                           					}
                           				%>
                              </tbody>
                          </table>
                      </div>
                	</td>
            	</tr>
          	</table>
          	<div class="update_btn">
          		<input type="reset" value="되돌리기">
          		<input type="submit" value="수정하기">
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