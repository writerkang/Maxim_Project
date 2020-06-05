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
<title>파일 업로드 결과</title>
</head>
<body>
	<%
		String directory = application.getRealPath("upload");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multi
		= new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());
		
		// 사용자가 업로드한 file 은 "file" 이란 이름으로 넘어온다. / mypage.jsp 의 input에서 지정
		String oriName = multi.getOriginalFileName("file");
		String serverName = multi.getFilesystemName("file");
		
		if(!oriName.endsWith(".png")&& !oriName.endsWith(".jpg")
				&& !oriName.endsWith("gif")){
			
		}
		
		
		new AttachDAO().fileUpload(oriName, serverName);
		out.write("파일명: " + oriName + "<br>");
		out.write("실제파일명: " + serverName + "<br>");
	%>
</body>
</html>