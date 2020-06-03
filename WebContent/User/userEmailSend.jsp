<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@page import="util.SHA256"%>
<%@page import="util.Gmail"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<c:choose>
	<c:when test="${sendEmail eq '1' }">  <!-- request 에 담겨온 result 를 의미(request.getAttribute("result") -->
		<script>
			alert("이미 인증된 회원입니다.");
			location.href="login.uo";
		</script>
	</c:when>
	
 	<c:when test="${sendEmail eq '0' }">
		<script>
// <!--  		alert("이메일주소 인증 메일이 전송되었습니다.<br>이메일에 들어가셔서 인증해주세요."); -->
		</script> 
	<%
		// 사용자에게 보낼 메시지를 기입합니다.
	String host = "http://localhost:8109/Maxim_Project/User";
	String from = "leeyji375";
	String to = "${param.user_email}";
	String subject = "제발 되어라";
	String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." + "<a href='" + host + "userEmailCheck.uo?code="
			+ new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";

	// SMTP에 접속하기 위한 정보를 기입합니다.
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");

	try {
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF-8");
		Transport.send(msg);
	} catch (Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다..');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
		
	 %>
		
		
		
		
		
		<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이메일 전송</title>
</head>
<body>
	<h1>이메일 주소 인증 메일이 전송되었습니다. 이메일에 들어가셔서 인증해주세요.</h1>
	</c:when>
</c:choose>
</body>
</html>
