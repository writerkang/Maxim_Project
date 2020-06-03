package common;

public class UserQuery {

		// 이메일 인증 버튼 누르기 전 이메일 입력(인증여부 초기값 '0' 세팅)
		public static final String SQL_USER_EMAIL_INSERT = "INSERT INTO tb_email " +
				"(user_email, user_emailHash, user_emailChecked) " + 
				"VALUES(?, ?, '0')";	
		
		
		// tb_user 테이블에서 'user_email' 가져오기
		public static final String SQL_USER_EMAIL = 
				"SELECT user_email FROM tb_email";
		
		// 이메일 인증 체크여부
		public static final String SQL_GET_EMAIL_CHECK = 
				"SELECT user_emailChecked FROM tb_email WHERE user_email = ?";
		
		// 이메일 체크값이 0(false)인 경우 -> 체크값을 1(true)로 변경
		public static final String SQL_SET_EMAIL_CHECK = 
				"UPDATE tb_email SET user_emailChecked = '1' WHERE user_email = ?";
		
		
		
		
		// 인증 된 이메일 -> 회원정보 insert 하기
		public static final String SQL_USER_INFO_INSERT = "INSERT INTO tb_user " +
				"(user_uid, user_email, user_name, user_phone, user_pw) " +
				"VALUES(user_seq.nextval, ?, ?, ?, ?) " + "WHERE user_email = ?";	
		
		
		
		
		
		/* Select */

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

		// 회원 탈퇴 (특정 uid 로부터? or 해당 이메일로부터?)
		public static final String SQL_USER_DELETE_BY_UID = 
				"DELETE FROM tb_user WHERE user_uid = ?";

}
