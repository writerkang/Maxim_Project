<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="../CSS/notice_content.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2 style="width: 85%; margin: 10px auto;">공지사항</h2>

    <div id="content">
        <span id="notice_title">
            ${list[0].post_subject}
        </span>
        <span id="notice_date">
            ${list[0].post_regdate }
        </span>
        <hr>
        <div id="notice_content">
			${list[0].post_content}
        </div>
    </div>

    <button type="button" id="back_btn" onclick = "location.href = 'noticeBoardList.po' ">목록으로</button>
    <br>
    <hr style="clear: both;">
</body>
</html>