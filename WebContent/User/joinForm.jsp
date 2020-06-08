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
    <script src="https://use.fontawesome.com/afbd8941a0.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="../CSS/joinForm.css" rel="stylesheet" type="text/css">

    <title>회원정보입력</title>
</head>
<body>
    <h1 style="text-align: center;">회원정보입력</h1>
    <%--  <%=request.getParameter("user_email") %> --%>
        <form id="frm" action="joinFormOk.uo" method="post" onsubmit="return chkSubmit();">
    <div style="background-color: #FFD966; width: 85%; margin: 10px auto; padding: 30px 0px; margin-bottom: 0px;" >
        <div style="text-align: center;">
            <i class="fas fa-user-edit fa-5x"></i>
        </div> 
            <span style="display: inline-block; width: 110px; text-align: right;">아이디(이메일)</span> 
            <input type="email" class="form" name="user_email" value="${param.user_email }" ><br><br>
            
            <span style="display: inline-block; width: 110px; text-align: right;">*닉네임</span> 
            <input type="text" class="form" name="user_name" id="user_name" required>
            <div class="check_font" id="id_check"></div> <%-- 경고문 들어갈 div --%>
            <span style="display: inline-block; width: 110px; text-align: right;"></span> <span style="font-size: 8px;">※ 한글, 숫자 5자이내</span><br>
            
            <span style="display: inline-block; width: 110px; text-align: right;">*휴대폰</span> 
            <input type="number" class="form" name="user_phone" id="user_phone" required>
            <span style="display: inline-block; width: 110px; text-align: right;"></span> <span style="font-size: 8px;">※ '-' 없이 입력해주세요.</span><br>
            
            <span style="display: inline-block; width: 110px; text-align: right;">*비밀번호</span> 
            <input type="password" class="form" name="user_pw" id="user_pw" required>
            <span style="display: inline-block; width: 110px; text-align: right;"></span> <span style="font-size: 8px;">※ 숫자, 문자 조합하여 10자~16자 이상 입력</span><br>
            
            <span style="display: inline-block; width: 110px; text-align: right;">*비밀번호 확인</span> 
            <input type="password" class="form" name="user_PwChk"><br><br>
    </div>
    
    
    <div style="background-color: #333333; color: white; width: 85%; margin: 0px auto; padding-top: 15px;">
        <h2 style="margin: 0px; text-align: center;">서비스 이용약관</h2>
        
            <input type="checkbox" name="terms" id="terms" class="terms"> 전체 약관동의<br><br>
            서비스 이용약관(필수)
            <input type="checkbox" name="service_ck" id="service_ck" class="terms"><br><br>
            <div id="trem_content">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&nbsp;tempor incididunt ut labore et dolo.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&nbsp;tempor incididunt ut labore et dolo.ore et dol
            </div>
            <br>
            개인정보수집(필수)
            <input type="checkbox" name="privacy_ck" id="privacy_ck" class="terms"><br><br>
            <div id="trem_content">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&nbsp;tempor incididunt ut labore et dolo.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&nbsp;tempor incididunt ut labore et dolo.ore et dol
            </div>
            <br>
            <input type="submit" name="sub_btn" id="sub_btn" value="회원가입 하기">
    </div>
        </form>
            <script src="../JS/join.js" type="text/javascript"></script>
</body>
</html>