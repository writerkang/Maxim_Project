<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../JS/login.js" type="text/javascript"></script>
<link href="../CSS/login.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>로그인</title>
</head>
<body>
	<!-- 
노란색  : #FFD966
진한검은색 : #333333
진한회색 : #808080
회색 : #B3B3B3
연한회색 : #DEDEDE

html[lang='ko'] {
  font-family: 'Suisse Regular', sans-serif;
}
     -->

		<!-- 로그인 Form -->
		<form class="form" name="frm" action="loginOk.uo" method="post" onsubmit="return chkSubmit();">
			<h1>Login</h1>
			<!-- 입력 영역(이메일, 비번) -->
			<input type="email" name="user_email" id="user_email" placeholder="UserEmail" class="input" /> 
			<input type="password" name="user_pw" placeholder="Password" class="input" />

			<!-- Checkbox 이메일저장 -->
			<div class="check_save">
				<input type="checkbox" name="chkSave" id="saveEmail" />
				<label for="saveEmail"><a class="saveEmail">이메일 저장</a></label>
			</div>
			<!-- button 로그인하기 -->
			<div class="btn_submit">
				<input type="submit" id="btn_login" value="Login" class="btn-login"/>
			</div>
		</form>
			

	
	<div class="section_02">
		<h3>아직 회원이 아니신가요?</h3>
		<div id="btnJoin">
			<input class="btn_yet" onclick="location.href='userEmailRegister.uo'" type="button" value="JoinUs"/>
		</div>
	</div>


	<script type="text/javascript">

	$(document).ready(function(){
	    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
	    $("input[name='user_email']").val(userInputId); 
	     
	    if($("input[name='user_email']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
	                                           // 아이디 저장하기 체크되어있을 시,
	        $("#saveEmail").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#saveEmail").change(function(){ // 체크박스에 변화가 발생시
	        if($("#saveEmail").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='user_email']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='user_email']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#saveEmail").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='user_email']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	//  쿠키 생성
		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value)
					+ ((exdays == null) ? "" : "; expires="	+ exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}

		// 쿠키 삭제 
		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires="
					+ expireDate.toGMTString();
		}

		// 쿠키 가져오기 
		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) {
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
	</script>

</body>
</html>