<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="../CSS/notice_content.css" rel="stylesheet" type="text/css">
    <script src="https://use.fontawesome.com/afbd8941a0.js"></script>
    <link rel="stylesheet" href="../CSS/footer.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="../CSS/notice_content.css" rel="stylesheet" type="text/css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link rel="stylesheet" href="../CSS/header.css">
    
    <title>공지사항</title>
    

</head>

<body>
	<!-- 헤더 부분 입니다. -->
	<jsp:include page="../header.jsp" />
	<script src="../JS/header.js"></script>





	<div class="body">
    <h1 class="header">공지사항</h1>
	
    <div id="content">
        <span id="notice_title" class="title">
            ${list[0].post_subject}
        </span>
        <span id="notice_date" class="title">
            ${list[0].post_regdate }
        </span>
        
        <hr>
        
        <div id="notice_content">
			${list[0].post_content}
        </div>
    </div>

    <button type="button" id="back_btn" onclick = "location.href = 'noticeBoardList.po' ">목록</button>
    <br><br>
    <hr style="clear: both; display:none">
</div>
<footer class="ft_white">
        <div class="ft_link">
            <ul class="ft_link-ul">
                <li class="about">
                    <p>ABOUT SYSOUT FROM MAXIM</p>
                </li>
                <p class="snsicon">
                    <i class="fab fa-instagram fa-3x"></i>
                    <i class="fab fa-facebook-square fa-3x"></i>
                </p>
            </ul>

            <div class="div-call">
                <p class="call">문의전화</p>
                <p class="callnumber">
                    <strong class="tel">1588-5890</strong>
                    <a class="teltime">(평일 09:00 ~ 18:00)</a>
                </p>
                <p class="ars">
                    <span>
                        <i class="fas fa-phone-volume"></i>
                        <a class="ico_ars">ARS 안내</a>
                    </span>
                </p>
            </div>
            <div class="logo">
                <img>
                <p>SYSOUT</p>
                <p>SONSORED BY KOREAIT</p>
            </div>
        </div>
        <hr>
        <div class="ft_info">
            <a href="#">이용약관</a>
            <a href="#"><Strong>개인정보처리방침</Strong></a>
            <a href="#">광고문의</a>
        </div>
        <hr>
        <div class="ft_addr1">
            <a>(주)코리아아이티</a>
            <a>서울특별시 강남구 테헤란로 146 (역삼동)</a>
            <a>대표자 : 이강혁</a>
        </div>
        <div class="ft_addr2">
            <a>사업자등록번호 : 123-12-12345</a>
            <a>개인정보보호책임자 : 이예지</a>
            <a>문의전화 : 1588-5890</a>
        </div>
        <div class="ft_addr3">
            <p class="copy">© 2020 MAXIM KOREAIT ACADEMY. ALL RIGHTS RESERVED</p>
        </div>
    </footer>
</body>
</html>