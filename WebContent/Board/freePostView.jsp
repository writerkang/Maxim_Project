<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- JSTL 버젼으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다. --%>
    
<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 게시물이 존재하지 않습니다!");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
	
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>View</title>

    <link rel="stylesheet" href="../CSS/view.css"/>
    <link rel="stylesheet" href="../CSS/delete-modal.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="../JS/toggle-menu.js" type="text/javascript"></script>
<script src="../JS/delete-modal.js" type="text/javascript"></script>

<script>
$(document).ready(function(){

	var i;
	var table="<tr><th>작성자</th><th>글내용</th><th>작성일</th></tr>";
	for (i = 0; i < commentList.length; i++) { 
		table += "<tr>";
		table += "<td>" + ${commentList[i].user_name} + "</td>";
		table += "<td>" + ${commentList[i].comment_content} + "</td>";
		table += "<td>" + ${commentList[i].comment_regdate} + "</td>";
	} // end for
	
	$("#commentList").html(table);
});
</script>
	    
<body>
    <div class="wrap bg-Lgray">
    	<!-- 작성자의 사진, 이름, 게시물의 작성일, 추천수, 댓글수, 조회수가 표시되는 영역입니다. -->
        <div class="panel-post-info">
            <div class="panel-p left-pull"> 
                <a class="writer-img" href="#"><img src="../user.png"></a>
                <div class="panel-c">
                    <div class="writer-name"><a href="#">닉네임</a></div>
                    <div class="write-date">${list[0].post_regdate }</div>
                </div>
            </div>
            <div class="right-pull">
                <div>
                    <i class="far fa-thumbs-up"></i><span>추천수</span>
                    <i class="fas fa-comment"></i><span>댓글수</span>
                    <i class="far fa-eye"></i><span>${list[0].post_viewcnt }</span>
                </div>
            </div>
        </div>
        <!---------------------------------->

        <hr>

		<!-- 게시물 제목, 토글메뉴(수정하기, 삭제하기), 스크랩 버튼이 위치한 영역입니다. -->
        <div class="panel-subject">
            <span class="subject">${list[0].post_subject }</span>
            <div class="btn-scrap right-pull">
                <i class="far fa-star fa-2x"></i> 
            </div>
            <div id="btn-toggle-menu" class="right-pull">
                <i class="fas fa-ellipsis-v fa-2x"></i>
                <div id="toggle-menu-content">
                    <div class="btn-modify"><a href="freePostUpdate.po?post_uid=${list[0].post_uid }">수정하기</a></div>
                    <div class="btn-delete"><a href="#">삭제하기</a></div>
                </div>
            </div>
        </div>
        <!---------------------------------->

		<!-- 삭제하기 버튼 클릭시 나타나는 모달창입니다. -->
        <div id="delete-modal" class="modal">
            <div class="delete-modal-content">
                <div class="delete-modal-header">
                    <div><span>정말 삭제 하시겠습니까?</span></div>
                    <div><span class="text-red">(삭제 시 복구 할 수 없습니다)</span></div>
                </div>
                <span class="close">&times;</span>
    
                <div class="delete-modal-buttons">    
                    <button type="button" class="back left-pull">뒤로가기</button>
                    <button type="button" class="ok right-pull" onclick="location.href='freePostDeleteOk.po?post_uid=${list[0].post_uid }'">확인</button>
                </div>
            </div>
        </div>
        <!---------------------------------->

		<!-- 게시물 내용이 표시되는 영역입니다. -->
        <div class="content">${list[0].post_content }</div>
        <!---------------------------------->
    </div>

	<!-- 추천하기 버튼이 위치한  영역입니다. -->
    <div class="panel-recommend">
        <button class="btn-recommend" type="button">추천하기 <i class="far fa-thumbs-up"></i></button>
    </div>
    <!---------------------------------->
        
    <hr>
    
    <!-- 추가된 부분 -->
    <table id="commentList"></table>
    <!--  -->
    
</body>
</html>

	</c:otherwise>
</c:choose>