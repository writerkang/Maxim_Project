<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%--
<c:set var="userDto" scope="session" value="${userDto} "/>
<p>Before removing value from session: <c:out value="${userDto}"/></p>
<c:remove var="userDto"/>
<p>After removing value from session: <c:out value="${userDto}"/></p>
 --%>


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
            background-color: #DEDEDE;
            border: 1px solid #b3b3b3;
            padding: 4px 6px;
        }
        a{
            color:blue;
            border-bottom: 1px soild black;
        }
    </style>
</head>
<body style="background-color: #ffe082;">

    <div class="alert" id="logouto" style="border: 2px solid black;">
        <div class="content">정상적으로 로그아웃 되었습니다.</div>
        <button onclick= "location.href='../index.jsp'">홈으로!</button>
    </div>


<!-- JSTL 사용하여 session invalidate 하는 방법 -->
<c:set var="userDto" scope="session" value="${userDto} "/>
<c:remove var="userDto"/>

<script>
	$('#logouto').css('visibility', 'visible');
</script>


</body>
</html>



