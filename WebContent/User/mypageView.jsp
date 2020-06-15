<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<script src="https://use.fontawesome.com/51a440e272.js"></script>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@1,700&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<link rel="stylesheet" href="../CSS/bootstrap.css">
<link rel="stylesheet" href="../CSS/mypage.css">
<link rel="stylesheet" href="../CSS/header.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../JS/mypageView.js" type="text/javascript"></script>
<title>${sessionScope.userDto[0].user_name}님의MyPage</title>
</head>
<body>

	<!-- 헤더 부분 입니다. -->
	<jsp:include page="../header.jsp" />
	<script src="../JS/header.js"></script>
	<!---------------------------------->

	<section>
		<div class="container">
			<h1 class="heading">MY PAGE</h1>

			<div class="card-wrapper">
				<div class="card">
					<div alt="card background" class="card-img"></div>
					<!-- <img src="../image/user.png" alt="profile img" class="profile-img"> -->

					<%-- 프로필사진 영역   --%>
					<form action="mypageFileUpload.uo?user_uid=${list[0].user_uid }"
						method="post" enctype="multipart/form-data">

						<%-- 이미지인 경우 보여주기  --%>
						<div style="width: 200px;">
										<img style="width: 100%; height: auto"
										src="../fileUpload/${file[0].attach_servername }"
										alt="profile img" class="profile-img"/>
										</div>
						<c:forEach var="attachDto" items="${attach }">
							<c:if test="${attachDto.image == true }">
								<div style="width: 200px;">
									<img style="width: 100%; height: auto"
										src="../fileUpload/${attachDto.attach_servername }"
										alt="profile img" class="profile-img"/>
								</div>
							</c:if>
						</c:forEach>
						<input type="file" name="file" class="btn" id='fileAttach'><br> 
						<input type="submit" class="btn" value="등록" id='btn_write'> <!-- insert 하고 select 해서 view 해주는 것 까지 -->
						
<!-- 						<input type="button" value="수정" id='btn_update'> insert 하고 select 해서 view 해주는 것 까지 -->
					
					
					</form>

					<%-- 글 수정 영역  --%>
					<form method="post" name="frmView2" id="frmView2" >
						<input type="hidden" name="user_uid" value="${list[0].user_uid }">
						<h1 class="name">${list[0].user_name}</h1>
						<p class="job-title">${list[0].user_email}</p>
						<br> <br>
						<div class="clear" style="clear: both;"></div>

						<div>
							<label for="title"><h2>
									Title
									<h2></label>
							<div>
								<input type='text' name='mypage_subject' id='mypage_subject' value='${mypage[0].mypage_subject }'
									required="required">
							</div>
						</div>

						<div>
							<label for="content"><h2>
									Context
									<h2></label>
							<div>
								<textarea name='mypage_content' id='mypage_content' rows='10'> 
								${mypage[0].mypage_content }
								</textarea>
							</div>
						</div>
						<input type="button" class="btn" id="update_btn" value="수정">
					</form>

					<ul class="social-media">
						<li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
						<li><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
						<li><a href="#"><i class="fab fa-instagram"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>


</body>
</html>