$(document).ready(function() {
	// 폼검증
	$("#frm-update-pst").submit(function(e){
		var category = $("select[name=category_uid]").val();
		var subject = $("input[name=post_subject]").val().trim();
		var content = CKEDITOR.instances.editor1.getData().trim(); 
		
		if(category == null || category == ""){
			event.preventDefault();
			alert("카테고리를 선택해 주세요!");
			$("select[name=category_uid]").focus();
		} else if(subject == null || subject == "") {
			event.preventDefault();
			alert("제목을 입력해 주세요!");
			$("input[name=post_subject]").focus();
		} else if(content == null || content == "") {
			event.preventDefault();
			alert("내용을 입력해 주세요!");
			CKEDITOR.instances.editor1.focus();
		}
	});
	//------------------------------
});