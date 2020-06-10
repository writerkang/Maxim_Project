package common;

public class MypageQuery {
	
	// 해당 uid 회원에 대한 글제목, 글내용 가져온다(readByUid 수행하여 mypage 에서 View 해줌)
	public static final String SQL_VIEW_BY_UID =  
			"SELECT mypage_subject, mypage_content FROM tb_user WHERE user_uid = ?";
	
	
	// mypage 수정
	// 해당 uid 회원의 글제목, 글내용 수정
	public static final String SQL_UPDATE_BY_UID =
			"UPDATE tb_user " +
			"SET mypage_subject = ? , mypage_content = ? WHERE user_uid = ?";
	
	

}
