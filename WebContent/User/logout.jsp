<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%--
<c:set var="userDto" scope="session" value="${userDto} "/>
<p>Before removing value from session: <c:out value="${userDto}"/></p>
<c:remove var="userDto"/>
<p>After removing value from session: <c:out value="${userDto}"/></p>
 --%>


<!-- JSTL 사용하여 session invalidate 하는 방법 -->
<c:set var="userDto" scope="session" value="${userDto} "/>
<c:remove var="userDto"/>

<script>
	alert("정상적으로 로그아웃 되었습니다.");
	location.href = "../header.jsp"
</script>

