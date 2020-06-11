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
<link rel="stylesheet" href="../CSS/footer.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="../CSS/bootstrap.css">
<link rel="stylesheet" href="../CSS/notice.css">

<title>Notice</title>
</head>
<body>
	<h1 class="header">공지사항</h1>
	<hr>

	<table class="table table-hover text-center">
		<thead>
			<tr style="background-color: #e9ecef;">
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
							<td><a href="noticePostView.po?post_uid=${dto.post_uid }" style="text-align: left;">${dto.post_subject }</a></td>
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




   <footer class="ft_white">
        <div class="ft_link">
            <ul class="ft_link-ul">
                <li class="about">
                    <p>ABOUT SYSOUT FROM MAXIM</p>
                </li>
                <p class="snsicon">
                    <i class="fab fa-instagram fa-3x"></i>
                    <i class="fab fa-facebook-square fa-3x"></i>
                </p>
            </ul>

            <div class="div-call">
                <p class="call">문의전화</p>
                <p class="callnumber">
                    <strong class="tel">1588-5890</strong>
                    <a class="teltime">(평일 09:00 ~ 18:00)</a>
                </p>
                <p class="ars">
                    <span>
                        <i class="fas fa-phone-volume"></i>
                        <a class="ico_ars">ARS 안내</a>
                    </span>
                </p>
            </div>
            <div class="logo">
                <img>
                <p>SYSOUT</p>
                <p>SONSORED BY KOREAIT</p>
            </div>
        </div>
        <hr>
        <div class="ft_info">
            <a href="#">이용약관</a>
            <a href="#"><Strong>개인정보처리방침</Strong></a>
            <a href="#">광고문의</a>
        </div>
        <hr>
        <div class="ft_addr1">
            <a>(주)코리아아이티</a>
            <a>서울특별시 강남구 테헤란로 146 (역삼동)</a>
            <a>대표자 : 이강혁</a>
        </div>
        <div class="ft_addr2">
            <a>사업자등록번호 : 123-12-12345</a>
            <a>개인정보보호책임자 : 이예지</a>
            <a>문의전화 : 1588-5890</a>
        </div>
        <div class="ft_addr3">
            <p class="copy">© 2020 MAXIM KOREAIT ACADEMY. ALL RIGHTS RESERVED</p>
        </div>
    </footer>

</body>
</html>