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



