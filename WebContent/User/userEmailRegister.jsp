<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원이메일 인증</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="../JS/userEmailRegister.js" type="text/javascript"></script>
    <link href="../CSS/userEmailRegister.css" rel="stylesheet" type="text/css">
    <script src="https://use.fontawesome.com/afbd8941a0.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

</head>
<body>
   <!--  <div id="top"> -->
        <form id = "bini" action="userEmailRegisterOk.uo" style="text-align: left;" class="form">
	        <h1>Join</h1>
	        <p class="text">회원가입을 위해 이메일 인증이 필요합니다.</p>
            <input type="text" name="user_email" id="user_email" placeholder="UserEmail" class="input">

<!--             </select> -->
            <input type="submit" id="submit_btn" value="이메일 인증하기" class="btn-join" />
        </form>
	<div class="back">
		<input type="submit" value="뒤로가기" class="btn-back"
			onclick="history.back()" />
	</div>
	<script type="text/javascript">
   		 	$('#submit_btn').click(function(){
   		 		$('#submit_btn').submit(function(){
	   		 		$('#submit_btn').attr("disabled", true);  
   		 			
   		 		});
   		 	});
            	
            </script>
</body>
</html>