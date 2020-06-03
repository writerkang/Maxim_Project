function chkSubmit() {
    var frm = document.forms['frm'];


    
    if (frm['user_email'].value.trim() == "") {
        alert("이메일을 입력해주세요");
        // return false;   // onsubmit 에 false 를 리턴하면 submit 안된다    만약 검증 통과 못하면 false 

        // 알림창 누르면 해당 필수 요소 목록에 가서 커서 깜빡깜빡 거림
        frm['user_email'].focus() // return false 하기 전에 커서 위치 시키면 좋다
        return false;
    }

    if(frm['user_pw'].value.trim() == ""){
        alert("비밀번호를 입력해주세요");

        frm['user_pw'].focus();
        return false;
    }

    return true; // onsubmit 에 true를 리턴하면 submit 진행된다 
}