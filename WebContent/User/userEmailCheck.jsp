<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="util.SHA256"%>
<%@page import="beans.UserDAO" %>
	
	<c:set var="user_email" value="${param.user_email }" />
	<c:set var="code" value="${param.code }" />
 
 <%
	String user_email = (String)pageContext.getAttribute("user_email") ;
	String code = (String)pageContext.getAttribute("code") ;
	
	String rightCode = (new SHA256().getSHA256(user_email).equals(code)) ? "1" : "0";

	pageContext.setAttribute("rightCode", rightCode) ;
	
 %>


<c:set var="rightCode" value="${rightCode}"></c:set>
<c:choose>
	<c:when test="${rightCode eq '0'}">  
		<script>
			alert("인증 성공! 회원가입페이지로으로 이동합니다.");
			location.href="joinForm.uo";
		</script>
	</c:when>
 	<c:otherwise>
		<script>
		alert("유효하지 않은 인증코드 입니다. ");
		history.back();
		</script>
	</c:otherwise>
</c:choose>

    