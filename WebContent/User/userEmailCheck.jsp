<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="util.SHA256"%>
<%@page import="beans.UserDAO" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="../CSS/modal.css" rel="stylesheet" type="text/css">
    <title>Document</title>

</head>
<body style="background-color: #ffe082;">

	
	
	<div id="myModal1" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center; line-height: 1.5;"><br/>인증 성공!</p>
                <p style="text-align: center; line-height: 1.5;"><br/><button onclick="location.href='joinForm.uo?user_email=<%=(String) request.getAttribute("checkEmail")%>'">회원가입 페이지로!</button></p>
                <p><br /></p>

      </div>
 
    </div>

	<div id="myModal2" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center; line-height: 1.5;"><br/>유효하지 않은 인증코드 입니다.</p>
                <p style="text-align: center; line-height: 1.5;"><br/><button onclick=history.back()>뒤로가기!</button></p>
                <p><br /></p>

      </div>
 
    </div>
	


<%-- aaa:<%=  (String) pageContext.getAttribute("checkEmail") %><br> --%>
<%-- bbb:<%=  (String) request.getAttribute("checkEmail") %><br> --%>

	<c:set var="user_email" value="${param.checkEmail }" />
	<c:set var="code" value="${param.code }" />
 <%
	String user_email = (String) request.getAttribute("checkEmail") ;
	String code = (String)pageContext.getAttribute("code") ;
	String rightCode = ((new SHA256()).getSHA256(user_email).equals(code)) ? "1" : "0";
	
	pageContext.setAttribute("rightCode", rightCode) ;  // pageContext 는 해당 페이지에서 setA~ 하고 , getA ~ 받을 수 있다.
 %>

		<%-- 	<%new UserDAO().SetUserEmailChecked(user_email); %> --%>
<%-- 			location.href="joinForm.uo?user_email=<%=(String) request.getAttribute("checkEmail")%>"; --%>

<c:set var="rightCode" value="${rightCode}"></c:set>
<c:choose>
	<c:when test="${rightCode eq '1'}">
	<% (new UserDAO()).SetUserEmailChecked(user_email); %>
<!-- 		<form name="frm" action="joinForm.uo" method="POST"> -->
<%-- 			<input type="hidden" name="user_email" value="${param.checkEmail }" /> --%>
<!-- 		</form> -->
		
		<script>
			/* function post_to_url(path, params, method) {
				method = "post";
				var form = document.createElement("form");
				form.setAttribute("method", method);
				form.setAttribute("action", path);
				for ( var user_email in params) {
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", user_email);
					hiddenField.setAttribute("value", params[user_email]);
					form.appendChild(hiddenField); // form 태그의 새끼로 들어감
				}
				document.body.appendChild(form);
				form.submit();
			}
			
			post_to_url('http://http://localhost:8109/Maxim_Project/User/login.uo/', {'user_email':'param[user_email]'});
			 */
			 $('#myModal1').show();
		</script>
		

	</c:when>

 	<c:otherwise>
		<script>
		$('#myModal2').show();
		</script>
	</c:otherwise>
</c:choose>

</body>
</html>
	



