<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${userEmailRegisterOk == 1 }">
		<!-- request 에 담겨온 result 를 의미(request.getAttribute("result") -->

		<c:redirect url="/User/userEmailSend.uo" context="/Maxim_Project">
			<c:param name="user_email" value="${param.user_email }" />
		</c:redirect>
	</c:when>

	<c:otherwise>
		<script>
			alert("인증이 완료된 이메일입니다.");
			location.href="login.uo";
		</script>
	</c:otherwise>
</c:choose>

