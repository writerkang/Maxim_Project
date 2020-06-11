package common;

public class CommentQuery {
	
	public static final String SQL_COMMENT_INSERT = "INSERT INTO tb_comment " +
			"(comment_uid, comment_content, post_uid, user_uid) " +
			"VALUES(comment_seq.nextval, ?, ?, ?)";	
	
	public static final String SQL_COMMENT_DELETE_BY_UID = 
			"DELETE FROM tb_comment WHERE comment_uid = ?";	

	//특정 uid게시글의 모든 댓글 가져오기, 시간순으로 정렬, join하여 user_name 가져오기
	public static final String SQL_COMMENT_SELECT_BY_UID = 
			"SELECT tc.*, tu.user_name FROM tb_comment tc, tb_user tu "
			+ "WHERE tc.user_uid = tu.user_uid AND post_uid = ? ORDER BY comment_regdate";
	
	public static final String SQL_COMMENT_UPDATE = 
			"UPDATE tb_comment SET comment_content = ? WHERE comment_uid = ?";
	
	public static final String SQL_COMMENT_SELETED_BY_UID = 
			"UPDATE TB_COMMENT SET COMMENT_SELECTED = 'T' WHERE COMMENT_UID = ?";

}
