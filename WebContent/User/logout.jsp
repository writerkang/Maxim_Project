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
     <link href="../CSS/modal.css" rel="stylesheet" type="text/css">
     <title>Document</title>

</head>
<body style="background-color: #ffe082;">

	<div id="myModal1" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center; line-height: 1.5;"><br/>정상적으로 로그아웃 되었습니다.</p>
                <p style="text-align: center; line-height: 1.5;"><br/><button onclick="location.href='../index.jsp' ">홈으로!</button></p>
                <p><br /></p>

      </div>
 
    </div>

<!-- JSTL 사용하여 session invalidate 하는 방법 -->
<c:set var="userDto" scope="session" value="${userDto} "/>
<c:remove var="userDto"/>

<script>
	$('#myModal1').show();
</script>


</body>
</html>



