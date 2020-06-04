<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${empty result}">
		<script>
			alert('삭제 실패');
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			location.href = document.referrer; 
		</script>
	</c:otherwise>
</c:choose>