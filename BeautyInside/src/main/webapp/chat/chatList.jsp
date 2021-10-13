<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.beauty.chat.ChatDTO"%>
<%@page import="com.beauty.chat.ChatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/chat/loginCheck.jsp" %>
<%
	if(cid != null) {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		System.out.println("@@@id : " + id);
		System.out.println("@@@name : " + name);
		
		SimpleDateFormat ndf = new SimpleDateFormat("a hh:mm");
		SimpleDateFormat odf = new SimpleDateFormat("yyyy.MM.dd a hh:mm");
		
		ChatDAO chatDao = new ChatDAO();
		ArrayList<ChatDTO> list = chatDao.chatList(id);
		
		if(list.size() != 0) {
%>
<div class="lastdateDiv">
	<span>마지막 대화 날짜 : <%=odf.format(list.get(0).getRegdate()) %></span>
</div>
<%		
			for(int i = 0; i < list.size(); i++) {
				ChatDTO chatDto = list.get(i);
				String str = chatDto.getContent().replace("\n", "<br>");
				
				if(!chatDto.getName().equals(name)) {
%>
<table class="chatPack">
    <tr>
        <th class="imgBox" rowspan="2">
            <img src="/img/ico/girl.png">
        </th>
        <td class="nameTd">
            <span><%=chatDto.getName() %></span>
        </td>
        <td class="dateBox" rowspan="2">
            <span class="dateSpn"><%=ndf.format(chatDto.getRegdate()) %></span>
        </td>
    </tr>
    <tr>
        <td>
            <p class="chatP chatP1"><%=str %></p>
        </td>
    </tr>
</table>
<%
				}else if(chatDto.getName().equals(name)) {
%>
<table class="chatPack">
    <tr>
        <td class="dateBox dateBox2" rowspan="2">
            <span class="dateSpn2"><%=ndf.format(chatDto.getRegdate()) %></span>
        </td>
        <td class="nameTd2">
            <span><%=chatDto.getName() %></span>
        </td>
        <th class="imgBox2" rowspan="2">
            <img src="/img/ico/boy.png">
        </th>
    </tr>
    <tr>
        <td>
            <p class="chatP chatP2"><%=str %></p>
        </td>
    </tr>
</table>
<%
				} // if
			} // for
		} // if
	} // if
%>