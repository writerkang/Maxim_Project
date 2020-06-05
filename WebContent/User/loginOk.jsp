<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%-- 
	<% session.getAttribute("arr"); %> <!-- arr 이라는 이름의 세션값 받음. -->
<!-- 	세션에 저장된 arr 에서  email(id)값만 뽑아내야해. 
		email 값이 null 인 경우에만 -> 로그인 시키도록-->
	session: <%= session.getAttribute("arr")%>
	 --%>
	 
<%-- 	${sessionScope.userDto[0].user_uid } --%>
	
	<%
		UserDTO [] arr = (UserDTO[])request.getAttribute("arr");
	%>
	
<c:choose>

 	<c:when test="${loginOk == 0 || loginOk == -1 }">
		<script>
			alert("이메일이 존재하지 않거나 비밀번호가 틀립니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${loginOk == 1 }">  <!-- request 에 담겨온 result 를 의미(request.getAttribute("result") -->
		<% HttpSession session1 = request.getSession(true);
			session1.setAttribute("userDto", arr);%>
		<script>
			alert("로그인 성공!");
			location.href="../index.html";
		</script>
	</c:when>
	
</c:choose>
