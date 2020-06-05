<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPage</title>
</head>
<body>
	<header></header>
	<div class="headline">
		<h2>HeadLine</h2>
		<h5>something blablabla</h5>
	</div>
	<div class="user-info">
		<h2>userName</h2>
		<br>
		<h5>userNickName</h5>
	</div>
	
    <article>
	   	<c:forEach var="element" items="${file }">
	   		<c:if test="${element.image == true }">
	   			<div style="width:100px; height: 100px"
	   				src="upload/${element.file }">
	   			</div>
	   		</c:if>	
	   	</c:forEach>
   	
   		<button onclick="location.href=update.uo">수정하기</button>
   	     
    </article>
    
    <footer></footer>
</body>
</html>
