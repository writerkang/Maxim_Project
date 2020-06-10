<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${empty result}">
		<script>
			alert('삭제 실패');
			history.back(); // 삭제 실패 시 직전 페이지로 이동
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('삭제 성공');
			location.href = "qnaBoardList.po"; // 삭제 후에는 list 페이지로 이동
		</script>
	</c:otherwise>
</c:choose>