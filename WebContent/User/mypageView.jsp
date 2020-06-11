<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<script src="https://use.fontawesome.com/51a440e272.js"></script>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@1,700&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="../CSS/bootstrap.css">
<link rel="stylesheet" href="../CSS/mypage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../JS/mypageView.js" type="text/javascript"></script>
<title>${sessionScope.userDto[0].user_name }님의MyPage</title>
</head>
<body>
<section>
<div class="container">
	<h1 class="heading">MY PAGE</h1>
	<hr>
	<div class="card-wrapper">
	<div class="card">
		<img src="" alt="card background" class="card-img">
		<img src="" alt="profile img" class="profile-img">


		<form method="post" name="frmView2" id="frmView2">
			<input type="hidden" name="user_uid"value="${userDto[0].user_uid }">
			<h1 class="name">${sessionScope.userDto[0].user_name}Michille Gomes</h1>
			<p class="job-title">${sessionScope.userDto[0].user_email}jjuccee@gmail.com</p><br><br>
			<div class="clear" style="clear: both;"></div>
			
			<div>
				<label for="title"><h2>Title<h2></label>
				<div>
					<input type='text' name='mypage_subject' id='mypage_subject' value='${mypage[0].mypage_subject }' required="required">
				</div>
			</div>

			<div>
				<label for="content"><h2>Context<h2></label>
				<div>
					<textarea name='mypage_content' id='mypage_content' rows='10'> ${mypage[0].mypage_content }</textarea>
				</div>
			</div>
		</form>
		
		<a href="#" class="btn" id="update_btn"><i class="fas fa-cog"></i></a>
			
		<ul class="social-media">
			<li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
			<li><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
			<li><a href="#"><i class="fab fa-instagram"></i></a></li>
		</ul>
	</div>
	</div>
</div>
</section>



	<%-- 	<%-- 이미지인 경우 보여주기  --%>
	<%-- 	<c:forEach var="element" items="${file }"> --%>
	<%-- 		<c:if test="${element.image == true }"> --%>
	<!-- 			<div style="width: 300px;"> -->
	<%-- 				<img style="width: 100%; height: auto" src="upload/${element.file }" /> --%>
	<!-- 			</div> -->
	<%-- 		</c:if> --%>
	<%-- 	</c:forEach> --%>


</body>
</html>