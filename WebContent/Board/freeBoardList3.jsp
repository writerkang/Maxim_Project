<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 현재 페이지 가져오기 -->
<%
	int curPage = 1; // 현재 페이지 (디폴트 1 page)

	// 현재 몇 페이지인지 parameter 받아오기 + 검증
	String pageParam = request.getParameter("page");
	if (pageParam != null && !pageParam.trim().equals("")) {
		try {
			// 1이상의 자연수 이어야 한다
			int p = Integer.parseInt(pageParam);
			if (p > 0)
				curPage = p;
		} catch (NumberFormatException e) {
			// page parameter 오류는 별도의 exception 처리 안함 
		}
	} // end if
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="../CSS/boardk.css" rel="stylesheet" type="text/css">

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


<script src="../JS/board.js" type="text/javascript"></script>
<title>자유게시판</title>
</head>
<body>

	<div class="container">


		<h4>자유게시판</h4>
		<br>
		<ul class="pagination justify-content-end">
			<li class="page-item"><a class="page-link" href="#">최신순</a></li>
			<li class="page-item"><a class="page-link" href="#">조회순</a></li>
			<li class="page-item"><a class="page-link" href="#">추천순</a></li>
		</ul>
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>

			<c:choose>
				<c:when test="${empty list || fn:length(list) == 0}">
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list }" begin="0"
						end="${fn:length(list) - 1}">


						<tr>
							<td>${dto.post_uid }</td>
							<td><a class="nav-link"
								href="freePostView.po?post_uid=${dto.post_uid }">
								<h6 class="font-weight-bold">${dto.post_subject }</h6></a></td>
							<td>${dto.user_name }</td>
							<td>조회수 ${dto.post_viewcnt }</td>
							<td>${dto.post_regdate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<br>


		<form method="get" name="frm" action="./freePostFind.po?page=1">
			<div class="form-row">
				<div class="col-3">
					<select name="search" class="form-control">
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">작성자</option>
					</select>
				</div>
				<div class="col-7">
					<input type="text" class="form-control" name="ser_content"
						placeholder="검색어를 입력해주세요">
				</div>
				<div class="col-1">
					<button class="form-control fas fa-search"></button>
				</div>
				<div class="col-1">
					<button type="button" class="form-control fas fa-pencil-alt" onclick="location.href='freePostWrite.po'"></button>
				</div>
				
				<!-- 보이지 않지만 form을 submit 할 때 같이 전달되는 값입니다 -->
				<input type="hidden" name="page" value="1">
				<!---------------------------------->
			</div>
		</form>
		<br>
		<div class="row">
		<div class="col-12">
			<%-- 페이징 --%>
			<jsp:include page="pagination.jsp">
				<jsp:param value="${writePages }" name="writePages" />
				<jsp:param value="${totalPage }" name="totalPage" />
				<jsp:param value="<%=curPage%>" name="curPage" />
			</jsp:include>
			</div>
		</div>

	</div>
</body>
</html>