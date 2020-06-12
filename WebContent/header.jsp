<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="ko">
<script src="https://use.fontawesome.com/afbd8941a0.js"></script>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <link rel="stylesheet" href="CSS/header.css" />
  <link rel="stylesheet" href="CSS/bootstrap.css">
  <title>SYSOUT</title>
</head>

<body>
  <!-- 보이지 않지만 user_uid 값을 끌어 쓸 때 사용됩니다.-->
  <span id="user_uid" style="display: none">${userDto[0].user_uid }</span>
  <!--  -->
    
  <nav style="display:flex;background:#fff; color:#333;">

	<div class="logologo">
    <h1 style="height: 120px;" id="logo" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
			<span style="color:#ffd669;fontsize:2rem">S</span><span style="color:#808080;fontsize:1rem">y</span><span style="color:#808080;">s</span><span style="color:#ffd699;">o</span><spanstyle="color:#808080;">u</span><span style="color:#808080;">t</span>
		</h1>
		</div>
	
			

    <div>
    <ul class="nav-links" style="width:140%; margin-left:10%; color:#333;margin:10%; font-weight:30;">
      <li><a onclick="location.href='${pageContext.request.contextPath}/Board/siteBoardList.jsp'" style="color:#333;">추천사이트</a></li>
      <li><a onclick="location.href='${pageContext.request.contextPath}/Board/freeBoardList.po'"style="color:#333;">자유게시판</a></li>
      <li><a onclick="location.href='${pageContext.request.contextPath}/Board/qnaBoardList.po'"style="color:#333;">질문게시판</a></li>
      <li><a onclick="location.href='${pageContext.request.contextPath}/User/userRank.uo'"style="color:#333;">포인트랭킹</a></li>
      <li><a onclick="location.href='${pageContext.request.contextPath}/Board/noticeBoardList.po'"style="color:#333;">공지사항</a></li>
    </ul>
    </div>
			
	<div>	
	<ul class="nav nav justify-content-end ">
				
					<!-- 로그인 전 (세션에 user_email 이 없으면 로그인 해야함.-->
		<!-- 로그인 후 (세션저장됨)-->
      <c:choose>
		<c:when test="${sessionScope.userDto[0].user_email == null }">
      		<li><button id="login" type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/User/login.uo'"
      			style="margin:17% 0 0 0;" >로그인</button></li>
		</c:when>
		<c:when test="${userDto[0].user_email != null }">
      		<li><button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/User/logout.uo'" 
      		id="logout" style="margin:15% 0 0 10px; " >로그아웃</button></li>
			<li class="nav-item "><a class="nav-link active" onclick="location.href='${pageContext.request.contextPath}/User/mypageView.uo?user_uid=${sessionScope.userDto[0].user_uid}'"
			style="margin:12% 0 ; color:#333;" id="mypage">마이페이지</a></li> 
		</c:when>
      </c:choose>			
	</ul>
	</div>
	
  </nav>
<hr> 	

</body>

</html>