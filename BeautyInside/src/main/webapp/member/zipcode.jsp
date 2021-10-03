<%@page import="com.beauty.zipcode.ZipcodeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beauty.zipcode.ZipcodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String address = request.getParameter("search");
	if(address == null) address = "";
	
	ZipcodeDAO zipDao = new ZipcodeDAO();
	ArrayList<ZipcodeDTO> list = zipDao.searchList(address);
	
	// 페이징 처리
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int totalRecord = list.size();
	int pageSize = 7;
	int blockSize = 1;
	int totalPage = (int) Math.ceil((double) totalRecord / pageSize);
	int firstPage = currentPage - ((currentPage - 1) % blockSize);
	int lastPage = firstPage + (blockSize - 1);
	int curPos = (currentPage - 1) * pageSize;
	int num = totalRecord - (curPos);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주소검색</title>
    <link rel="stylesheet" type="text/css" href="css/zipcode.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
		$(document).ready(function() {
			$('#cancel_spn').click(function() {
				$('#search').val('');
				$('#search').focus();
			});
			
			$('#search_spn').click(function() {
				if($('#search').val() != '') {
					$('form[name=zipcode]').submit();
				}
			});
			
		});
		
		function inputAddr(zipcode, address1){
			opener.register.zipcode.value = zipcode;
			opener.register.address1.value = address1;
			
			self.close();
		}
    </script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <form name="zipcode" method="post" action="<%=request.getContextPath() %>/member/zipcode.jsp">
            <div id="search_div">
                <input type="text" name="search" id="search" placeholder="주소를 입력하세요." spellcheck="false" autofocus="autofocus" value="<%=address %>">
                <span class="img_spn" id="cancel_spn">
                    <img src="/img/ico/cancel.png" alt="검색창 지우기">
                </span>
                <span class="img_spn" id="search_spn">
                    <img src="/img/ico/search.png" alt="검색하기">
                </span>
            </div>
            <div id="address_div_group">
            <%
            	if(list.size() == 0) {
            %>
                <div id="address_main">
                    <p class="tip">tip</p>
                    <p>아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.</p>
                    <p>도로명 + 건물번호</p>
                    <p class="ex_blue">예) 판교역로 235,  제주 첨단로 242</p>
                    <p>지역명(동/리) + 번지</p>
                    <p class="ex_blue">예) 삼평동 681,  제주 영평동 2181</p>
                    <p>지역명(동/리) + 건물명(아파트명)</p>
                    <p class="ex_blue">예) 분당 주공,  연수동 주공3차</p>
                    <p>사서함명 + 번호</p>
                    <p class="ex_blue">예) 분당우체국사서함 1~100</p>
                </div>
            <%
            	}else {
            		for(int i = 1; i <= pageSize; i++) {
            			if(num < 1) break;
            			ZipcodeDTO zipDto = list.get(curPos++);
            			num--;
           	%>
            	<!-- 반복문 시작 -->
                <div class="address_div">
                    <div>
                        <span class="zipcode"><%=zipDto.getZipcode() %></span>
                    </div>
                    <div>
                        <span class="street">도로명</span>
                        <% String addr = zipDto.getSido() + " " + zipDto.getSigungu() + " " + zipDto.getDoro() + " " + zipDto.getBuild_a(); %>
                        <span class="address_spn">
                        	<a href="#" onclick="inputAddr('<%=zipDto.getZipcode() %>', '<%=addr %>');"><%=addr %></a>
                        </span>
                    </div>
                    <div>
                        <span class="street">지 번</span>
                        <%
                        	String str = (zipDto.getDetaildong() == null) ? "" : zipDto.getDetaildong();
                        	addr = zipDto.getSido() + " " + zipDto.getSigungu() + " " + str + " " + zipDto.getEupkey();
                        %>
                        <span class="address_spn">
                        	<a href="#" onclick="inputAddr('<%=zipDto.getZipcode() %>', '<%=addr %>');"><%=addr %></a>
                        </span>
                    </div>
                </div>
            <%
            		}
                }
            %>
            <% 	if(list.size() > 0){%>
                <div class="paging_div">
                	<%if(currentPage > 1){ %>
                	<span class="pagemove">
                		<a href="<%=request.getContextPath() %>/member/zipcode.jsp?currentPage=<%=currentPage - 1%>&search=<%=address %>">&lt;</a>
                	</span>
                	<%} %>
                    <span><%=currentPage %> / <%=totalPage %></span>
                	<%if(currentPage < totalPage){ %>
                	<span class="pagemove">
                		<a href="<%=request.getContextPath() %>/member/zipcode.jsp?currentPage=<%=currentPage + 1%>&search=<%=address %>">&gt;</a>
                	</span>
                	<%} %>
                </div>
           	<%	} %>
            </div>
            <div id="footer">
                <span id="power">Powered by </span>
                <span>Beauty Inside.</span>
            </div>
        </form>
    </div>
</body>
</html>