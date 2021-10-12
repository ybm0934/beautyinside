<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>::Beauty Inside:: 상담원 챗</title>
    <link rel="stylesheet" type="text/css" href="/chat/css/chatList.css">
</head>
<body>
<div id="temp">

    <div id="wrap">
        <div class="topDiv">
            <span class="targetSpn">비비빅님과의 대화</span>
        </div>
        <div class="topDiv">
            <span class="todaySpn">2021년 10월 30일</span>
        </div>
        
        <div class="listDiv">
            <table class="chatPack">
                <tr>
                    <th class="imgBox" rowspan="2">
                        <img src="/img/ico/girl.png">
                    </th>
                    <td class="nameTd">
                        <span>관리자</span>
                    </td>
                    <td class="dateBox" rowspan="2">
                        <span class="dateSpn">2020.12.31</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p class="chatP chatP1">
                            안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.
                        </p>
                    </td>
                </tr>
            </table>
            <table class="chatPack">
                <tr>
                    <td class="dateBox dateBox2" rowspan="2">
                        <span class="dateSpn">2012.01.01</span>
                    </td>
                    <td class="nameTd2">
                        <span>비비빅</span>
                    </td>
                    <th class="imgBox2" rowspan="2">
                        <img src="/img/ico/boy.png">
                    </th>
                </tr>
                <tr>
                    <td>
                        <p class="chatP chatP2">
                            안녀아숑.
                        </p>
                    </td>
                </tr>
            </table>
        </div>

        <div id="sendDiv">
            <div id="textareaDiv">
                <textarea name="" id="writeArea" spellcheck="false"></textarea>
            </div>
            <div id="buttonDiv">
                <input type="button" id="sendBtn" value="전송">
            </div>
        </div>
    </div>
    
    </div>
</body>
</html>