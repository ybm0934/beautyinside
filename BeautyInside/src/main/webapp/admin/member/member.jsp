<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@300&display=swap">
<link rel="stylesheet" type="text/css" href="/admin/css/reset.css">
<link rel="stylesheet" type="text/css" href="/admin/css/member.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>관리자페이지-회원관리</title>
</head>
<body>
<%@ include file="/admin/index/header.jsp" %>
<main>
    <section>
        <article>
        	<h1>회원관리</h1>
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
                                    <col style="width: 200px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 500px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 80px;" />
                                </colgroup>
                                <thead>
	                                <tr class="b1" valign="middle">
	                                    <th></th>
	                                    <th>회원번호</th>
	                                    <th>아이디</th>
	                                    <th>이름</th>
	                                    <th>생년월일</th>
	                                    <th>전화번호</th>
	                                    <th>이메일</th>
	                                    <th>우편번호</th>
	                                    <th>주소</th>
	                                    <th>가입일</th>
	                                    <th>휴면여부</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td><input type="checkbox" name="check" value="100"></td>
	                                    
	                                    <td class="content right_border" >100</td>
	                                    <td class="content right_border" >hong</td>
	                                    <td class="content right_border" >홍길동</td>
	                                    <td class="content right_border" >701012</td>
	                                    <td class="content right_border" >010-1324-4578</td>
	                                    <td class="content right_border" >hong@naver.com</td>
	                                    <td class="content right_border" >456-787</td>
	                                    <td class="content right_border" >서울특별시 성북구 이젠동 이젠아파트 101동 101호</td>
	                                    <td class="content right_border" >2021-10-01</td>
	                                    <td class="content right_border" >N</td>
	                                </tr>
	                                                                <tr>
	                                    <td><input type="checkbox" name="check"></td>
	                                    <td class="content right_border" >100</td>
	                                    <td class="content right_border" >hong</td>
	                                    <td class="content right_border" >홍길동</td>
	                                    <td class="content right_border" >701012</td>
	                                    <td class="content right_border" >010-1324-4578</td>
	                                    <td class="content right_border" >hong@naver.com</td>
	                                    <td class="content right_border" >456-787</td>
	                                    <td class="content right_border" >서울특별시 성북구 이젠동 이젠아파트 101동 101호</td>
	                                    <td class="content right_border" >2021-10-01</td>
	                                    <td class="content right_border" >N</td>
	                                </tr>
	                                                                <tr>
	                                    <td><input type="checkbox" name="check"></td>
	                                    <td class="content right_border" >100</td>
	                                    <td class="content right_border" >hong</td>
	                                    <td class="content right_border" >홍길동</td>
	                                    <td class="content right_border" >701012</td>
	                                    <td class="content right_border" >010-1324-4578</td>
	                                    <td class="content right_border" >hong@naver.com</td>
	                                    <td class="content right_border" >456-787</td>
	                                    <td class="content right_border" >서울특별시 성북구 이젠동 이젠아파트 101동 101호</td>
	                                    <td class="content right_border" >2021-10-01</td>
	                                    <td class="content right_border" >N</td>
	                                </tr>
	                                                                <tr>
	                                    <td><input type="checkbox" name="check"></td>
	                                    <td class="content right_border" >100</td>
	                                    <td class="content right_border" >hong</td>
	                                    <td class="content right_border" >홍길동</td>
	                                    <td class="content right_border" >701012</td>
	                                    <td class="content right_border" >010-1324-4578</td>
	                                    <td class="content right_border" >hong@naver.com</td>
	                                    <td class="content right_border" >456-787</td>
	                                    <td class="content right_border" >서울특별시 성북구 이젠동 이젠아파트 101동 101호</td>
	                                    <td class="content right_border" >2021-10-01</td>
	                                    <td class="content right_border" >N</td>
	                                </tr>
	                                                                <tr>
	                                    <td><input type="checkbox" name="check"></td>
	                                    <td class="content right_border" >100</td>
	                                    <td class="content right_border" >hong</td>
	                                    <td class="content right_border" >홍길동</td>
	                                    <td class="content right_border" >701012</td>
	                                    <td class="content right_border" >010-1324-4578</td>
	                                    <td class="content right_border" >hong@naver.com</td>
	                                    <td class="content right_border" >456-787</td>
	                                    <td class="content right_border" >서울특별시 성북구 이젠동 이젠아파트 101동 101호</td>
	                                    <td class="content right_border" >2021-10-01</td>
	                                    <td class="content right_border" >N</td>
	                                </tr>
	                                                                <tr>
	                                    <td><input type="checkbox" name="check"></td>
	                                    <td class="content right_border" >100</td>
	                                    <td class="content right_border" >hong</td>
	                                    <td class="content right_border" >홍길동</td>
	                                    <td class="content right_border" >701012</td>
	                                    <td class="content right_border" >010-1324-4578</td>
	                                    <td class="content right_border" >hong@naver.com</td>
	                                    <td class="content right_border" >456-787</td>
	                                    <td class="content right_border" >서울특별시 성북구 이젠동 이젠아파트 101동 101호</td>
	                                    <td class="content right_border" >2021-10-01</td>
	                                    <td class="content right_border" >N</td>
	                                </tr>
	                                                                <tr>
	                                    <td><input type="checkbox" name="check"></td>
	                                    <td class="content right_border" >100</td>
	                                    <td class="content right_border" >hong</td>
	                                    <td class="content right_border" >홍길동</td>
	                                    <td class="content right_border" >701012</td>
	                                    <td class="content right_border" >010-1324-4578</td>
	                                    <td class="content right_border" >hong@naver.com</td>
	                                    <td class="content right_border" >456-787</td>
	                                    <td class="content right_border" >서울특별시 성북구 이젠동 이젠아파트 101동 101호</td>
	                                    <td class="content right_border" >2021-10-01</td>
	                                    <td class="content right_border" >N</td>
	                                </tr>
	                                                                <tr>
	                                    <td><input type="checkbox" name="check"></td>
	                                    <td class="content right_border" >100</td>
	                                    <td class="content right_border" >hong</td>
	                                    <td class="content right_border" >홍길동</td>
	                                    <td class="content right_border" >701012</td>
	                                    <td class="content right_border" >010-1324-4578</td>
	                                    <td class="content right_border" >hong@naver.com</td>
	                                    <td class="content right_border" >456-787</td>
	                                    <td class="content right_border" >서울특별시 성북구 이젠동 이젠아파트 101동 101호</td>
	                                    <td class="content right_border" >2021-10-01</td>
	                                    <td class="content right_border" >N</td>
	                                </tr>
	                                                                <tr>
	                                    <td><input type="checkbox" name="check"></td>
	                                    <td class="content right_border" >100</td>
	                                    <td class="content right_border" >hong</td>
	                                    <td class="content right_border" >홍길동</td>
	                                    <td class="content right_border" >701012</td>
	                                    <td class="content right_border" >010-1324-4578</td>
	                                    <td class="content right_border" >hong@naver.com</td>
	                                    <td class="content right_border" >456-787</td>
	                                    <td class="content right_border" >서울특별시 성북구 이젠동 이젠아파트 101동 101호</td>
	                                    <td class="content right_border" >2021-10-01</td>
	                                    <td class="content right_border" >N</td>
	                                </tr>
	                                                                <tr>
	                                    <td><input type="checkbox" name="check"></td>
	                                    <td class="content right_border" >100</td>
	                                    <td class="content right_border" >hong</td>
	                                    <td class="content right_border" >홍길동</td>
	                                    <td class="content right_border" >701012</td>
	                                    <td class="content right_border" >010-1324-4578</td>
	                                    <td class="content right_border" >hong@naver.com</td>
	                                    <td class="content right_border" >456-787</td>
	                                    <td class="content right_border" >서울특별시 성북구 이젠동 이젠아파트 101동 101호</td>
	                                    <td class="content right_border" >2021-10-01</td>
	                                    <td class="content right_border" >N</td>
	                                </tr>
	                                                                <tr>
	                                    <td><input type="checkbox" name="check"></td>
	                                    <td class="content right_border" >100</td>
	                                    <td class="content right_border" >hong</td>
	                                    <td class="content right_border" >홍길동</td>
	                                    <td class="content right_border" >701012</td>
	                                    <td class="content right_border" >010-1324-4578</td>
	                                    <td class="content right_border" >hong@naver.com</td>
	                                    <td class="content right_border" >456-787</td>
	                                    <td class="content right_border" >서울특별시 성북구 이젠동 이젠아파트 101동 101호</td>
	                                    <td class="content right_border" >2021-10-01</td>
	                                    <td class="content right_border" >N</td>
	                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="selectAll_btn">
                <input type="button" value="전체선택" onclick="selectAll()">
                <script>
                	function selectAll() {
						$('[name=check]').prop('checked', true);
					}
                </script>
                <input type="button" value="전체해제" onclick="selectRelease()">
                <script>
                	function selectRelease() {
						$('[name=check]').prop('checked', false);
					}
                </script>
                <div class="delete_btn">
            		<input type="button" value="삭제">
            	</div>
            </div>
            <div class="page_btn">
            	<a href="">이전</a>
                <a href="">1</a>
                <a href="">다음</a>
            </div>
            <form>
	            <div class="select_search">
	            	<select>
	            		<option>이름</option>
	            		<option>아이디</option>
	            		<option>생년월일</option>
	            		<option>주소</option>
	            	</select>
	            	<input type="text" class="text_search">
	            	<input type="image" src="/admin/img/icon_magnifier_black.png">
	           	</div>
	        </form>
        </article>
    </section>
</main>
<%@ include file="/admin/index/footer.jsp" %>    
</body>
</html>