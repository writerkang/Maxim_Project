<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<title>Update</title>
</head>

<script>
    function chkSubmit() {  // 폼 검증
        frm = document.forms["frm"];
        
        var category_uid = frm["category_uid"].value.trim();
        var post_subject = frm["post_subject"].value.trim();
        
        if(category_uid == "") {
            alert("카테고리 유형을 선택해 주세요!");
            frm["category_uid"].focus();
            return false;
        }
        if(post_subject == "" || post_subject.trim().length() == 0) {
            alert("제목을 입력해 주세요!");
            frm["post_subject"].focus();
            return false;
        }
        if(post_content == "" || post_content.trim().length() == 0) {
            alert("내용을 입력해 주세요!");
            frm["post_content"].focus();
            return false;
        }
        return true;
    }
</script>

<body>
    <form name="frm" action="freePostUdateOk.po" method="post" onsubmit="return chkSubmit()">
    <div class="wrap bg-Lgray">
    
        <!-- 보이지 않지만 form을 submit 할 때 같이 전달되는 값입니다 -->
        <input type="hidden" name="board_uid" value="2">
        <input type="hidden" name="user_uid" value="1">
        <!---------------------------------->
        
        <div class="panel-writer"><span>작성자 닉네임</span></div>

        <hr>

		<!-- 카테고리 선택 부분입니다. -->
        <div class="panel-post">
            <div>
                <span class="text-red">*</span> <label for="category_uid">카테고리 유형</label>
            </div>
            <div>
                <select name="category_uid">
                    <option value="">카테고리 유형을 선택해 주세요</option>
                    <option value="1">FrontEnd</option>
                    <option value="2">BackEnd</option>
                    <option value="3">Java</option>
                    <option value="4">Android</option>
                    <option value="5">JavaScript</option>
                    <option value="6">HTML5</option>
                    <option value="7">CSS</option>
                    <option value="8">잡담</option>
                    <option value="9">기타</option>
                </select>
            </div>
        </div>
        <!---------------------------------->

		<!-- 제목 입력 부분입니다. -->
        <div class="panel-post">
            <div>
                <span class="text-red">*</span> <label for="post_subject">제목</label>
            </div>
            <div>
                <input type="text" name="post_subject" placeholder="제목을 입력해 주세요."/>${list[0].post_subject }
            </div>
        </div>
        <!---------------------------------->

		<!-- 내용 입력 부분입니다. -->
        <div class="panel-post">
            <div>
                <span class="text-red">*</span> <label for="post_content">글 내용</label>
            </div>
            <div>
                <textarea name="post_content" placeholder="내용을 입력해 주세요."></textarea>${list[0].post_content }
            </div>
        </div>
        <!---------------------------------->
    </div>

    <hr>

    <div class="wrap">
        <div class="panel-buttons">
            <button class="btn-cancel left-pull" type="button">취소</button>
            <button class="bg-yellow right-pull" type="submit">등록</button>
        </div>
    </div>
    </form>

	<!-- 취소 버튼 클릭시 나타나는 모달창입니다. -->
    <div id="cancel-modal" class="modal">
        <div class="cancel-modal-content">
            <div class="cancel-modal-header">
                <div><span>정말 취소 하시겠습니까?</span></div>
                <div><span class="text-red">(임시저장은 되지 않습니다)</span></div>
            </div>
            <span class="close">&times;</span>

            <div class="cancel-modal-buttons">    
                <button type="button" class="back left-pull">뒤로가기</button>
                <button type="button" class="ok right-pull" onclick="history.back()">확인</button>
            </div>
        </div>
    </div>
    <!---------------------------------->
</body>
</html>

	</c:otherwise>
</c:choose>