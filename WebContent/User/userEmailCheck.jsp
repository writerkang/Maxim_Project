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
    <title>Document</title>
    <style>
        .alert{
			position:fixed; 
			top:30%; 
			left:50%; 
			transform: translate(-50%,-50%);
            width: 50%;
            margin: 30px auto;
            text-align: center;
			border: 2px black;
			visibility:hidden;
			padding: 10px;
			background-color: white;
			opacity: 1;
			border-radius: 7px;
        }
        .top{
            background-color: black;
            color: white;
            text-align: center;
            padding: 10px 20px;
        }
        .content{
            text-align: center;
            padding: 30px 10px;
        }
        button{
            border-radius: 5px;
            background-color: #DEDEDE;
            border: 1px solid #b3b3b3;
            padding: 4px 6px;
        }
        a{
            color:blue;
            border-bottom: 1px soild black;
        }
    </style>
</head>
<body style="background-color: #ffe082;">

    <div class="alert" id="emailo" style="border: 2px solid black;">
        <div class="content">인증 성공! <a href="joinForm.uo?user_email=<%=(String) request.getAttribute("checkEmail")%>">회원가입페이지</a>로 이동합니다.</div>
    </div>

	<div class="alert" id="emailx" style="border: 2px solid black;">
        <div class="content">유효하지 않은 인증코드 입니다.</div>
        <button onclick= history.back() >뒤로 가기!</button>
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
			 $('#emailo').css('visibility', 'visible');
		</script>
		

	</c:when>

 	<c:otherwise>
		<script>
		$('#emailx').css('visibility', 'visible');
		</script>
	</c:otherwise>
</c:choose>

</body>
</html>
	



