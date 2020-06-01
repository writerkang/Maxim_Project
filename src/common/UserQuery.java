package common;

public class UserQuery {
 
public static final String SQL_INSERT = "INSERT INTO user_join VALUES(user_seq.nextval, ?, ?, ?, ?, 0)";
	
	//user email 가져오기
	public static final String SQL_GET_EMAIL = "SELECT user_email FROM user_join WHERE user_id = ?";
	
	// pw 가져오기
	public static final String SQL_SET_EMAIL_CHECK = "UPDATE user_join SET userEmailChecked = '1' WHERE user_id = ?";
	
	
	// 이름 가져오기
	public static final String SQL_EMAIL_CHECK = "SELECT user_emailchecked FROM user_join WHERE user_id = ?";
	
	// 휴대전화 가져오기 
	
	//
	
	
}
