$(document).ready(function() {
	
	$('form input[type')

	// 버튼 : 수정이면 -> 저장으로, 저장 이면 -> 수정으로 
    $('#update_btn').click(function() {
        var self = this;
       if(this.value == "수정"){
    	   this.value = "저장"; // 버튼text -> '저장'으로 바꾼다.
    	   $("#mypage_subject").attr('disabled', true);
       } else{
    	   this.value = "수정";
    	   updateOk();
    	   $("#mypage_subject").attr('disabled', false);
       }
     });

});


// ajax 사용하여 post방식으로  수정 요청 
// request 성공은 됨.
function updateOk(){
	
	var formData = $('#frmView2').serialize();
	var sub = $('#mypage_subject').val();
	formData += "&mypage_subject=" + sub;
	$.ajax({
		
		url : "updateOk.ajax",
		type : "post",
		data : formData,
		dataType : "json",
		cache : false,
		success : function(data, status){
			alert(data);
		}
		
	});
	
}


//function change( el ) {
//    if ( el.value === "수정" )
//    el.value = "저장";
//    else
//    el.value = "수정";
//   }
////
//function update_form(b_no) {
//	
//	$.ajax({
//		url : "updateOk.ajax",
//		type : "POST",
//		cache : false,
//		dataType : "json",
//		data : 
//		success : function(data) {
//			$('#b_title').val(data.b_title);
//			$('#b_content').val(data.b_content);
//
//			$('#update_btn').html('저장');
//			$('#update_btn').off('click');
//			$('#update_btn').on('click', update_proc);
//		},
//
//		error : function(request, status, error) {
//			var msg = "ERROR : " + request.status + "<br>"
//			msg += +"내용 : " + request.responseText + "<br>" + error;
//			console.log(msg);
//		}
//	});
//}


