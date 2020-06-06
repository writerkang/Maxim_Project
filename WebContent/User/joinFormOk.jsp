<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	
<c:choose>
	<c:when test="${joinOk == 1 }">
		<script>
			alert("반갑습니다! 시스아웃 회원이 되신 걸 축하드립니다. 로그인해주세요!");
			location.href="login.uo";
			</script>
	</c:when>
 	<c:otherwise>
		<script>
			alert("가입된 이메일입니다.");
			history.back();
		</script>
	</c:otherwise>
</c:choose>

    