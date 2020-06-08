<%@page import="org.ietf.jgss.Oid"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- JSTL 버젼으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다. --%>

<%
	int curPage = 1;   // 현재 페이지 (디폴트 1 page)
	
	// 현재 몇 페이지인지 parameter 받아오기 + 검증
	String pageParam = request.getParameter("page");
	if(pageParam != null && !pageParam.trim().equals("")){
		try{ 
			// 1이상의 자연수 이어야 한다
			int p = Integer.parseInt(pageParam);
			if(p > 0) curPage = p;
		} catch(NumberFormatException e){
			// page parameter 오류는 별도의 exception 처리 안함 
		}
	} // end if
%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <link rel="stylesheet" href="../CSS/header.css" />
    <link href="../CSS/board.css" rel="stylesheet" type="text/css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	
	<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
	
</head>

<script src="../JS/board.js" type="text/javascript"></script>

<!-- 비로그인 상태로 글쓰기 아이콘 클릭시 글쓰기 링크로 이동하지 않고 안내메시지를 띄워줍니다. -->
<script>
$(document).ready(function(){
	var userUid = $("#user_uid").text();
	console.log(userUid);
	
	if(userUid == null || userUid == "") {
		$("#pen").click(function(e){
			e.preventDefault();
			console.log(userUid);
			
			alert("로그인 후 이용 가능합니다!");
		});
	}
});
</script>
<!---------------------------------->

<body style="background-color: #e6e6e6;">

<!-- 헤더 부분 입니다. -->
<jsp:include page="../header.jsp" />
<script src="../JS/header.js"></script>
<!---------------------------------->

    <h2 style="text-align: left;">자유게시판</h2>
    <div id="tag">
        <button id="tag1" class="tags" onclick="" >최신순</button>
        <button id="tag2" class="tags" >조회순</button>
        <button id="tag3" class="tags" >추천순</button>
        <!-- 아래에 글쓰기 링크 -->
        <a href="freePostWrite.po"><i class="fas fa-pen fa-2x" id="pen"></i></a>
    </div> 
    

	<c:choose>		
		<c:when test="${empty list || fn:length(list) == 0}">
		</c:when>		
		<c:otherwise>
		<c:forEach var="dto" items="${list }" begin="0" end="${fn:length(list) - 1}">		
		<table class="text">
		
			<tr>
				<td id="text_uid" style="font-size:10px; float: left;">${dto.post_uid }</td>
				<td id="text_title"><a href="freePostView.po?post_uid=${dto.post_uid }">${dto.post_subject }</a></td>
		   	</tr>
		   	<tr>
		       	<td id="nick_name">${dto.user_name }</td>
		       	<td style="font-size: 12px; font-weight: bold;">댓글수 ${dto.comments_count}</td>
		       	<td style="font-size: 12px; font-weight: bold;">조회수 ${dto.post_viewcnt }</td>
		       	<td id="text_date">${dto.post_regdate }</td>
		    </tr>
		</table>
	  	</c:forEach>
	  	</c:otherwise>
	</c:choose>
    
   	<br>
	
    <form method="get" name="frm" action="./freePostFind.po?page=1" >
	    <span id="search">
	        <select name="search" id="search_sele">
	            <option value="1">제목</option>
	            <option value="2">내용</option>
	            <option value="3">작성자</option>
	        </select>
	    </span>
	    <div id="ser_cont">
	            <input type="text" name="ser_content" id="content" placeholder="내용을 입력해주세요">
	        
	    </div>	    
	    <button>검색</button>
	    <!-- 보이지 않지만 form을 submit 할 때 같이 전달되는 값입니다 -->
	    <input type="hidden" name="page" value="1">
	    <!---------------------------------->
    </form>

    
<%-- 위 트랜잭션이 마무리 되면 페이지 보여주기 --%>

<%-- 페이징 --%>
<jsp:include page="pagination.jsp"> 
	<jsp:param value="${writePages }" name="writePages"/>
	<jsp:param value="${totalPage }" name="totalPage"/>
	<jsp:param value="<%= curPage %>" name="curPage"/>
</jsp:include>
    
</body>

</html>