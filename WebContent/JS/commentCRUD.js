$(document).ready(function(){
	var postUid = $("#post_uid").text();

	// 페이지가 로딩되면 댓글 목록을 보여줍니다.
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
				str += "<span class='cmt-uid' style='display: none'>" + data[i].comment_uid + "</span>";
				str += "<span class='cmt-writer-name'>" + data[i].user_name + "</span> ";
				str += "<span class='cmt-date'>(" + data[i].comment_regdate + ")</span>";
				str += "</div>";
				str += "<div class='panel_cmt_buttons'>";
				str += "<span class='link-cmt-update'>수정</span>";
				str += "<a class='link-cmt-delete' href='commentDelete.ajax?comment_uid=" + data[i].comment_uid + "'>삭제</a>";
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
	$("#frm-write-cmt button[type=submit]").click(writeComment);

	function writeComment(e){
		e.preventDefault();
		
		var queryString = $("#frm-write-cmt").serialize();
		console.log("query : " + queryString);
		
		var url = $("#frm-write-cmt").attr("action");
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
		$("textarea[name='comment_content']").val("");
	}
	//------------------------------
	
	// 댓글 수정 시 모달창을 띄워주는 함수
	$(document).on('click', '.link-cmt-update', openUpdateComment);
	
	function openUpdateComment(e){
		var item = $(this).closest(".comment-box");
		var comment_uid = item.find(".cmt-uid").text();
		var cmt_content = item.find(".cmt-content").text();
		
		// 모달창에 보여줄 데이터 세팅
		$("#modal-update-cmt-uid").val(comment_uid);
		$("#modal-update-cmt-content").val(cmt_content);
		
		// 모달창을 보여줌
		$("#modal-update-cmt").css("display", "block");
	}
	//------------------------------
	
	// 댓글 수정 시 새로운 댓글 데이터를 반영하여 댓글 목록 보여주는 함수
	$("#frm-update-cmt button[type=submit]").click(updateComment);

	function updateComment(e){
		e.preventDefault();
		
		var queryString = $("#frm-update-cmt").serialize();
		console.log("query : " + queryString);
		
		var url = $("#frm-update-cmt").attr("action");
		console.log("url : " + url);
		
		$.ajax({
				type : "post",
				url : url,
				data : queryString,
				dataType : "json",
				success : updateSuccess
		});
	}
	
	function updateSuccess(){
		$("#modal-update-cmt").css("display", "none");
		getList();
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