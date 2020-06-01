package common;

public class UserQuery {

	public static final String SQL_USER_SELECT = 
			"SELECT * FROM tb_user ORDER BY user_uid DESC"; 
	
	
	/* Insert */
	// 회원가입 회원 정보 삽입 
	public static final String SQL_USER_INSERT = "INSERT INTO tb_user " +
			"(user_uid, user_email, user_pw, user_phone, user_nickName) " +
			"VALUES(user_seq.nextval, ?, ?, ?, ?)";	
		
	// 이메일 인증 체크여부
	public static final String SQL_EMAIL_CHECK = 
			"SELECT user_emailChecked FROM tb_user WHERE user_email = ?";
	
	// 이메일 체크값이 0(false)인 경우 -> 체크값을 1(true)로 변경
	public static final String SQL_SET_EMAIL_CHECK = 
			"UPDATE tb_user SET user_emailChecked = '1' WHERE user_email = ?";
	
	
	/* Select */
	// 로그인 
	// tb_user 테이블에서 'user_email' 가져오기
	public static final String SQL_USER_EMAIL = 
			"SELECT user_email FROM tb_user";
	
	// 해당 이메일을 가진 회원의 비번pw 가져오기
	public static final String SQL_USER_PW = 
			"SELECT user_pw FROM tb_user WHERE user_email = ?";
	
	// 해당 이메일을 가진 회원의 이름 가져오기 
	public static final String SQL_USER_NAME = 
			"SELECT user_name FROM tb_user WHERE user_email = ?";

	// 해당 이메일을 가진 회원의 휴대전화번호 가져오기 
	public static final String SQL_USER_PHONE = 
			"SELECT user_phone FROM tb_user WHERE user_email = ?";
	
	
	
	// 특정 회원 uid 로부터 정보 가져오기
	public static final String SQL_USER_SELECT_BY_UID =  
			"SELECT * FROM tb_user WHERE user_uid = ?";

	// 회원 탈퇴 
	public static final String SQL_USER_DELETE_BY_UID = 
			"DELETE FROM tb_user WHERE user_uid = ?";


}
