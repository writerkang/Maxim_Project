<%@page import="org.ietf.jgss.Oid"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- JSTL 버젼으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다. --%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
    <title>Document</title>
    <style type="text/css">
    *
	{font-family: 'Suisse Regular', sans-serif;}
	
	.title a{
		font-size: 10px;
		font-weight: bold;
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	
	a:hover {
		opacity: 0.7;
	}
	
	a:active {
	opacity: 0.4;
}
		 	
	
    </style>
</head>
<body>
    <div style="width: 95%; margin: 10px auto;">
        <div style="width: 35%; float: left; padding: 20px 10px; text-align: center;">
            <h3>CLIPPING <i class="fas fa-plus-circle"></i></h3>
            <hr>
            <h4>CLIPPING</h4>
            <div style="text-align: left;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</div>
            
        <c:choose>		
		<c:when test="${empty list || fn:length(list) == 0}">
		</c:when>		
		<c:otherwise>
		<c:forEach var="dto" items="${list }" begin="0" end="${fn:length(list) - 1}">
            
            <br>
            <div style="font-size: 7px; text-align: left;">${dto.user_name }</div>
            <div style="text-align: left;" class="title" ><a href="freePostView.po?post_uid=${dto.post_uid }">${dto.post_subject } </a></div>
            <hr>  
            
            
	  	</c:forEach>
	  	</c:otherwise>
		</c:choose>
        
              
        </div>

        <div style="width: 45%; float: left; padding: 20px 10px; text-align: center;">
            <h3>MY ARTICLE <i class="fas fa-plus-circle"></i></h3>
            <br>
            <div style="text-align: left; font-weight: bold;">title</div>
            <div style="text-align: left; padding-left: 10px; font-size: 12px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna sdsds sddfdfdaliqua</div>
            <hr><br>
        </div>
    </div>
</body>
</html>