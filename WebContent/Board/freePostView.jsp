<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- JSTL 버젼으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다. --%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>View</title>

	<link rel="stylesheet" href="../CSS/header.css" />
    <link rel="stylesheet" href="../CSS/postView.css"/>
    <link rel="stylesheet" href="../CSS/modal-deletePost.css"/>
    <link rel="stylesheet" href="../CSS/modal-updateComment.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="../JS/postView.js" type="text/javascript"></script>
<script src="../JS/toggle-menu.js" type="text/javascript"></script>
<script src="../JS/modal-deletePost.js" type="text/javascript"></script>
<script src="../JS/modal-updateComment.js" type="text/javascript"></script>
<script src="../JS/commentCRUD.js" type="text/javascript"></script>

<body>

<!-- 헤더 부분 입니다. -->
<jsp:include page="../header.jsp" />
<script src="../JS/header.js"></script>
<!---------------------------------->

    <div class="wrap bg-Lgray">
    	<!-- 작성자의 사진, 이름, 게시물의 작성일, 추천수, 댓글수, 조회수가 표시되는 영역입니다. -->
        <div class="panel-post-info">
        
        	<!-- 보이지 않지만 user_uid(게시물 작성자), post_uid 값을 끌어다 쓸 때 사용됩니다.-->
        	<span id="pst_writer_uid" style="display: none">${list[0].user_uid }</span>
        	<span id="post_uid" style="display: none">${list[0].post_uid }</span>
        	<!--  -->
        	
            <div class="panel-p left-pull"> 
                <a class="pst_writer-img" href="#"><img src="../user.png"></a>
                <div class="panel-c">
                    <div class="pst_writer-name"><a href="#">닉네임</a></div>
                    <div class="pst_write-date">${list[0].post_regdate }</div>
                </div>
            </div>
            <div class="right-pull">
                <div>
                    <i class="far fa-thumbs-up"></i><span>추천수</span>
                    <i class="fas fa-comment"></i><span>댓글수</span>
                    <i class="far fa-eye"></i><span>${list[0].post_viewcnt}</span>
                </div>
            </div>
        </div>
        <!---------------------------------->

        <hr>

		<!-- 게시물 제목, 토글메뉴(수정하기, 삭제하기), 스크랩 버튼이 위치한 영역입니다. -->
        <div class="panel-subject">
            <span class="subject">${list[0].post_subject}</span>
            <div id="btn-scrap" class="right-pull">
                <i class="far fa-star fa-2x"></i> 
            </div>
            <div id="btn-toggle-menu" class="right-pull">
                <i class="fas fa-ellipsis-v fa-2x"></i>
                <div id="toggle-menu-content">
                    <div class="btn-modify"><a href="freePostUpdate.po?post_uid=${list[0].post_uid}">수정하기</a></div>
                    <div class="btn-delete"><a href="#">삭제하기</a></div>
                </div>
            </div>
        </div>
        <!---------------------------------->

		<!-- 삭제하기 버튼 클릭시 나타나는 모달창입니다. -->
        <div id="modal-delete-pst" class="modal">
            <div class="modal-delete-pst-container">
                <div class="modal-delete-pst-header">
                    <div><span>정말 삭제 하시겠습니까?</span></div>
                    <div><span class="text-red">(삭제 시 복구 할 수 없습니다)</span></div>
                </div>
                <span class="close">&times;</span>
    
                <div class="modal-delete-pst-buttons">    
                    <button type="button" class="back left-pull">뒤로가기</button>
                    <button type="button" class="ok right-pull" onclick="location.href='freePostDeleteOk.po?post_uid=${list[0].post_uid}'">확인</button>
                </div>
            </div>
        </div>
        <!---------------------------------->

		<!-- 게시물 내용이 표시되는 영역입니다. -->
        <div class="content">${list[0].post_content}</div>
        <!---------------------------------->
    </div>
	
	<!-- 추천하기 버튼이 위치한  영역입니다. -->
    <div class="panel-recommend">
        <button type="button" onclick="location.href='freeBoardList.po?page=${page}'">목록으로</button>
        <button id="btn-recommend" type="button">추천하기 <i class="far fa-thumbs-up"></i></button>
    </div>
    <!---------------------------------->
     
    <hr>

    <!-- 댓글 작성 폼 입니다. -->
    <form name="frm" id="frm-write-cmt" action="commentWrite.ajax" method="post" onsubmit="return chkSubmit()">
		<div class="wrap panel-comment-write">
	   
	    <!-- 보이지 않지만 form을 submit 할 때 같이 전달되는 값입니다 -->
	    <input type="hidden" name="post_uid" value="${list[0].post_uid}">
	    <input type="hidden" name="user_uid" value="${userDto[0].user_uid }">
	    <!--  -->
	    
	   	<textarea name="comment_content" placeholder="내용을 입력해 주세요."></textarea>
	   	<button class="btn-write-cmt" type="submit">작성</button>
	    </div>
    </form>
    <!---------------------------------->

	<div class="comment-list"></div>

	<!-- 댓글 수정 버튼 클릭시 나타나는 모달창입니다. -->
	<form name="frm" id="frm-update-cmt" action="commentUpdate.ajax" method="post">
	
		<!-- 보이지 않지만 form을 submit 할 때 같이 전달되는 값입니다 -->
		<input type="hidden" name="post_uid" id="modal-update-cmt-post-uid" value="${list[0].post_uid}">
		<input type="hidden" name="comment_uid" id="modal-update-cmt-uid" value="">
		<!--  -->
		
	    <div id="modal-update-cmt" class="modal">
	        <div class="modal-update-cmt-container">
	            <div class="modal-update-cmt-header">
	                <div><span>댓글 수정</span></div>
	            </div>
	            <span class="close">&times;</span>
				<textarea name="comment_content" id="modal-update-cmt-content"></textarea>
	            <div class="modal-update-cmt-buttons">    
	                <button type="button" class="back left-pull">뒤로가기</button>
	                <button type="submit" class="ok right-pull">수정</button>
	            </div>
	        </div>
	    </div>
    </form>
    <!---------------------------------->

</body>
</html>