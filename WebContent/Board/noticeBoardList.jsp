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
<script src="https://use.fontawesome.com/afbd8941a0.js"></script>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="../CSS/bootstrap.css">
<link rel="stylesheet" href="../CSS/notice.css">

<link href="../CSS/siteBoard.css" rel="stylesheet" type="text/css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link rel="stylesheet" href="../CSS/header.css">
<title>공지사항목록</title>
</head>
<body>

	<!-- 헤더 부분 입니다. -->
	<jsp:include page="../header.jsp" />
	<script src="../JS/header.js"></script>

	<div class="body">
	<h1 class="header" style="margin-top:100px;">공지사항</h1>
	<hr>

	<table class="table table-hover text-center">
		<thead>
			<tr style="background-color: rgba(192,190,190,0.2); border:none">
				<th scope="col">NO</th>
				<th scope="col">제목</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>




			<c:choose>
				<c:when test="${empty list || fn:length(list) == 0}">
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list }" begin="0"
						end="${fn:length(list) - 1}">

						<tr>
							<td scope="row">${dto.post_uid }</td>
							<td><a href="noticePostView.po?post_uid=${dto.post_uid }" style="text-align: left; color:#333;">${dto.post_subject }</a></td>
							<td>${dto.post_regdate }</td>
						</tr>

					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>


			<jsp:include page="pagination.jsp">
				<jsp:param value="${writePages }" name="writePages" />
				<jsp:param value="${totalPage }" name="totalPage" />
				<jsp:param value="<%=curPage%>" name="curPage" />

			</jsp:include>



</div>
   
</body>
</html>