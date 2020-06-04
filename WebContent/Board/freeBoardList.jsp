<%@page import="org.ietf.jgss.Oid"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- JSTL 버젼으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다. --%>









<%@ page import = "java.sql.*"%> <%-- JDBC 관련 import --%>    
<%@ page import = "java.text.SimpleDateFormat" %>
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

<%!
	// JDBC 관련 기본 객체변수
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery() 
	ResultSet rs2 = null;
	int cnt = 0;   // DML 결과, executeUpdate()
	
	// Connection 에 필요한 값 세팅
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";  // JDBC 드라이버 클래스
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";  // DB 접속 URL
	final String USERID = "maxim0316";  // DB 접속 계정 정보
	final String USERPW = "tiger0316";
%>

<%!
	// 쿼리문 준비
	//final String SQL_WRITE_SELECT = 
	//	"SELECT * FROM test_write ORDER BY wr_uid DESC";
	// 페이징
	// 글 목록 전체 개수 가져오기
	final String SQL_WRITE_COUNT_ALL = "SELECT count(*) FROM tb_post";
	
	// fromRow 부터 pageRows 만큼 SELECT
	// (몇번째) 부터 (몇개) 만큼
	final String SQL_WRITE_SELECT_FROM_ROW =  "SELECT * FROM " + 
			"(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM tb_post ORDER BY post_uid DESC) T) " + 
			"WHERE RNUM >= ? AND RNUM < ?";
	
	final String SQL_WRITE_SELECT_NAME =  "SELECT user_name FROM " +
			"TB_USER WHERE USER_UID = ?";


	// 페이징 관련 세팅 값들
	int writePages = 5;   // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
	int pageRows = 5;    // 한 '페이지' 에 몇개의 글을 리스트업 할 것인가?
	int totalPage = 0;	 // 총 몇 '페이지' 분량인가?
%>
<%
	try{
		Class.forName(DRIVER);
		
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		
		
		// 트랜잭션 실행
		pstmt = conn.prepareStatement(SQL_WRITE_COUNT_ALL);
		rs = pstmt.executeQuery();
		
		if(rs.next())
			cnt = rs.getInt(1);   // count(*), 전체 글의 개수
			
		rs.close();
		pstmt.close();	
		
		totalPage = (int)Math.ceil(cnt / (double)pageRows); // 총 몇페이지 분량
		
		int fromRow = (curPage - 1) * pageRows + 1;  // 몇번째 row 부터?
				
		pstmt = conn.prepareStatement(SQL_WRITE_SELECT_FROM_ROW);
		pstmt.setInt(1, fromRow);  
		pstmt.setInt(2, fromRow + pageRows);
		rs = pstmt.executeQuery();
		
		//out.println("쿼리 성공<br>");
		
			int rnum = 0;
			
			int uid = 0;
			String subject = "";
			String name = "";
			int viewcnt = 0;
			String D = "";
			
%>	














<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="../CSS/board.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
	
</head>

<script src="../JS/board.js" type="text/javascript"></script>

<body style="background-color: #e6e6e6;">
    <h2 style="text-align: left;">자유게시판</h2>
    <div id="tag">
        <button id="tag1" class="tags" onclick="" >최신순</button>
        <button id="tag2" class="tags" >조회순</button>
        <button id="tag3" class="tags" >추천순</button>
        <!-- 아래에 글쓰기 링크 -->
        <a href="freePostWrite.po"><i class="fas fa-pen fa-2x" id="pen"></i></a>
    </div>
    
    

		
    

		<c:set var="totalPage"  value="<%=new Integer(totalPage)%>"/>
		<c:set var="writePages"  value="<%=new Integer(writePages)%>"/>
		<c:set var="pageRows"  value="<%=new Integer(pageRows)%>"/>
	

	<c:choose>
		
		<c:when test="${empty list || fn:length(list) == 0}">
		</c:when>
		
		<c:otherwise>
		<c:forEach var="dto" items="${list }" begin="0" end="${writePages-1 }">
	<%
		rs.next();
		uid = rs.getInt("post_uid");
		subject = rs.getString("post_subject");
		viewcnt = rs.getInt("post_viewcnt");
		D = rs.getString("post_regdate");
		
		rs2.close();
		pstmt2.close();
		pstmt2 = conn.prepareStatement(SQL_WRITE_SELECT_NAME);
		pstmt2.setInt(1, uid);  
		rs2 = pstmt2.executeQuery();
		
		name = rs2.getString("user_name");
		
		
		

		
	%>

		<c:set var="uid"  value="<%=new Integer(uid)%>"/>
		<c:set var="viewcnt" value="<%=new Integer(viewcnt) %>"/>
		<c:set var="subject" value="<%=new String(subject) %>"/>
		<c:set var="D" value="<%=new String(D) %>"/>
		<c:set var="name" value="<%=new String(name) %>"/>
		
		<table class="text">
		
			<tr>
				<td id="text_uid" style="font-size:10px; float: left;">${uid }</td>
				<td id="text_title"><a href="freePostView.po?post_uid=${uid }">${subject }</a></td>
		   	</tr>
		   	<tr>
		       	<td id="nick_name">${name }</td>
		       	<td style="font-size: 12px; font-weight: bold;">댓글수 &nbsp;&nbsp;&nbsp;조회수 ${viewcnt }
		       	<td id="text_date">${D }</td>
		    </tr>
		</table>
	  	</c:forEach>
	  	</c:otherwise>
	</c:choose>
    
   	<br>
	
    <span id="search">
        <select name="serach" id="search_sele">
            <option value="글내용">글내용</option>
            <option value="글제목">글제목</option>
            <option value="작성자">작성자</option>
        </select>
    </span>
    <div id="ser_cont">
        <form action="#" >
            <input type="text" name="ser_content" id="content" placeholder="내용을 입력해주세요">
        </form>
    </div>
    
    
    
    
    
    <%	
	} catch(Exception e){
		e.printStackTrace();
		// 예외 처리
	} finally {
		// 리소스 해제
		try {
			if(rs != null) rs.close();
			if(rs2 != null) rs2.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(pstmt2 != null) pstmt2.close();
			if(conn != null) conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<%-- 위 트랜잭션이 마무리 되면 페이지 보여주기 --%>

<%-- 페이징 --%>
<jsp:include page="pagination.jsp"> 
	<jsp:param value="<%= writePages %>" name="writePages"/>
	<jsp:param value="<%= totalPage %>" name="totalPage"/>
	<jsp:param value="<%= curPage %>" name="curPage"/>
</jsp:include>
    
    
    
    
    
    
</body>

</html>