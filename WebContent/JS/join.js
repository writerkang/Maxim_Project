function chkSubmit() {
    var frm = document.forms['frm'];

    if (frm['user_name'].value.trim() == "") {
        alert("닉네임을 입력해주세요");

        frm['user_name'].focus()
        return false;
    }
    if (frm['user_phone'].value.trim() == "") {
    	alert("휴대전화 입력해주세요");
    	
    	frm['user_phone'].focus()
    	return false;
    }
    if (frm['user_pw'].value.trim() == "") {
    	alert("비밀번호를 입력해주세요");
    	
    	frm['user_pw'].focus()
    	return false;
    }
    if (frm['user_PwChk'].value.trim() == "") {
    	alert("비밀번호를 확인해주세요!");
    	
    	frm['user_PwChk'].focus()
    	return false;
    }
    
    if (frm['user_PwChk'].value.trim() != frm['user_pw'].value.trim()) {
    	alert("비밀번호를 동일하게 입력해주세요.");
    	
    	frm['user_PwChk'].focus()
    	return false;
    }
    
    if (frm["service_ck"].checked == false) {
    	alert("서비스 이용약관에 동의하세요.")
    	return false;
    }
    if (frm["privacy_ck"].checked == false) {
    	alert("개인정보 수집 및 이용에 동의하세요.")
    	return false;
    }

    return true; // onsubmit 에 true를 리턴하면 submit 진행된다 
}



 
 
// name  중복체크 
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
//var idJ = /^[a-z0-9]{5,10}$/;
$("#user_name").blur(function() {
	var user_name = $('#user_name').val();
	$.ajax({
		url : "nameChk.uo",  // request 할 url 
		type : "post",   	// request 방식
		cache : false,
		dataType : "json",
		data :  {			user_name : user_name},// request 에 전송할 데이터 (사용자가 입력한 name)
		success : function(data) { // 요청 성공했을 떄의 콜백함수 
			console.log("data : " + data);							
			console.log("1 = 중복o / 0 = 중복x : " + data);	
			if (data == 1) {
				// 1 : 닉네임이 중복되는 문구
				$("#id_check").text("사용중인 닉네임입니다 :(");
				$("#id_check").css("color", "red");
				$("#sub_btn").attr("disabled", true);
			} else if(data == 0){
//
//				if (idJ.test(user_name)) {
//					// 0 : 아이디 길이 / 문자열 검사
//					$("#id_check").text("");
//					$("#sub_btn").attr("disabled", false);	
//
//				} else if (user_name == "") {
//
//					$('#id_check').text('아이디를 입력해주세요 :)');
//					$('#id_check').css('color', 'red');
//					$("#sub_btn").attr("disabled", true);
//
//				} else {
//
//					 $('#id_check').text("아이디는 소문자와 숫자 5~10자리만 가능합니다 :)");
//					 $('#id_check').css('color', 'red');
//					 $("#sub_btn").attr("disabled", true);
//				}

				// 2 : 사용가능 닉네임
				$("#id_check").text("사용가능한 닉네임입니다 :)");
				$("#id_check").css("color", "green");
				$("#sub_btn").attr("disabled", false);
			}
		},
		error : function() {
			console.log("실패");
		}
	});
});













