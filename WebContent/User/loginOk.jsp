<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<c:choose>
 	<c:when test="${loginOk == 0 || loginOk == -1 }">
		<script>
			alert("이메일이 존재하지 않거나 비밀번호가 틀립니다.");
			history.back();
		</script>
	</c:when>
	<c:when test="${loginOk == 1 }">  <!-- request 에 담겨온 result 를 의미(request.getAttribute("result") -->
		<script>
			alert("로그인 성공!");
			location.href="../index.html";
		</script>
	</c:when>
	
	
</c:choose>

