<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${sessionScope.userDto[0].user_name }님의 MyPage</title>
</head>
<body>
	<header></header>
	<h2>나를 소개하세용~!</h2>

	<form action="mypageView.uo" method="post" name="frm">
	<div style="float: left">
		<button type="button" id="btn_proc" onclick="">수정하기</button>
	</div>
	
	<div class="clear" style="clear: both;"></div>
	<!--  확인용   -->
	<br> user_uid : ${userDto[0].user_uid }
	
	
	<!-- 보이지 않으나, form submit 할 떄 보내짐. -->
	 <input type="hidden" name="user_uid" value="${userDto[0].user_uid }">
	<div>
		<label for="title">제목</label>
		<div>
			<input type='text' name='b_title' id='b_title' value='${userDto[0].mypage_subject }' required="required">
		</div>
	</div>

	<div>
		<label for="content">내용</label>
		<div>
			<textarea name='b_content' id='b_content' rows='10'> ${userDto[0].mypage_content }</textarea>
		</div>
	</div>
	
	
	
	</form>
	






<%-- 	<%-- 이미지인 경우 보여주기  --%> 
<%-- 	<c:forEach var="element" items="${file }"> --%>
<%-- 		<c:if test="${element.image == true }"> --%>
<!-- 			<div style="width: 300px;"> -->
<%-- 				<img style="width: 100%; height: auto" src="upload/${element.file }" /> --%>
<!-- 			</div> -->
<%-- 		</c:if> --%>
<%-- 	</c:forEach> --%>

	<footer></footer>
</body>
</html>
