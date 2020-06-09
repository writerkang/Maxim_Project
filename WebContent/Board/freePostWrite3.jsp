<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기</title>

<link rel="stylesheet" href="../CSS/cancel-modal.css" />
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../ckeditor/ckeditor.js"></script>

<script src="../JS/cancel-modal.js" type="text/javascript"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">


<!---------------------------------->
<script>
	function chkSubmit() { // 폼 검증
		frm = document.forms["frm"];

		var category_uid = frm["category_uid"].value.trim();
		var post_subject = frm["post_subject"].value.trim();
		var post_content = frm["post_content"].value.trim();

		if (category_uid == "") {
			alert("카테고리 유형을 선택해 주세요!");
			frm["category_uid"].focus();
			return false;
		}
		if (post_subject == "") {
			alert("제목을 입력해 주세요!");
			frm["post_subject"].focus();
			return false;
		}
		if (post_content == "") {
			alert("내용을 입력해 주세요!");
			frm["post_content"].focus();
			return false;
		}
		return true;
	}
</script>

<body>

	<div class="container">


		<h4>글쓰기</h4>
		<br>

		<form name="frm" action="freePostWriteOk.po" method="post"
			onsubmit="return chkSubmit()">

			<!-- 보이지 않지만 form을 submit 할 때 같이 전달되는 값입니다 -->
			<input type="hidden" name="board_uid" value="2"> <input
				type="hidden" name="user_uid" value="${userDto[0].user_uid }">
			<!---------------------------------->

			<div class="form-group">
				<span>작성자 닉네임</span>
			</div>
			<hr>

			<!-- 카테고리 선택 부분입니다. -->
			<div class="form-group">
				<label for="category_uid">카테고리 유형</label> <select
					name="category_uid" class="form-control">
					<option value="">카테고리 유형을 선택해 주세요</option>
					<option value="1">FrontEnd</option>
					<option value="2">BackEnd</option>
					<option value="3">Java</option>
					<option value="4">Android</option>
					<option value="5">JavaScript</option>
					<option value="6">HTML5</option>
					<option value="7">CSS</option>
					<option value="8">잡담</option>
					<option value="9">기타</option>
				</select>
			</div>

			<!---------------------------------->

			<!-- 제목 입력 부분입니다. -->
			<div class="form-group">
				<label for="post_subject">제목</label> <input type="text"
					class="form-control" name="post_subject" placeholder="제목을 입력해 주세요." />
			</div>
			<!---------------------------------->

			<!-- 내용 입력 부분입니다. -->
			<div class="form-group">
				<div>
					<label for="post_content">내용</label>
					<textarea class="form-control" name="post_content" id="editor1"></textarea>
					<script>
						CKEDITOR.replace('editor1', {
							allowedContent : true, // HTML 태그 자동삭제 방지 설정
							filebrowserUploadUrl : 'fileUpload.po'
						});
					</script>
				</div>
			</div>
			<!---------------------------------->

			<div class="form-row">
				<div class="col">
					<button class="btn-cancel form-control" type="button">취소</button>
				</div>
				<div class="col">
					<button class="form-control" type="submit">등록</button>
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
		<!---------------------------------->
	</div>
</body>
</html>