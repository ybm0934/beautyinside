<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div>
        <div>
            <input type="button" value="버튼 1">
        </div>
        <table>
            <thead>
            	<tr>
                    <th>예약번호</th>
                    <th colspan="3">예약자 정보</th>
                    <th>서비스</th>
                    <th>상태</th>
                    <th>예약날짜</th>
                    <th>등록날짜</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td rowspan="3">1</td>
                    <th>예약자</th>
                    <td colspan="2">김예약</td>
                    <td rowspan="3">네일아트</td>
                    <td rowspan="3">예약중</td>
                    <td rowspan="3">2021-11-11</td>
                    <td rowspan="3">2021-10-11</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td colspan="2">asda@naver.com</td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td colspan="2">010-1234-5678</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>