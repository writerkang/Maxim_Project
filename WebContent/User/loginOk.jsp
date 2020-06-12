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
      <link href="../CSS/modal.css" rel="stylesheet" type="text/css">




    <title>Document</title>
</head>
<body>


	<div id="myModal1" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center; line-height: 1.5;"><br/>${userDto[0].user_name}님 안녕하세요!</p>
                <p style="text-align: center; line-height: 1.5;"><br/><button onclick="location.href='../index.jsp' ">홈으로!</button></p>
                <p><br /></p>

      </div>
 
    </div>

	<div id="myModal2" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center; line-height: 1.5;"><br/>비밀번호가 틀립니다.</p>
				<p style="text-align: center; line-height: 1.5;"><br/><button onclick="location.href='/Maxim_Project/User/login.uo'">로그인하러 가기!</button></p>
                <p><br /></p>

      </div>
 
    </div>

	<div id="myModal3" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center; line-height: 1.5;"><br/>이메일이 존재하지 않습니다.</p>
                <p style="text-align: center; line-height: 1.5;"><br/><button onclick=history.back()>뒤로가기!</button></p>
                <p><br /></p>

      </div>
 
    </div>




<c:choose>
	<c:when test="${loginOk == 1 }">
		<script>
		$('#myModal1').show();
		</script>
	</c:when>
	<c:when test="${loginOk == 0 }">
		<script>
		$('#myModal2').show();
		</script>
	</c:when>

	<c:otherwise>
		<script>
		$('#myModal3').show();
		</script>
	</c:otherwise>
</c:choose>


</body>
</html>
	






































