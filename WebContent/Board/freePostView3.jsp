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

<title>${list[0].post_subject }</title>

<link rel="stylesheet" href="../CSS/modal-deletePost.css" />
<link rel="stylesheet" href="../CSS/modal-updateComment.css" />
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../JS/toggle-menu.js" type="text/javascript"></script>
<script src="../JS/modal-deletePost.js" type="text/javascript"></script>
<script src="../JS/modal-updateComment.js" type="text/javascript"></script>
<script src="../JS/commentCRUD.js" type="text/javascript"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">



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

<!-- 본인이 작성한 글을 볼 때와 다른 사람이 작성한 글을 볼 때 보여줄, 감출 요소을 결정합니다.	-->
<script>
	$(document).ready(function() {
		var userUid = $("#user_uid").text();
		var pstWriterUid = $("#pst_writer_uid").text();
		console.log("user_uid(로그인 유저): " + userUid);
		console.log("pst_writer_uid(게시물 작성자): " + pstWriterUid);

		if (userUid == null || userUid == "") {
			$("#btn-toggle-menu").css("display", "none");
			$("#btn-scrap").css("display", "none");
			$("#btn-recommend").css("display", "none");
		} else if (userUid == pstWriterUid) {
			console.log("이 게시물 작성자시네요");
			$("#btn-scrap").css("display", "none");
			$("#btn-recommend").css("display", "none");
		} else {
			console.log("다른 분의 게시물을 보고계십니다");
			$("#btn-toggle-menu").css("display", "none");
		}
	});
</script>
<!---------------------------------->

<body>
	<div class="container">

		<h4>자유게시판</h4>
		<br>
		<div class="">

			<div class="row">
				<div class="col-12">
					<h5>[카테고리]</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<h4>${list[0].post_subject}</h4>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<span class="">닉네임</span> <span class="">${list[0].post_regdate }</span>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<i class="far fa-thumbs-up"></i><span>2</span> <i
						class="fas fa-comment"></i><span>${list[0].comments_count}</span>
					<i class="far fa-eye"></i><span>${list[0].post_viewcnt}</span>
				</div>
			</div>
			<!-- 보이지 않지만 user_uid(게시물 작성자), post_uid 값을 끌어다 쓸 때 사용됩니다.-->
			<span id="pst_writer_uid" style="display: none">${list[0].user_uid }</span>
			<span id="post_uid" style="display: none">${list[0].post_uid }</span>
			<hr>

			<div class="row">
				<div class="col" style="min-height: 400px;">
					${list[0].post_content}
				</div>
			</div>

		</div>
		<hr>


		<!-- 삭제하기 버튼 클릭시 나타나는 모달창입니다. -->
		<div id="modal-delete-pst" class="modal">
			<div class="modal-delete-pst-container">
				<div class="modal-delete-pst-header">
					<div>
						<span>정말 삭제 하시겠습니까?</span>
					</div>
					<div>
						<span class="text-red">(삭제 시 복구 할 수 없습니다)</span>
					</div>
				</div>
				<span class="close">&times;</span>

				<div class="modal-delete-pst-buttons">
					<button type="button" class="back left-pull">뒤로가기</button>
					<button type="button" class="ok right-pull"
						onclick="location.href='freePostDeleteOk.po?post_uid=${list[0].post_uid}'">확인</button>
				</div>
			</div>
		</div>
		<!---------------------------------->


		<!-- 댓글 작성 폼 입니다. -->
		<form name="frm" id="frm-write-cmt" action="commentWrite.ajax"
			method="post" onsubmit="return chkSubmit()">
			<div class="form-group">

				<!-- 보이지 않지만 form을 submit 할 때 같이 전달되는 값입니다 -->
				<input type="hidden" name="post_uid" value="${list[0].post_uid}">
				<input type="hidden" name="user_uid" value="${userDto[0].user_uid }">
				<!--  -->

				<div class="form-row">
					<div class="col-9">
						<textarea name="comment_content" class="form-control"
							placeholder="내용을 입력해 주세요."></textarea>
					</div>
					<div class="col-3">
						<button class="form-control" type="submit">작성</button>
					</div>
				</div>
			</div>
		</form>
		<!---------------------------------->

		<div class=""></div>

		<!-- 댓글 수정 버튼 클릭시 나타나는 모달창입니다. -->
		<form name="frm" id="frm-update-cmt" action="commentUpdate.ajax"
			method="post">

			<!-- 보이지 않지만 form을 submit 할 때 같이 전달되는 값입니다 -->
			<input type="hidden" name="post_uid" id="modal-update-cmt-post-uid"
				value="${list[0].post_uid}"> <input type="hidden"
				name="comment_uid" id="modal-update-cmt-uid" value="">
			<!--  -->

			<div id="modal-update-cmt" class="modal">
				<div class="modal-update-cmt-container">
					<div class="modal-update-cmt-header">
						<div>
							<span>댓글 수정</span>
						</div>
					</div>
					<span class="close">&times;</span>
					<textarea name="comment_content" id="modal-update-cmt-content"></textarea>
					<div class="modal-update-cmt-buttons">
						<button type="button" class="back left-pull">뒤로가기</button>
						<button type="submit" class="ok right-pull">수정</button>
					</div>
				</div>
			</div>
		</form>
		<!---------------------------------->
	</div>
</body>
</html>