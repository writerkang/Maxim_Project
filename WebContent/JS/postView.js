// 본인이 작성한 글을 볼 때와 다른 사람이 작성한 글을 볼 때 보여줄, 감출 요소을 결정합니다.
$(document).ready(function(){
	var userUid = $("#user_uid").text();
	var pstWriterUid = $("#pst_writer_uid").text();
	console.log("user_uid(로그인 유저): " + userUid);
	console.log("pst_writer_uid(게시물 작성자): " + pstWriterUid);
	
	if(userUid == null || userUid == ""){
		console.log("비로그인 상태입니다");
		$("#btn-update-pst").css("display", "none");
		$("#btn-delete-pst").css("display", "none");
		$("#btn-scrap").css("display", "none");
		$("#btn-recommend").css("display", "none");	
		$("#btn-recommend").parent().css("display", "none");	
	} else if(userUid == pstWriterUid){
		console.log("이 게시물 작성자시네요");
		$("#btn-scrap").css("display", "none");
		$("#btn-recommend").css("display", "none");
		$("#btn-recommend").parent().css("display", "none");
	} else {
		console.log("다른 분의 게시물을 보고계십니다");
		$("#btn-update-pst").css("display", "none");
		$("#btn-delete-pst").css("display", "none");
	}
});
//------------------------------