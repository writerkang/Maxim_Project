<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <link rel="stylesheet" href="CSS/header.css" />
  <title>SYSOUT</title>
</head>

<body>
  <!-- 보이지 않지만 user_uid 값을 끌어 쓸 때 사용됩니다.-->
  <span id="user_uid" style="display: none">${userDto[0].user_uid }</span>
  <!--  -->
    
  <nav>

    <div class="hamburger">
      <div class="line"></div>
      <div class="line"></div>
      <div class="line"></div>
    </div>

    <div class="logotext">  
      <h1><a class="btn" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">SysOut</a></h1>
    </div>

    
    <ul class="nav-links">
      <li><a onclick="location.href='${pageContext.request.contextPath}/Board/siteBoardList.jsp'">RECOMMEND</a></li>
      <li><a onclick="location.href='${pageContext.request.contextPath}/Board/freeBoardList.po'">FREEBOARD</a></li>
      <li><a onclick="location.href='${pageContext.request.contextPath}/Board/qnaBoardList.po'">Q&amp;A</a></li>
      <li><a onclick="location.href='${pageContext.request.contextPath}/User/userRank.uo'">RANK</a></li>
      <li><a onclick="location.href='${pageContext.request.contextPath}/Board/noticeBoardList.po'">NOTICE</a></li>
    </ul>
    
        <ul class="login-links">
      <li><a onclick="location.href='${pageContext.request.contextPath}/User/mypageView.uo'" id="mypage">MyPage</a></li>
      <div class="sline"></div>
      
      	<!-- 로그인 전 (세션에 user_email 이 없으면 로그인 해야함.-->
		<!-- 로그인 후 (세션저장됨)-->
      <c:choose>
		<c:when test="${sessionScope.userDto[0].user_email == null }">
      		<li><a onclick="location.href='${pageContext.request.contextPath}/User/login.uo'" id="login" id="login">LogIn</a></li>
		</c:when>
		<c:when test="${userDto[0].user_email != null }">
      		<li><a onclick="location.href='${pageContext.request.contextPath}/User/logout.uo'" id="logout" id="logout">LogOut</a></li>
		</c:when>
      </c:choose>
    </ul>
  </nav>


</body>

</html>