<%@page import="org.ietf.jgss.Oid"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- JSTL 버젼으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다. --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천사이트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="../CSS/siteBoard.css" rel="stylesheet" type="text/css">
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
</head>

<body>
	<!-- 헤더 부분 입니다. -->
	<jsp:include page="../header.jsp" />
	<script src="../JS/header.js"></script>
	<!---------------------------------->
	<br>

	<div class="container">
		<h4>추천사이트</h4>
		<br>

		<div class='row'>


			<span class="card align-middle"> <img class="card_img" alt="can i use"
				src="../image/can_i_use.PNG"> <span class="card_text">드림코딩
					CSS레이아웃정리편</span><br>
				<button class="site_btn"
					onclick="location.href='https://caniuse.com/'">Can i use</button>

			</span> <span class="card"> <img class="card_img" alt="Css Diner"
				src="../image/CSS_Diner.PNG"> <span class="card_text">CSS
					SELECTOR 연습할 수 있는 접시 게임</span><br>
				<button class="site_btn"
					onclick="location.href='https://flukeout.github.io/'">Css
					Diner</button>
			</span> <span class="card"> <img class="card_img" alt="jsbin"
				src="../image/jsbin.PNG"> <span class="card_text">인터넷으로
					사용할 수 있는 비쥬얼스튜디오코드 사스버전</span><br>
				<button class="site_btn"
					onclick="location.href='http://jsbin.com/?html,output'">jsbin</button>
			</span> <span class="card"> <img class="card_img"
				alt="CSS tricks for flex box" src="../image/CSS_TRICKS.PNG"> <span
				class="card_text">드림코딩 CSS FLEXBOX 강의</span><br>
				<button class="site_btn"
					onclick="location.href='https://css-tricks.com/snippets/css/a-guide-to-flexbox/'">CSS
					TRICKS</button>
			</span>

		</div>

<div class='row'>
		<span class="card"> <img class="card_img" alt="FLEXBOX FROGGY"
			src="../image/FLEXBOX FROGGY.PNG"> <span class="card_text">flexbox
				개념 이해 도와주는 게임</span><br>
			<button class="site_btn"
				onclick="location.href='https://flexboxfroggy.com/#ko'">FLEXBOX
				FROGGY</button>
		</span> <span class="card"> <img class="card_img" alt="Google fonts"
			src="../image/Google_font.PNG"> <span class="card_text">무료로
				사용할 수 있는 google 지원 폰트 사이트</span><br>
			<button class="site_btn"
				onclick="location.href='https://fonts.google.com/?sidebar.open&selection.family=Anton'">Google
				fonts</button>
		</span> <span class="card"> <img class="card_img" alt="Font Awesome"
			src="../image/Font Awesome.PNG"> <span class="card_text">아이콘
				무료로 사용 할 수 있는 사이트</span><br>
			<button class="site_btn"
				onclick="location.href='https://fontawesome.com/'">Font
				Awesome</button>
		</span> <span class="card"> <img class="card_img" alt="PoiemaWeb"
			src="../image/PoiemaWeb.PNG"> <span class="card_text">frontend
				관련 문제들 질문들 사이트틀 정리 되어 있는 웹</span><br>
			<button class="site_btn"
				onclick="location.href='https://poiemaweb.com/'">PoiemaWeb</button>
		</span> 
		</div>
		
		<div class='row'>
		
		<span class="card"> <img class="card_img"
			alt="developer-roadmap" src="../image/developer-roadmap.PNG"> <span
			class="card_text">프론트 앤드 관련 로드맵 정리 되어 있는 깃</span><br>
			<button class="site_btn"
				onclick="location.href='https://github.com/kamranahmedse/developer-roadmap'">developer-roadmap</button>
		</span> <span class="card"> <img class="card_img" alt="flticon"
			src="../image/flticon.PNG"> <span class="card_text">png
				이미지들 무료로 다운받아 사용할 수 있는 사이트</span><br>
			<button class="site_btn"
				onclick="location.href='https://www.flaticon.com/'">flticon</button>
		</span> <span class="card"> <img class="card_img" alt="sweetalert2"
			src="../image/sweetalert2.PNG"> <span class="card_text">modal을
				연습할 수 있는 사이트</span><br>
			<button class="site_btn"
				onclick="location.href='https://sweetalert2.github.io/#examples'">sweetalert2</button>
		</span>
		
		</div>
		
	</div>
	</div>
</body>
</html>