<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="css/chatList.css">
</head>
<body>
<div id="temp">

<div id="wrap">
    <div id="todayDiv">
        <span id="todaySpn">1234 56 78</span>
    </div>
    <div id="listDiv">
        <table class="chatPack_you">
            <tr class="imgBox">
                <th rowspan="2">
                    <img src="/img/ico/girl.png">
                </th>
                <td class="nameTd">
                    <span class="nameSpn">관리자</span>
                </td>
            </tr>
            <tr class="chatBox">
                <td class="chatTd">
                    <p class="chatP">안녕하세요. 무엇을 도와드릴까요?안녕하세요. 무엇을 도와드릴까요?</p>
                </td>
                <td>
                    <span class="dateSpn">2020.12.31</span>
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