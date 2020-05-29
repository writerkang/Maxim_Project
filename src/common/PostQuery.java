package common;

public class PostQuery {
	
	public static final String SQL_POST_INSERT = "INSERT INTO tb_post " +
			"(post_uid, post_subject, post_content, board_uid, category_uid, user_uid) " +
			"VALUES(post_seq.nextval, ?, ?, ?, ?, ?)";	
	
	public static final String SQL_POST_DELETE_BY_UID = 
			"DELETE FROM tb_post WHERE post_uid = ?";	
	
	public static final String SQL_WRITE_SELECT =
			"SELECT * FROM test_write ORDER BY wr_uid DESC";
	public static final String SQL_WRITE_UPDATE = 
			"UPDATE test_write SET wr_subject = ?, wr_content = ? WHERE wr_uid = ?";
		
	
	public static final String SQL_WRITE_INC_VIEWCNT = //조회수 증가 
			"UPDATE test_write SET wr_viewcnt = wr_viewcnt + 1 WHERE wr_uid = ?";
	public static final String SQL_WRITE_SELECT_BY_UID = //글 읽어오기
				"SELECT * FROM test_write WHERE wr_uid = ?";

}
