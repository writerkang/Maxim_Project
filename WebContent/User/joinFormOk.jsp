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
     <link href="../CSS/modal.css" rel="stylesheet" type="text/css">
    
    <title>Document</title>
</head>
<body>

	<div id="myModal1" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center; line-height: 1.5;"><br/>이미 존재하는 이메일입니다.</p>
                <p style="text-align: center; line-height: 1.5;"><br/><a href= "javascript:window.history.back()" >뒤로가기!</a></p>
                <p><br /></p>

      </div>
 
    </div>

	<div id="myModal2" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center; line-height: 1.5;"><br/>반갑습니다! 시스아웃 회원이 되신 걸 축하드립니다. 로그인해주세요!</p>
                <p style="text-align: center; line-height: 1.5;"><br/><a href="/Maxim_Project/User/login.uo">로그인</a>하러 가기!</p>
                <p><br /></p>

      </div>
 
    </div>



<c:choose>
	<c:when test="${joinOk == 1 }">
		<script>
			$('#myModal2').show();	
		</script>
	</c:when>
	<c:when test="${joinOk == 0 }">
		<script>
			$('#myModal1').show();	
		</script>
	</c:when>
</c:choose>
</body>
</html>
	

    