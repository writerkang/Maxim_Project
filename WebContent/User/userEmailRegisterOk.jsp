<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

    <div class="alert" id="emailx" style="border: 2px solid black;">
        <div class="content">인증이 완료된 이메일입니다.</div>
        <button onclick= history.back() >뒤로 가기!</button>
    </div>



<c:choose>
	<c:when test="${userEmailRegisterOk == 1 }">
		<!-- request 에 담겨온 result 를 의미(request.getAttribute("result") -->

		<c:redirect url="/User/userEmailSend.uo" context="/Maxim_Project">
			<c:param name="user_email" value="${param.user_email }" />
		</c:redirect>
	</c:when>

	<c:otherwise>
		<script>
			$('#emailx').css('visibility', 'visible');
		</script>
	</c:otherwise>
</c:choose>


</body>
</html>
	



