<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<c:choose>
	<c:when test="${userEmailRegisterOk == 1 }">  <!-- request 에 담겨온 result 를 의미(request.getAttribute("result") -->
		<c:out value="${sessionScope.user_email }"/>
		<script>
			location.href="userEmailSend.uo";
		</script>
	</c:when>
	
 	<c:otherwise>
		<script>
			alert("이미 가입된 이메일입니다.");
			location.href="index.uo";
		</script>
	</c:otherwise>
</c:choose>

    