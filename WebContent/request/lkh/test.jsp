<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.PostDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<%
	PostDAO dao = new PostDAO();
	//int cnt = dao.insert("고구마", "고구마는 맛있다", 1, 1, 2);
	int cnt = dao.deleteByUid(5);
	out.println(cnt);
%>

</body>
</html>