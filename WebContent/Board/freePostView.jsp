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

    <link rel="stylesheet" href="../CSS/view.css"/>
    <link rel="stylesheet" href="../CSS/delete-modal.css"/>
    <link rel="stylesheet" href="../CSS/cmt-update-modal.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="../JS/toggle-menu.js" type="text/javascript"></script>
<script src="../JS/delete-modal.js" type="text/javascript"></script>
<script src="../JS/cmt-update-modal.js" type="text/javascript"></script>

<script>
$(document).ready(function(){
	var postUid = ${list[0].post_uid};
	
	getList();
	
	// 댓글 목록을 보여주는 함수
	function getList(){
		var url = "commentList.ajax?post_uid=" + postUid;
		
		$.ajax({
			url :  url,
			type : "post",
			cache : false,
			success : function(data, status){
				if(status == "success") 
					parseJSON(data);
			}
		});
	}
	
	function parseJSON(jsonObj){
		var data = jsonObj.data;
		var i;
		var str="";
		
		if(data != null){
			for (i = 0; i < data.length; i++){ 			
				str += "<div class='comment-box'>";
				str += "<div class='cmt-header'>";
				str += "<div class='panel_cmt_info'>";
				str += "<span class='cmt-writer-name'>" + data[i].user_name + " </span>";
				str += "<span class='cmt-date'>(" + data[i].comment_regdate + ")</span>";
				str += "</div>";
				str += "<div class='panel_cmt_buttons'>";
				str += "<span class='link-cmt-update' onclick='openUpdateComment(" + data[i].comment_uid + ")'>수정</span>";
				str += "<a class='link-cmt-delete' href='commentDelete.ajax?comment_uid=" + data[i].comment_uid + "'>삭제</span>";
				str += "</div>";
				str += "</div>";
				str += "<span class='cmt-content'>" + data[i].comment_content + "</span>";
				str += "</div>";
				str += "</div>";
			} // end for
		}
		$(".comment-list").html(str);
	}
	//------------------------------
	
	// 댓글 작성 시 새로운 댓글 데이터를 반영하여 댓글 목록 보여주는 함수
	$(".frm-write-cmt button[type=submit]").click(writeComment);

	function writeComment(e){
		e.preventDefault();
		
		var queryString = $(".frm-write-cmt").serialize();
		console.log("query : " + queryString);
		
		var url = $(".frm-write-cmt").attr("action");
		console.log("url : " + url);
		
		$.ajax({
				type : "post",
				url : url,
				data : queryString,
				dataType: "json",
				success : writeSuccess
		});
	}

	function writeSuccess(){
		getList();
		$("textarea[name='comment_content']").empty();
	}
	//------------------------------
	
	// 댓글 삭제 시 삭제된 데이터를 반영하여 댓글 목록 보여주는 함수
	$(document).on('click', '.link-cmt-delete', deleteComment);
	
	function deleteComment(e){
		e.preventDefault();
		
		var url = $(this).attr("href");
		console.log("url : " + url);
		
		$.ajax({
			type : "post",
			url : url,
			data : {post_uid : postUid},
			dataType : "json",
			success : getList
		});
	}
	//------------------------------
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
        <button type="button" onclick="location.href='freeBoardList.po'">목록으로</button>
        <button class="btn-recommend" type="button">추천하기 <i class="far fa-thumbs-up"></i></button>
    </div>
    <!---------------------------------->
     
    <hr>
    
    <!-- 댓글 작성 폼 입니다. -->
    <form name="frm" class="frm-write-cmt" action="commentWrite.ajax" method="post" onsubmit="return chkSubmit()">
		<div class="wrap panel-comment-write">
	   
	    <!-- 보이지 않지만 form을 submit 할 때 같이 전달되는 값입니다 -->
	    <input type="hidden" name="post_uid" value="${list[0].post_uid }">
	    <input type="hidden" name="user_uid" value="1">
	    <!---------------------------------->
	    
	   	<textarea name="comment_content" placeholder="내용을 입력해 주세요."></textarea>
	   	<button class="btn-write-cmt" type="submit">작성</button>
	    </div>
    </form>
    <!---------------------------------->

	<div class="comment-list"></div>

	<!-- 댓글수정 버튼 클릭시 나타나는 모달창입니다. -->
	<form name="frm" id="cmt-update-frm" action="" method="post" onsubmit="return chkSubmit()">
    <div id="cmt-update-modal" class="modal">
        <div class="cmt-update-modal-content">
            <div class="cmt-update-modal-header">
                <div><span>댓글 수정</span></div>
            </div>
            <span class="close">&times;</span>
			<textarea name="comment_content" id="cmt-content"></textarea>
            <div class="cmt-update-modal-buttons">    
                <button type="button" class="back left-pull">뒤로가기</button>
                <button type="submit" class="ok right-pull">수정</button>
            </div>
        </div>
    </div>
    </form>
    <!---------------------------------->

</body>
</html>