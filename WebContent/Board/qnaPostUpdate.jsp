<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- JSTL 버젼으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다. --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글수정</title>

<link rel="stylesheet" href="../CSS/cancel-modal.css" />
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../ckeditor/ckeditor.js"></script>

<script src="../JS/cancel-modal.js" type="text/javascript"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link rel="stylesheet" href="../CSS/header.css" />

<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 게시물이 존재하지 않습니다!");
			history.back();
		</script>
	</c:when>

	<c:otherwise>

		<script src="../JS/postUpdate.js"></script>

		<body>
			<!-- 헤더 부분 입니다. -->
			<jsp:include page="../header.jsp" />
			<script src="../JS/header.js"></script>
			<!---------------------------------->
			<br>

			<div class="container">

				<h4>글수정</h4>
				<br>

				<form name="frm-update-pst" id="frm-update-pst"
					action="qnaPostUpdateOk.po?post_uid=${list[0].post_uid }"
					method="post">

					<!-- 보이지 않지만 form을 submit 할 때 같이 전달되는 값입니다 -->
					<input type="hidden" name="board_uid" value="2"> <input
						type="hidden" name="user_uid" value="${list[0].user_uid }">
					<!---------------------------------->

					<div class="form-group">
						<span>${userDto[0].user_name }</span>
					</div>

					<hr>

					<!-- 카테고리 선택 부분입니다. -->
					<div class="form-group">
						<label for="category_uid">카테고리 </label> <select
							name="category_uid" class="form-control">
							<option value="">카테고리를 선택해 주세요</option>
							<option value="1"
								<c:if test="${list[0].category_uid == 1}">selected</c:if>>FrontEnd</option>
							<option value="2"
								<c:if test="${list[0].category_uid == 2}">selected</c:if>>BackEnd</option>
							<option value="3"
								<c:if test="${list[0].category_uid == 3}">selected</c:if>>Java</option>
							<option value="4"
								<c:if test="${list[0].category_uid == 4}">selected</c:if>>Android</option>
							<option value="5"
								<c:if test="${list[0].category_uid == 5}">selected</c:if>>JavaScript</option>
							<option value="6"
								<c:if test="${list[0].category_uid == 6}">selected</c:if>>HTML5</option>
							<option value="7"
								<c:if test="${list[0].category_uid == 7}">selected</c:if>>CSS</option>
							<option value="8"
								<c:if test="${list[0].category_uid == 8}">selected</c:if>>잡담</option>
							<option value="9"
								<c:if test="${list[0].category_uid == 9}">selected</c:if>>기타</option>
						</select>
					</div>
					<!---------------------------------->

					<!-- 제목 입력 부분입니다. -->
					<div class="form-group">
						<label for="post_subject">제목</label> <input type="text"
							class="form-control" name="post_subject"
							placeholder="제목을 입력해 주세요." value="${list[0].post_subject }">
					</div>
					<!---------------------------------->

					<!-- 내용 입력 부분입니다. -->
					<div class="form-group">
						<label for="post_content">내용</label>
						<textarea name="post_content" id="editor1" class="form-control"
							placeholder="내용을 입력해 주세요.">${list[0].post_content }</textarea>
						<script>
							CKEDITOR.replace('editor1', {
								allowedContent : true, // HTML 태그 자동삭제 방지 설정
								filebrowserUploadUrl : 'fileUpload.po'
							});
						</script>
					</div>

					<hr>

					<div class="form-row">
						<div class="col">
							<button class="btn-cancel form-control" type="button">취소</button>
						</div>
						<div class="col">
							<button class="bg-yellow form-control" type="submit">등록</button>
						</div>
					</div>
				</form>

				<!-- 취소 버튼 클릭시 나타나는 모달창입니다. -->
				<div id="cancel-modal" class="modal">
					<div class="cancel-modal-content">
						<div class="cancel-modal-header">
							<div>
								<span>정말 취소 하시겠습니까?</span>
							</div>
							<div>
								<span class="text-red">(임시저장은 되지 않습니다)</span>
							</div>
						</div>
						<span class="close">&times;</span>

						<div class="cancel-modal-buttons">
							<button type="button" class="back left-pull">뒤로가기</button>
							<button type="button" class="ok right-pull"
								onclick="history.back()">확인</button>
						</div>
					</div>
				</div>
			</div>
		</body>

	</c:otherwise>
</c:choose>

</html>