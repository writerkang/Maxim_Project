<%@page import="org.ietf.jgss.Oid"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- JSTL 버젼으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다. --%>

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
<title>질문게시판</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


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
<link rel="stylesheet" href="../CSS/header.css" />

</head>

<script src="../JS/board.js" type="text/javascript"></script>

<!-- 헤더 부분 입니다. -->
<jsp:include page="../header.jsp" />
<script src="../JS/header.js"></script>
<!---------------------------------->
<br>
<div class="container">
	<h4>자유게시판</h4>
	<br>

	
	<table class="table table-hover">
		<thead class="thead-light">
			<tr>
				<th style="width:8.33%">글번호</th>
				<th style="width:58.31%">제목</th>
				<th style="width:8.33%">작성자</th>
				<th style="width:8.33%">조회수</th>
				<th style="width:16.66%">작성일</th>
			</tr>
		</thead>


		<c:choose>
			<c:when test="${empty list || fn:length(list) == 0}">
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list }" begin="0"
					end="${fn:length(list) - 1}">

					<tr>
						<td id="text_uid">${dto.post_uid}</td>
						<td id="text_title"><a class="nav-link font-weight-bold"
							href="freePostView.po?post_uid=${dto.post_uid}&page=<%= curPage %>">${dto.post_subject}[${dto.comments_count }]</a></td>
						<td id="nick_name">${dto.user_name }</td>
						<td>${dto.post_viewcnt}</td>
						<td id="text_date">${dto.post_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<br>

	<form method="get" name="frm" action="./freePostFind.po?page=1">
		<div class="form-row">
			<div class="col-3">
				<select name="search" class="form-control" id="search_sele">
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">작성자</option>
				</select>
			</div>

			<div id="ser_cont" class="col-7">
				<input type="text" class="form-control" name="ser_content"
					id="content" placeholder="검색어를 입력해주세요">
			</div>
			<div class="col-1">
				<button class="form-control fas fa-search"></button>
			</div>
			<div class="col-1">
				<button type="button" id="btn-write-pst" class="form-control fas fa-pencil-alt"></button>
			</div>
			<!-- 보이지 않지만 form을 submit 할 때 같이 전달되는 값입니다 -->
			<input type="hidden" name="page" value="1">
			<!---------------------------------->
		</div>
	</form>
	<br>

	<div class="row">
		<div class="col-12">

			<%-- 위 트랜잭션이 마무리 되면 페이지 보여주기 --%>

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