<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .alert{
	        position:fixed; 
	        top:50%; 
	        left:50%; 
	        transform:translate(-50%,-50%);
            width: 20%;
            margin: 30px auto;
            text-align: center;
            visibility: hidden;
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
            color: black;
        }
    </style>
</head>
<body>

    <div class="alert" id="emailo">
        <div class="content">이미 존재하는 이메일입니다.</div>
        <div><a href="/Maxim_Project/WebContent/User/login.jsp">로그인</a>하러 가기!</div>
    </div>
    
    <div class="alert" id="emailx">
        <div class="content">반갑습니다! 시스아웃 회원이 되신 걸 축하드립니다. 로그인해주세요!</div>
        <div><a href="/Maxim_Project/WebContent/User/login.jsp">로그인</a>하러 가기!</div>
    </div>

<c:choose>
	<c:when test="${joinOk == 1 }">
		<script>
		$('#emailx').css('visibility', 'visible');
			</script>
	</c:when>
	<c:when test="${joinOk == 0 }">
		<script>
			$('#emailo').css('visibility', 'visible');
			</script>
	</c:when>
</c:choose>
</body>
</html>
	

    