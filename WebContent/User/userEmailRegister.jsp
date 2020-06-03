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
    <div id="top">
        <span>
        <i class="fas fa-chevron-left fa-2x"></i>
        <span style="font-size: 30px; font-weight: bold;">뒤로</span>
        </span>
        <span style="font-size: 50px; margin: 3px 40px;" >회원가입</span>
    </div>
    <div id="main" style="text-align: center; padding: 10px 20px;">
        <i class="fas fa-image fa-9x"></i>
        <br>
        <h3>회원가입을 위해 이메일 인증이 필요합니다. </h3>
        <br><hr>
        <h1 style="text-align: left; font-weight: normal;">이메일</h1>
        <form action="#" style="text-align: left;">
            <input type="text" name="email_id" id="email_id">
            <span style="font-size: 40px;">@</span>
            <input type="text" name="email_adress" id="email_adress">
            <select name="email_site" id="email_site">
                <option value="" class="email">직접입력</option>
                <option value="naver.com" class="email">naver.com</option>
                <option value="gmail.com" class="email">gmail.com</option>
                <option value="daum.net" class="email">daum.net</option>

            </select>
            <input type="submit" id="submit_btn" value="이메일 인증하기">
        </form>
    </div>
</body>
</html>