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

	<div id="myModal1" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center; line-height: 1.5;"><br/>인증이 완료된 이메일입니다.</p>
                <p style="text-align: center; line-height: 1.5;"><br/><a href= "javascript:window.history.back()" >뒤로가기!</a></p>
                <p><br /></p>

      </div>
 
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
			$('#myModal1').show();
		</script>
	</c:otherwise>
</c:choose>


</body>
</html>
	



