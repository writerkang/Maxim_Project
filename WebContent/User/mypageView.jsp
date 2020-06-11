<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../JS/mypageView.js" type="text/javascript"></script>
<title>${sessionScope.userDto[0].user_name }님의MyPage</title>
</head>
<body>
	<header></header>
	<h2>나를 소개하세용~!</h2>

	<form method="post" name="frmView2" id="frmView2">

		<!-- 보이진 않지만 submit 했을 때 파라미터 uid 넘어감  -->
		<input type="hidden" name="user_uid" value="${userDto[0].user_uid }">
		<div style="float: left">
			<input type="button" id="update_btn" value="수정">
		</div>
		<div class="clear" style="clear: both;"></div>
		<div>
			<label for="title">제목</label>
			<div>
				<input type='text' name='mypage_subject' id='mypage_subject'
					value='${mypage[0].mypage_subject }' required="required">
			</div>
		</div>
		<div>
			<label for="content">내용</label>
			<div>
				<textarea name='mypage_content' id='mypage_content' rows='10'> ${mypage[0].mypage_content }</textarea>
			</div>
		</div>

	</form>



	<form method="post" enctype="multipart/form-data">
		프로필 사진
		<div>
			<input type="file" name="file"><br>
		</div>
	</form>


	<!-- 		이미지인 경우 보여주기  -->
	<c:forEach var="element" items="${file }">
		<c:if test="${element.image == true }">
			<div style="width: 300px;">
				<img style="width: 100%; height: auto" src="upload/${element.file }" />
			</div>
		</c:if>
	</c:forEach>

	<footer></footer>
</body>
</html>