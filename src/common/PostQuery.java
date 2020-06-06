package common;

public class PostQuery {
	
	public static final String SQL_POST_INSERT = "INSERT INTO tb_post " +
			"(post_uid, post_subject, post_content, board_uid, category_uid, user_uid) " +
			"VALUES(post_seq.nextval, ?, ?, ?, ?, ?)";	
	
	public static final String SQL_POST_DELETE_BY_UID = 
			"DELETE FROM tb_post WHERE post_uid = ?";	
	
	public static final String SQL_POST_INC_VIEWCNT = //조회수 증가 
			"UPDATE tb_post SET post_viewcnt = post_viewcnt + 1 WHERE post_uid = ?";
	
	//특정 uid의 게시글 모든 내용 읽어오기
	//Join 사용하여 user_name도 가져온다
	public static final String SQL_POST_SELECT_BY_UID = 
//			"SELECT * FROM tb_post WHERE post_uid = ?";
			"SELECT tp.*, tu.USER_NAME FROM TB_POST tp , TB_USER tu "
			+ "WHERE tp.USER_UID = tu.USER_UID AND tp.POST_UID = ?";
	
	//모든 게시글 읽어오기
	//Join 사용하여 user_name도 가져온다
	public static final String SQL_POST_SELECT =
//			"SELECT * FROM tb_post ORDER BY post_uid DESC";
			"SELECT tp.*, tu.USER_NAME FROM TB_POST tp , TB_USER tu "
			+ "WHERE tp.USER_UID = tu.USER_UID ORDER BY tp.post_uid DESC";
	
	
	//모든 게시글 읽어오기
	//Join 사용하여 user_name, 댓글수도 가져온다
	public static final String SQL_POST_SELECT_WITH_OPTION =
			"SELECT tp.*, tu.USER_NAME, tc.comments_count " + 
			"FROM TB_POST tp JOIN TB_USER tu " + 
			"ON tp.USER_UID = tu.USER_UID " + 
			"LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc " + 
			"ON tp.POST_UID = tc.POST_UID " + 
			"ORDER BY tp.POST_UID DESC "
			;
	
	
	//모든 게시글 읽어오기
	//Join 사용하여 user_name, 댓글수도 가져온다
	//
		public static final String SQL_POST_SELECT_BY_BOARDUID =
			"SELECT * FROM " + 
			"(" + 
			"SELECT rownum AS rnum, tb_page.* " + 
			"FROM ( " + 
			"SELECT tp.*, tu.USER_NAME, tc.comments_count " + 
			"FROM TB_POST tp JOIN TB_USER tu " + 
			"ON tp.USER_UID = tu.USER_UID " + 
			"LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc " + 
			"ON tp.POST_UID = tc.POST_UID " +
			"WHERE tp.BOARD_UID = ? " +
			"ORDER BY tp.POST_UID DESC " + 
			") tb_page " + 
			") " + 
			"WHERE rnum >= ? AND RNUM < ? + ?"
			;
	
	public static final String SQL_POST_UPDATE = 
			"UPDATE tb_post SET post_subject = ?, post_content = ?, category_uid = ? WHERE post_uid = ?";

	public static final String SQL_POST_TOTALPOST =
			"SELECT count(POST_UID) as totals FROM TB_POST";
	
	//모든 게시글 읽어오기
			//Join 사용하여 user_name, 댓글수도 가져온다
			public static final String SQL_POST_FIND_BY_SUBJECT =
					"SELECT * FROM " + 
					"(" + 
					"SELECT rownum AS rnum, tb_page.* " + 
					"FROM ( " + 
					"SELECT tp.*, tu.USER_NAME, tc.comments_count " + 
					"FROM TB_POST tp JOIN TB_USER tu " + 
					"ON tp.USER_UID = tu.USER_UID " + 
					"LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc " + 
					"ON tp.POST_UID = tc.POST_UID " + 
					"WHERE tp.post_subject LIKE ? " +
					"ORDER BY tp.POST_UID DESC " + 
					") tb_page " + 
					") " + 
					"WHERE rnum >= ? AND RNUM < ? + 5"
					;
			
			public static final String SQL_POST_FIND_BY_USERNAME =
					"SELECT * FROM " + 
					"(" + 
					"SELECT rownum AS rnum, tb_page.* " + 
					"FROM ( " + 
					"SELECT tp.*, tu.USER_NAME, tc.comments_count " + 
					"FROM TB_POST tp JOIN TB_USER tu " + 
					"ON tp.USER_UID = tu.USER_UID " + 
					"LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc " + 
					"ON tp.POST_UID = tc.POST_UID " + 
					"WHERE tu.user_name LIKE ? " +
					"ORDER BY tp.POST_UID DESC " + 
					") tb_page " + 
					") " + 
					"WHERE rnum >= ? AND RNUM < ? + 5"
					;
			
			public static final String SQL_POST_FIND_BY_CONTENT =
					"SELECT * FROM " + 
					"(" + 
					"SELECT rownum AS rnum, tb_page.* " + 
					"FROM ( " + 
					"SELECT tp.*, tu.USER_NAME, tc.comments_count " + 
					"FROM TB_POST tp JOIN TB_USER tu " + 
					"ON tp.USER_UID = tu.USER_UID " + 
					"LEFT OUTER JOIN (SELECT tp.POST_UID, COUNT(tc.POST_UID) AS comments_count FROM TB_POST tp LEFT OUTER JOIN TB_COMMENT tc ON tp.POST_UID = tc.POST_UID GROUP BY tp.POST_UID) tc " + 
					"ON tp.POST_UID = tc.POST_UID " + 
					"WHERE tp.post_content LIKE ? " +
					"ORDER BY tp.POST_UID DESC " + 
					") tb_page " + 
					") " + 
					"WHERE rnum >= ? AND RNUM < ? + 5"
					;
	
}



