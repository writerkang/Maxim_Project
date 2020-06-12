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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<title>${list[0].post_subject }</title>


<link rel="stylesheet" href="../CSS/modal-deletePost.css" />
<link rel="stylesheet" href="../CSS/modal-updateComment.css" />
<link rel="stylesheet" href="../CSS/comment.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>




<script src="../JS/postView.js" type="text/javascript"></script>
<script src="../JS/toggle-menu.js" type="text/javascript"></script>
<script src="../JS/modal-deletePost.js" type="text/javascript"></script>
<script src="../JS/modal-updateComment.js" type="text/javascript"></script>
<script src="../JS/QnA-commentCRUD.js" type="text/javascript"></script>

<link rel="stylesheet" href="../CSS/header.css" />

<body>

	<!-- 헤더 부분 입니다. -->
	<jsp:include page="../header.jsp" />
	<script src="../JS/header.js"></script>
	<!---------------------------------->
	
	<c:choose>
					<c:when test="${list[0].category_uid == 1}">
					<c:set var="category" value="FrontEnd"/>
					</c:when>
					<c:when test="${list[0].category_uid == 2}">
					<c:set var="category" value="BackEnd"/>
					</c:when>
					<c:when test="${list[0].category_uid == 3}">
					<c:set var="category" value="Java"/>
					</c:when>
					<c:when test="${list[0].category_uid == 4}">
					<c:set var="category" value="Android"/>
					</c:when>
					<c:when test="${list[0].category_uid == 5}">
					<c:set var="category" value="JavaScript"/>
					</c:when>
					<c:when test="${list[0].category_uid == 6}">
					<c:set var="category" value="HTML5"/>
					</c:when>
					<c:when test="${list[0].category_uid == 7}">
					<c:set var="category" value="CSS"/>
					</c:when>
					<c:when test="${list[0].category_uid == 8}">
					<c:set var="category" value="잡담"/>
					</c:when>
					<c:when test="${list[0].category_uid == 9}">
					<c:set var="category" value="기타"/>
					</c:when>
					</c:choose>

	<div class="container">
		<br>
		<h4>질문게시판</h4>
		<br>
		<div class="row">
			<div class="col-12">
				<h5>[<c:out value='${category }'/>]</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<h4>${list[0].post_subject}</h4>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<a href="${pageContext.request.contextPath}/User/mypageView.uo?user_uid=${list[0].user_uid }">${list[0].user_name }</a> <span class="">${list[0].post_regdate }</span>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<i class="far fa-thumbs-up"></i><span>${fn:length(starList) }</span> <i
					class="fas fa-comment"></i><span>${fn:length(commentList)}</span> <i
					class="far fa-eye"></i><span>${list[0].post_viewcnt}</span>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<ul class="pagination justify-content-end">
					<li class="page-item"><a id="btn-update-pst" class="page-link"
						href="qnaPostUpdate.po?post_uid=${list[0].post_uid}">수정</a></li>
					<li class="page-item"><a id="btn-delete-pst" class="page-link"
						href="#">삭제</a></li>
				</ul>
			</div>
		</div>
		<!-- 보이지 않지만 user_uid(게시물 작성자), post_uid 값을 끌어다 쓸 때 사용됩니다.-->
		<span id="pst_writer_uid" style="display: none">${list[0].user_uid }</span>
		<span id="post_uid" style="display: none">${list[0].post_uid }</span>
		<hr>

		<div class="row">
			<div class="col" style="min-height: 400px;">
				${list[0].post_content}</div>
		</div>
		<hr>

		<div class="form-row">
			<div class="col">
				<button class="form-control" type="button"
					onclick="location.href='qnaBoardList.po?page=${page}'">목록으로</button>
			</div>
			<div class="col">
				<button id="starButton" class="form-control far fa-thumbs-up"
					type="button">추천</button>
			</div>
		</div>
		
		<script>
		$('#starButton').click(function(){
			<c:choose>
			<c:when test="${empty userDto[0] || userDto[0] == null}">
			alert("로그인이 필요합니다.");
			</c:when>	
			<c:when test="${userDto[0].user_uid eq list[0].user_uid}">
			alert("본인이 쓴 게시물에는 추천할 수 없습니다.");
			</c:when>
			<c:when test="${empty starList || starList == null}">
			location.href='starQnaPost.po?user_uid=${userDto[0].user_uid}&post_uid=${list[0].post_uid}';
			</c:when>
			
			<c:otherwise>
			<c:set var="loop_flag" value="false" />
			
			<c:forEach items="${starList}" var="item">
			<c:choose>
			<c:when test="${item.user_uid eq userDto[0].user_uid}">
			<c:set var="loop_flag" value="true" />
			</c:when>
			</c:choose>
			</c:forEach>
			
			<c:if test="${loop_flag}">
			alert("이미 추천한 게시물입니다.");
			</c:if>
			<c:if test="${not loop_flag}">
			location.href='starQnaPost.po?user_uid=${userDto[0].user_uid}&post_uid=${list[0].post_uid}';
			</c:if>
			
			
			</c:otherwise>
			
			</c:choose>
			
			
			
		});
			
		</script>


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
						onclick="location.href='qnaPostDeleteOk.po?post_uid=${list[0].post_uid}'">확인</button>
				</div>
			</div>
		</div>
		<!---------------------------------->

		<hr>

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

		<div class="comment-list"></div>

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