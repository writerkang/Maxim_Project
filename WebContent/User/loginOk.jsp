<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%-- 
	<% session.getAttribute("arr"); %> <!-- arr 이라는 이름의 세션값 받음. -->
<!-- 	세션에 저장된 arr 에서  email(id)값만 뽑아내야해. 
		email 값이 null 인 경우에만 -> 로그인 시키도록-->
	session: <%= session.getAttribute("arr")%>
	 --%>

<%-- 	${sessionScope.userDto[0].user_uid } --%>




<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Document</title>
    <style>
        .alert{
			position:fixed; 
			top:30%; 
			left:50%; 
			transform: translate(-50%,-50%);
            width: 50%;
            margin: 30px auto;
            text-align: center;
			border: 2px black;
			visibility:hidden;
			padding: 10px;
			background-color: white;
			opacity: 1;
			border-radius: 7px;
        }
        .top{
            background-color: black;
            color: white;
            text-align: center;
            padding: 10px 20px;
        }
        .content{
            text-align: center;
            padding: 30px 10px;
        }
        button{
            border-radius: 5px;
            background-color: black;
            border: 1px solid #b3b3b3;
            padding: 4px 6px;
            color:white;
        }
        a{
            color:blue;
            border-bottom: 1px soild black;
        }
    </style>
</head>
<body style="background-color: #ffe082;">

    <div class="alert" id="logino" style="border: 2px solid black;">
        <div class="content">${userDto[0].user_name}님 안녕하세요!</div>
        <div><a href="/Maxim_Project/User/login.uo">로그인</a>하러 가기!</div>
    </div>
    
    <div class="alert" id="pwx" style="border: 2px solid black;">
        <div class="content">비밀번호가 틀립니다.</div>
        <div><a href="/Maxim_Project/User/login.uo">로그인</a>하러 가기!</div>
    </div>


    <div class="alert" id="emailx" style="border: 2px solid black;">
        <div class="content">이메일이 존재하지 않습니다.</div>
        <button onclick= history.back() >뒤로 가기!</button>
    </div>

<c:choose>
	<c:when test="${loginOk == 1 }">
		<script>
			$('#logino').css('visibility', 'visible');
		</script>
	</c:when>
	<c:when test="${loginOk == 0 }">
		<script>
			$('#pwx').css('visibility', 'visible');
		</script>
	</c:when>

	<c:otherwise>
		<script>
			$('#emailx').css('visibility', 'visible');
		</script>
	</c:otherwise>
</c:choose>


</body>
</html>
	






































