<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:choose>
	<c:when test="${param.nameChk == 1 }">   <!-- 중복  -->
		<c:redirect url="/User/joinForm.uo">
			<c:param name="data" value="1"></c:param>
		</c:redirect>
	</c:when>

	<c:when test="${param.nameChk == 0 }">  <!-- 중복 X -->
		<c:redirect url="/User/joinForm.uo">
			<c:param name="data" value="0"></c:param>
		</c:redirect>
	</c:when>

</c:choose>







