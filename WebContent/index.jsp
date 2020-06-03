
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="ko">
<!--fontawsome 사용시 필요한 설정 링크 -->
<script src="https://use.fontawesome.com/afbd8941a0.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 메인 페이지 css -->
    <link href="CSS/index.css" rel="stylesheet" type="text/css">
    <!-- parallax scroll css-->
    <link href="CSS/maintitle.css" rel="stylesheet" type="text/css">
    <!--rank css-->
    <link href="CSS/index_rank.css" rel="stylesheet" type="text/css">
    <!-- 메인 페이지 J쿼리 사용  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 메인 페이지 자바스크립트  -->
    
    <!--fontawsome 사용시 필요한 링크 삽입 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!--메인 로고 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
    <!-- 메인 글 제목 폰트-->
    <!-- 서브 텍스트 폰트-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap" rel="stylesheet">
    <title>Document</title>
</head>

<body>
    <div class="loading"></div>

    <!--웹 페이지 로딩 시 로딩 이미지 띄우기-->
    <!-- <div class="container" style="display:none;">
        <h1>로딩 후 화면</h1>
    </div> -->

    <header class="header" id="">
        <nav class="navbar" id="">
            <div id="hidden">sysout</div>
            <div class="loginmypage" id="loginjoin">
                <ul class="loginmypage-list">
                    <li class="login-li">
                        <a class="loginmypage-list-a" id="login" onclick="">
                            로그인
                        </a>
                    </li>
                    <li class="login-li">
                        <a class="list-a">|</a>
                    </li>
                    <li>
                        <a class="loginmypage-list-a" id="mypage" onclick="">
                            마이페이지
                            
                        </a>
                    </li>
                </ul>
            </div>
            <div class="hamburger" id="hamberger">
                <i class="fas fa-bars"></i>
            </div>
        </nav>
        <nav class="title" id="">
            SYSOUT
        </nav>
    </header>

    <article class="maintitle" id="">
        <section>
            <img src="image/bg.jpg" id="bg">
            <img src="image/moon.png" id="moon">
            <img src="image/mountain.png" id="mountain">
            <img src="image/road.png" id="road">
            <h2 id="text">SYSOUT</h2>
        </section>
        <div class="maintitle-text" id="maintext">
            <h5>Sysout 은 .. 이러한 사이트 입니다. </h5>
            <h2>저희 SYSOUT은 ..</h2>
            <br>
            <p>로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.

                로렘 입숨은 전통 라틴어와 닮은 점 때문에 종종 호기심을 유발하기도 하지만 그 이상의 의미를 담지는 않는다. 문서에서 텍스트가 보이면 사람들은 전체적인 프레젠테이션보다는 텍스트에 담긴 뜻에 집중하는 경향이 있어서 출판사들은 서체나 디자인을 보일 때는 프레젠테이션 자체에 초점을 맞추기 위해 로렘 입숨을 사용한다.</p>
        
        </div>

        <hr><br>


	
		<div class="notice-rank">
            <div class="index-noticecontainer">
                <div class="noticebtn">
                    <a class="nbtn" href="#">N O T I C E</a>
                </div>
              	<c:choose>
			<c:when test="${empty list || fn:length(list) == 0}">
			</c:when>
			<c:otherwise>

				<c:forEach var="dto" items="${list }">
				  <div class="notice-1">
               		 <!-- 게시내용 -->
	                    <div class="notice-text"> 
	                    	<a href="noticeBoardList.po?uid=${dto.post_uid }">${dto.post_subject }</a>
	                    </div>
	                    <!-- 게시날짜 -->
	                    <div class="notice-regdate">
	                        <a class="nregdate">${dto.post_regdate}</a>
	                    </div>
                	</div>
				</c:forEach>

			</c:otherwise>
		</c:choose>


<%-- 				<c:choose>
					<c:when test="${empty list || fn:length(list) == 0}">
					</c:when>
					<c:otherwise>

						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.uid }</td>
								<td><a href="view.do?uid=${dto.uid }">${dto.subject }</a></td>
								<td>${dto.name }</td>
								<td>${dto.viewCnt }</td>
								<td>${dto.regDate }</td>
							</tr>

						</c:forEach>

					</c:otherwise>
				</c:choose>
 --%>

			</div>
            <div class="index_rankcontainer">
                <div class="card" id="btn">
                    <a class="rank_btn" onclick="location.href=''">전체 랭킹 현황</a>
                </div>
                
               <c:choose>
				<c:when test="${empty list || fn:length(list) == 0}">
				</c:when>
				<c:otherwise>

					<c:forEach var="dto" items="${list }">
                
                <div class="card">
                    <i class="fas fa-crown"></i>
                    <span class="title">${dto.user_name }</span>
                    <span class="rank">${dto.user_point }</span>
                </div>
                <div class="card">
                    <i class="fas fa-crown"></i>
                    <span class="title"> name</span>
                    <span class="rank"> 90</span>
                </div>
                <div class="card">
                    <i class="fas fa-crown"></i>
                    <span class="title"> name</span>
                    <span class="rank"> 90</span>
                </div>
                <div class="card">
                    <i class="fas fa-user "></i>
                    <span class="title"> name</span>
                    <span class="rank"> 90</span>
                </div>
                <div class="card">
                    <i class="fas fa-user "></i>
                    <span class="title"> name</span>
                    <span class="rank"> 90</span>
                </div>
                </c:forEach>

					</c:otherwise>
				</c:choose>
            </div>
        </div>    
    </article>
    <script type="text/javascript">
        let bg = document.getElementById("bg");
        let mountain = document.getElementById("mountain");
        let road = document.getElementById("road");
        let moon = document.getElementById("moon");
        let text = document.getElementById("text");

        window.addEventListener('scroll', function(){
        var value = window.scrollY;

    bg.style.top = value * 0.5 + 'px';
    moon.style.left = -value * 0.5 + 'px';
    mountain.style.top = value * 0.15 + 'px';
    road.style.top = value * 0.5 + 'px';
    text.style.top = value * 1 + 'px';
})
    </script>

 

    <footer>
    푸터입니다.
    </footer>

</body>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>

</body>
</html>