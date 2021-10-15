<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="com.beauty.admin.member.AdminMemberDAO"/>
<jsp:useBean id="dto" class="com.beauty.admin.member.AdminMemberDTO"/>
<%
	String no[] = request.getParameterValues("no");
	String name[] = request.getParameterValues("name");
	String birth[] = request.getParameterValues("birth");
	String tel[] = request.getParameterValues("tel");
	String gender[] = request.getParameterValues("gender");
	String email[] = request.getParameterValues("email");
	String zipcode[] = request.getParameterValues("zipcode");
	String address1[] = request.getParameterValues("address1");
	String address2[] = request.getParameterValues("address2");
	String regdate[] = request.getParameterValues("regdate");
	String dormant[] = request.getParameterValues("dormant");
	
	dto.setNo_update(no);
	dto.setName_update(name);
	dto.setBirth_update(birth);
	dto.setTel_update(tel);
	dto.setGender_update(gender);
	dto.setEmail_update(email);
	dto.setZipcode_update(zipcode);
	dto.setAddress1_update(address1);
	dto.setAddress2_update(address2);
	dto.setRegdate_update(regdate);
	dto.setDormant_update(dormant);
	// 구데기 로직
	String msg = "";
	String msg2 = "";
	int result[] = new int [10];
	for (int i = 0; i < no.length; i++) {
		int num = dao.memberUpdate(no[i], name[i], birth[i], tel[i], gender[i], email[i], zipcode[i], address1[i], address2[i], regdate[i], dormant[i]);
		System.out.print("num  = " + num);
			result[i] = num; 
		if (num == 0) {
			msg2 = "입력이 안된 곳이 있습니다!";
		} else {
			msg = "회원 수정 완료!";
		}
	}
	if (!msg2.equals("")) {
		%>
			<script>
			alert('<%= msg2 %>');
			history.back();
			</script>
		<%
	} else {
		%>
			<script>
				alert('<%= msg %>');
				location.href='../member/member.jsp';
			</script>
		<%
	}
%>