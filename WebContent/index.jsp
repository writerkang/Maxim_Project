<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="ko">
<script src="https://use.fontawesome.com/afbd8941a0.js"></script>
<head>
	<meta charset="utf-8">
	<meta name="viewport"content="width=device-width,initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<title>Hello Sysout!</title>
	<link rel="stylesheet" href="CSS/bootstrap.css">
	<link rel="stylesheet" href="CSS/index.css">
	<link rel="stylesheet" href="CSS/site.css">
	<link rel="stylesheet" href="CSS/footer.css">
	
</head>
<body>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><div class="nav-article">
		<nav>
			<ul class="nav nav justify-content-end ">
				
					<!-- 로그인 전 (세션에 user_email 이 없으면 로그인 해야함.-->
		<!-- 로그인 후 (세션저장됨)-->
      <c:choose>
		<c:when test="${sessionScope.userDto[0].user_email == null }">
      		<li><button id="login" type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/User/login.uo'" >로그인</button></li>
		</c:when>
		<c:when test="${userDto[0].user_email != null }">
      		<li><button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/User/logout.uo'" id="logout">로그아웃</button></li>
			<li class="nav-item "><a class="nav-link active" onclick="location.href='${pageContext.request.contextPath}/User/mypageView.uo?user_uid=${sessionScope.userDto[0].user_uid}'">마이페이지</a></li> 
		</c:when>
      </c:choose>
				
			</ul>
		</nav>
		<h1 class="logo">
			<span>S</span><span>y</span><span>s</span><span>o</span><span>u</span><span>t</span>
		</h1>
		<p class="text"> 
			<span>개발자들을 위한 커뮤니티 사이트 sysout. 코딩하며 막혔던 부분에 대한 질문도 하고 본인만의 꿀팁들을 </span><span>공유</span><span>하세요.</span></p>
		<article>
			<div class="container">
				<div class="card">
					<div class="face face1">
						<div class="content">
							<img src="image/identity.png">
							<h3>사이트추천게시판</h3>
						</div>
					</div>
					<div class="face face2">
						<div class="content">
							<p>매번 필요한 기능 구글링 하기 귀찮으셨죠? 저희가 다 모아놨어요 :)</p>
								<a href="Board/siteBoardList.jsp">사이트추천게시판이동</a>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="face face1">
						<div class="content">
							<img src="image/thinking.png">
							<h3>질문게시판</h3>
						</div>
					</div>
					<div class="face face2">
						<div class="content">
							<p>코딩하며 어려운데 질문하기 어려웠던 문제들을 나눠봐요.</p>
								<a href="Board/qnaBoardList.po">질문게시판이동하기</a>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="face face1">
						<div class="content">
							<img src="image/meeting.png">
							<h3>자유게시판</h3>
						</div>
					</div>
					<div class="face face2">
						<div class="content">
							<p>원하는 이야기를 마음껏 나누어 보세요.</p>
								<a href="Board/freeBoardList.po">자유게시판이동하기</a>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="face face1">
						<div class="content">
							<img src="image/success.png">
							<h3>포인트랭킹</h3>
						</div>
					</div>
					<div class="face face2">
						<div class="content">
							<p>누적포인트 순위를 알 수 있습니다.</p>
								<a href="User/userRank.uo">포인트랭킹페이지이동</a>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="face face1">
						<div class="content">
							<img src="image/notice.png">
							<h3>공지사항</h3>
						</div>
					</div>
					<div class="face face2">
						<div class="content">
							<p></p>
								<a href="Board/noticeBoardList.po">해당페이지이동</a>
						</div>
					</div>
				</div>
			</div>
		</article>
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
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/fontawesome-all.min.js"></script>
</html>
