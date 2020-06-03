<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@page import="util.SHA256"%>
	<%
	 String rightCode = new SHA256().getSHA256("${param.checkEmail}").equalsIgnoreCase("${param.code}") ? "1" : "0";
	%>


<c:choose>
	<c:when test="${rightCode.equals(1) }">  <!-- request 에 담겨온 result 를 의미(request.getAttribute("result") -->
		<script>
			alert("인증 성공!");
			location.href="joinForm.uo";
		</script>
	</c:when>
	
 	<c:when test="${rightCode.equals(0) }">
		<script>
		alert("유효하지 않은 인증코드 입니다. ");
		</script>
		
	</c:when>
</c:choose>

    