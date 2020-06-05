<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.AttachDAO" %>
<%-- cos 라이브러리 --%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.FileRenamePolicy" %>
<%-- 동일 이름의 파일 발견시 자동으로 변경 --%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%-- parameter 값들, file 값들 추출 --%>
<%@ page import="java.util.Enumeration" %>

<%--File 객체 --%>
<%@ page import="java.io.File" %>

<%-- 이미지 파일 다루기 --%>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.imageio.ImageIO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수정하기</title>
</head>
<script>
	function chkSubmit(){
		frm = document.form['frm'];
		var subject = frm['mypage_subject'].value.trim();
		
		if(mypage_subject == ""){
			alert("'MainTitle'은 반드시 작성해야 합니다.");
			frm['subject'].focus();
			return false;
		}
		return true;
	}
</script>
<body>
	<h2>수정화면-mypageUpdate</h2>
	<form name="frm" action="mypageUpdateOk.uo" method="post"
		onsubmit="return chkSubmit()" enctype="Multipart/form-data">
		headline:
		<input type="text" name="mypage_subject" value=""/>
	
		content:
		<input type="text" name="mypage_subject" value=""/>
	</form>

	<%
		String directory = application.getRealPath("../Maxim_Project/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multi
		= new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());
		
		// 사용자가 업로드한 file 은 "file" 이란 이름으로 넘어온다. / mypage.jsp 의 input에서 지정
		String oriName = multi.getOriginalFileName("file");
		String serverName = multi.getFilesystemName("file");
		
		new AttachDAO().fileUpload(oriName, serverName);
		out.write("파일명: " + oriName + "<br>");
		out.write("실제파일명: " + serverName + "<br>");
	%>
</body>
</html>