package common;

public class PointQuery {
	public static final String SQL_POINT_INC = //포인트 증가 
			"UPDATE TB_USER SET USER_POINT = USER_POINT + ? WHERE USER_UID = ?";
	
	public static final String SQL_FIND_USERUID = //게시글의 유저 uid 찾기 
			"SELECT USER_UID FROM TB_POST WHERE POST_UID = ?";

}
