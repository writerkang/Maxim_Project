package beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import common.CommentQuery;

public class CommentDAO extends DefaultDAO {
	
		// 새 댓글 작성 <-- DTO 사용
		public int insert(CommentDTO dto) throws SQLException {
			String comment_content = dto.getComment_content();
			int post_uid = dto.getPost_uid();
			int user_uid = dto.getUser_uid();			
			
			
			int cnt = this.insert(comment_content, post_uid, user_uid);
			return cnt;
		}
		
		// 새 댓글 작성 <-- DTO 사용 X
		public int insert(String comment_content, int post_uid, int user_uid) throws SQLException {
			int cnt = 0;
			
			try {			
				pstmt = conn.prepareStatement(CommentQuery.SQL_COMMENT_INSERT);
				pstmt.setString(1, comment_content);
				pstmt.setInt(2, post_uid);
				pstmt.setInt(3, user_uid);
				
				cnt = pstmt.executeUpdate();
			} finally {
				close();			
			}

			return cnt;
		}
		
		// comment_uid 이용하여 글 삭제하기
		public int deleteByUid(int comment_uid) throws SQLException {
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(CommentQuery.SQL_COMMENT_DELETE_BY_UID);
				pstmt.setInt(1, comment_uid);
				cnt = pstmt.executeUpdate();
				
			} finally {
				close();
			}		
			
			return cnt;
		} // end deleteByUid()
				
		// ResultSet --> DTO 배열로 리턴
		public CommentDTO [] createArray(ResultSet rs) throws SQLException {
			CommentDTO [] arr = null;  // DTO 배열
			
			ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
			
			while(rs.next()) {
				int comment_uid = rs.getInt("comment_uid");
				String comment_content = rs.getString("comment_content");
				int post_uid = rs.getInt("post_uid");
				int user_uid = rs.getInt("user_uid");					
				Date d = rs.getDate("comment_regdate");
				Time t = rs.getTime("comment_regdate");
				
				String comment_regdate = "";
				if(d != null){
					comment_regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
							+ new SimpleDateFormat("hh:mm:ss").format(t);
				}
				
				CommentDTO dto = new CommentDTO(comment_uid, comment_content, 
						comment_regdate, post_uid, user_uid);
				list.add(dto);
				
			} // end while
			
			int size = list.size();
			
			if(size == 0) return null;
			
			arr = new CommentDTO[size];
			list.toArray(arr);  // List -> 배열		
			return arr;
		}
		
		
		
		// 특정 post_uid 의 댓글 모든 요소 가져오기
		public CommentDTO[] selectByUid(int post_uid) throws SQLException{
			CommentDTO [] arr = null;
			
			try {
				pstmt = conn.prepareStatement(CommentQuery.SQL_COMMENT_SELECT_BY_UID);
				pstmt.setInt(1, post_uid);
				rs = pstmt.executeQuery();
				arr = createArray(rs);
			} finally {
				close();
			}
			
			return arr;
		}
		
		// 댓글 수정 기능 
		public int update(int comment_uid, String comment_content) throws SQLException{
			int cnt = 0;
			
			try {
				pstmt = conn.prepareStatement(CommentQuery.SQL_COMMENT_UPDATE);
				pstmt.setString(1, comment_content);
				pstmt.setInt(2, comment_uid);
				
				cnt = pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
			return cnt;
		} //end update()
		

} //end PostDAO
