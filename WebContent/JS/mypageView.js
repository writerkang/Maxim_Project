$(document).ready(function() {
	// if(${userDto[0].user_uid!=param.user_uid}){
	// $('#update_btn').shide();
	// }
	$('form input[name=mypage_subject]').attr('disabled', true);
	$('form textarea[name=mypage_content').attr('disabled', true);

	// 버튼 : 수정이면 -> 저장으로, 저장 이면 -> 수정으로
	$('#update_btn').click(function() {
		var self = this;

		if (this.value == "수정") {
			this.value = "저장"; // 버튼text -> '저장'으로 바꾼다.
			$("#mypage_subject").attr('disabled', false);
			$('#mypage_content').attr('disabled', false);
		} else {
			this.value = "수정"
			updateOk();
			$("#mypage_subject").attr('disabled', true);
			$('#mypage_content').attr('disabled', true);
			alert('수정완료!')
		}
	});

	// ajax 사용하여 post방식으로 수정 요청
	function updateOk() {

		var formData = $('#frmView2').serialize();
		// var sub = $('#mypage_subject').val();
		// formData += "&mypage_subject=" + sub;
		$.ajax({

			url : "updateOk.ajax",
			type : "post",
			data : formData,
			dataType : "json",
			cache : false,
			success : function(data, status) {
//				var jsonObj = data;
//				var count = jsonObj.count;
//				var i;
//				var items = jsonObj.data; // 배열
//				result = "";
//				var sub;
//				var con;
//				for(i = 0; i < count; i++){
//					sub = items[i].mypage_subject;
//					con = items[i].mypage_content;
////					   $($(':text')[i++]).val(sub);
//				} // end for
////				console.log(sub + " : " + con);
//				
//				$('#mypage_subject').html(sub);
//				$('#mypage_content').html(con);
//				
			} 
		});

	}
	
});