// 비로그인 상태로 글쓰기 아이콘 클릭시 글쓰기 링크로 이동하지 않고 안내메시지를 띄워줍니다.
$(document).ready(function() {
	var userUid = $("#user_uid").text();
	console.log(userUid);

	$("#btn-write-pst").click(function(e) {
		if (userUid == null || userUid == "") {
			alert("로그인 후 이용 가능합니다!");
		} else {
			location.href = "qnaPostWrite.po";
		}
	});
});
//------------------------------