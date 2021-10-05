<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.beauty.admin.member.AdminMemberDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.member.AdminMemberDAO"/>
<%
	String cb[] = request.getParameterValues("check");
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
                           					if (!(cb == null)) {
                           						for (int i = 0; i < cb.length; i++) {
                           							
    	                           					int no = Integer.parseInt(cb[i]);

    	                           					ArrayList<AdminMemberDTO> arr = dao.memberUpdateList(no);
													// 오류 수정 해야함 !!!    	               	
    	
    	                           					%>
    	                           						<tr>
	    		                               				<td><input type="checkbox" name="check" value=""></td>
	    		    	                                    <td class="content"><input type="text" value="<%= arr.get(i).getNo() %>" readonly="readonly" style="border:none;"></td>
	    		    	                                    <td class="content"><%= arr.get(i).getId() %></td>
	    		    	                                    <td class="content"><%= arr.get(i).getName() %></td>
	    		    	                                    <td class="content"><%= arr.get(i).getBirth() %></td>
	    		    	                                    <td class="content"><%= arr.get(i).getTel() %></td>
	    		    	                                    <td class="content"><%= arr.get(i).getGender() %></td>
	    		    	                                    <td class="content"><%= arr.get(i).getEmail() %></td>
	    		    	                                    <td class="content"><%= arr.get(i).getZipcod() %></td>
	    		    	                                    <td class="content"><%= arr.get(i).getAddress1() %><%= arr.get(i).getAddress2()%></td>
	    		    	                                    <td class="content"><%= arr.get(i).getRegdate() %></td>
	    		    	                                    <td class="content"><%= arr.get(i).getDormant() %></td>
                                                     	</tr>
    	    	                                    <%
    	                           					
    	                           				}
                           					} else {
                           						%>
                           							<script>
                           								alert('수정 할 회원을 체크해주세요!');
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
   	    	</form>	
  		</article>
	</section>
</main>
<%@ include file="/admin/index/footer.jsp" %>
</body>
</html>