<%@page import="org.ietf.jgss.Oid"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- JSTL 버젼으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다. --%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notice</title>

    <link rel="stylesheet" href="../CSS/notice.css"/>
</head>
<body>
    <div class="header"><span>공지사항</span></div>

    <table>
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>등록일</th>
        </tr>
        
        
        
        <c:choose>		
		<c:when test="${empty list || fn:length(list) == 0}">
		</c:when>		
		<c:otherwise>
		<c:forEach var="dto" items="${list }" begin="0" end="${fn:length(list) - 1}">		
	
			<tr>
				<td>${dto.post_uid }</td>
				<td><a href="noticePostView.po?post_uid=${dto.post_uid }">${dto.post_subject }</a></td>
				<td>${dto.post_regdate }</td>
		   	</tr>

	  	</c:forEach>
	  	</c:otherwise>
	</c:choose>
        

    </table> 
</body>
</html>