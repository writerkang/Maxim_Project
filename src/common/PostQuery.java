package common;

public class PostQuery {
	
	public static final String SQL_POST_INSERT = "INSERT INTO tb_post " +
			"(post_uid, post_subject, post_content, board_uid, category_uid, user_uid) " +
			"VALUES(post_seq.nextval, ?, ?, ?, ?, ?)";	
	
	public static final String SQL_POST_DELETE_BY_UID = 
			"DELETE FROM tb_post WHERE post_uid = ?";	
	
	public static final String SQL_POST_INC_VIEWCNT = //조회수 증가 
			"UPDATE tb_post SET post_viewcnt = post_viewcnt + 1 WHERE post_uid = ?";
	
	public static final String SQL_POST_SELECT_BY_UID = //특정 uid의 게시글 모든 내용 읽어오기
			"SELECT * FROM tb_post WHERE post_uid = ?";
	
	public static final String SQL_POST_SELECT =
			"SELECT * FROM tb_post ORDER BY post_uid DESC";
	
	public static final String SQL_POST_UPDATE = 
			"UPDATE tb_post SET post_subject = ?, post_content = ? WHERE post_uid = ?";

}
