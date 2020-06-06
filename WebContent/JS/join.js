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


/*
 * 
 
// name  중복체크 
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
var idJ = /^[a-z0-9]{5,10}$/;
$("#user_name").blur(function() {
	// id = "user_name" / name = "user_name"
	var user_name = $('#user_name').val();
	$.ajax({
		url : "nameChk.uo",
		type : 'POST',
		data : user_name,
		success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : " + data);							
			
			if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#user_name").text("사용중인 닉네임입니다 :(");
					$("#user_name").css("color", "red");
					$("#sub_btn").attr("disabled", true);
				} else {
					
					if(idJ.test(user_name)){
						// 0 : 아이디 길이 / 문자열 검사
						$("#user_name").text("");
						$("#sub_btn").attr("disabled", false);
			
					} else if(user_id == ""){
						
						$('#user_name').text('아이디를 입력해주세요 :)');
						$('#user_name').css('color', 'red');
						$("#sub_btn").attr("disabled", true);				
						
					} else {
						
						$('#user_name').text("아이디는 소문자와 숫자 5~10자리만 가능합니다 :)");
						$('#user_name').css('color', 'red');
						$("#sub_btn").attr("disabled", true);
					}
					
				}
			}, error : function() {
					console.log("실패");
			}
		});
	});

*/



























