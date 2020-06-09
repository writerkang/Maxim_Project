<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../JS/login.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../CSS/log.css" />
    <title>Login</title>
  </head>
  <body>
    <form action="loginOk.uo" class="form" name="frm" method="post" onsubmit="return chkSubmit();">
      <h1>Login</h1>
      <input type="email" name="user_email" placeholder="UserEmail" class="input" />
      <input type="password" name="user_pw" placeholder="Password" class="input" />
      <input type="submit" id="btn_login" value="Login" class="btn-login" />
    </form>
    <div class="section_02">
        <h3 class="yet">아직 회원이 아니신가요?</h3>
        <input type="submit" value="JoinUs" class="btn-join" onclick="location.href='userEmailRegister.uo'" />
    </div>
  </body>
</html>