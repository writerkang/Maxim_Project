package common;

public class StarQuery {
	
	public static final String SQL_STAR_INSERT = "INSERT INTO tb_star " +
			"(star_uid, user_uid, post_uid) " +
			"VALUES(post_seq.nextval, ?, ?)";
	
	public static final String SQL_STAR_COUNT =
			"SELECT count(*) count FROM TB_star "
			+ "WHERE POST_UID = ?";
	
	public static final String SQL_STAR_GET_BY_POSTUID =
			"SELECT * FROM TB_star "
			+ "WHERE POST_UID = ?";
	
	public static final String SQL_STAR_COUNT_BY_POST_AND_USER =
			"SELECT count(*) count FROM TB_star "
			+ "WHERE USER_UID = ? AND POST_UID = ?";
	
}
