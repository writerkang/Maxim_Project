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
//닉네임
var nameJ = /^[가-힣0-9^ㄱ-ㅎ]{3,10}$/;
var empJ = /\s/g;
var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
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
				$("#name_check").text("사용중인 닉네임입니다 :(");
				$("#name_check").css("color", "red");
				$("#sub_btn").attr("disabled", true);
			} else if(data == 0){ // 중복없는 네임 중에서~
				
				if(nameJ.test($("#user_name").val())){ // 정규식 통과한
					console.log("확인: " + true);
					$("#name_check").text('사용 가능합니다~~!');
					$('#name_check').css('color', 'blue');
					$("#sub_btn").attr("disabled", false);
				
				}else if ($("#user_name").val() == ""){
					$('#name_check').text('닉네임을 입력해주세요 :)');
					$('#name_check').css('color', 'green');
					$("#sub_btn").attr("disabled", true);
				
				} else if(empJ.test($("#user_name").val())){
					$('#name_check').text('공백없이 입력해주세요 :)');
					$('#name_check').css('color', 'red');
					$("#sub_btn").attr("disabled", true);
				
				} else if(regExp.test($("#user_name").val())){
					$('#name_check').text('특수문자는 입력할 수 없습니다 :(');
					$('#name_check').css('color', 'red');
					$("#sub_btn").attr("disabled", true);
				
				} else {
					$('#name_check').text('닉네임은 한글,숫자 포함하여 5~10자리입니다. :)');
					$('#name_check').css('color', 'red');
					$("#sub_btn").attr("disabled", true);
				}
	
			}
		},
		error : function() {
			console.log("실패");
		}
	});
});


//replaceAll(/\-/g, '')
//휴대전화
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

$('#user_phone').blur(function(){
	
	var user_phone = $("#user_phone").val();
	console.log(user_phone);
	
	user_phone = user_phone.replace(/\-/g,"");
	console.log(user_phone);
	
	if(phoneJ.test(user_phone)){
		$("#phone_check").text('통과');
		$('#phone_check').css('color', 'blue');
		$("#sub_btn").attr("disabled", false);
		
	} else{
		$('#phone_check').text('휴대전화를 다시 확인해주세요.');
		$('#phone_check').css('color', 'red');
		$("#sub_btn").attr("disabled", true);
	}
});









