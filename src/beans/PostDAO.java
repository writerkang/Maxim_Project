package beans;

import java.sql.SQLException;

import common.PostQuery;

public class PostDAO extends DefaultDAO {
	
		// 새글 작성 <-- DTO 사용
		public int insert(PostDTO dto) throws SQLException {
			String post_subject = dto.getPost_subject();
			String post_content = dto.getPost_content();
			int board_uid = dto.getBoard_uid();
			int category_uid = dto.getCategory_uid();
			int user_uid = dto.getUser_uid();			
			
			
			int cnt = this.insert(post_subject, post_content, board_uid, category_uid, user_uid);
			return cnt;
		}
		
		// 새글 작성 <-- DTO 사용 X
		public int insert(String post_subject, String post_content, int board_uid, int category_uid, int user_uid) throws SQLException {
			int cnt = 0;
			
			try {			
				pstmt = conn.prepareStatement(PostQuery.SQL_POST_INSERT);
				pstmt.setString(1, post_subject);
				pstmt.setString(2, post_content);
				pstmt.setInt(3, board_uid);
				pstmt.setInt(4, category_uid);
				pstmt.setInt(5, user_uid);
				
				cnt = pstmt.executeUpdate();
			} finally {
				close();			
			}

			return cnt;
		}
		
		// post_uid 이용하여 글 삭제하기
		public int deleteByUid(int post_uid) throws SQLException {
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(PostQuery.SQL_POST_DELETE_BY_UID);
				pstmt.setInt(1, post_uid);
				cnt = pstmt.executeUpdate();
				
			} finally {
				close();
			}		
			
			return cnt;
		} // end deleteByUid()

} //end DefaultDAO
