package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.D;

// DataBase에 직접 접근하는 DAO
// 이 클래스를 상속해서 UserDAO, PostDAO 등 작성!!
public class MypageDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()
	
	// DefaultDAO 객체가 생성될때 Connection 도 생성된다.
		public MypageDAO() {
			
			try {
				Class.forName(D.DRIVER);
				conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
				System.out.println("MyPageDAO 생성, 데이터 베이스 연결!");
			} catch(Exception e) {
				e.printStackTrace();
				// throw e;
			}		
			
		} // 생성자

		// DB 자원 반납 메소드,
		public void close() throws SQLException {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} // end close()
		
		// ResultSet --> DTO 배열로 리턴
		public MypageDTO [] createArray(ResultSet rs) throws SQLException {
			MypageDTO [] arr = null;  // DTO 배열
			
			ArrayList<MypageDTO> list = new ArrayList<MypageDTO>();
			
			while(rs.next()) {
				int mypage_uid = rs.getInt("mypage_uid");
				String mypage_subject = rs.getString("mypage_subject");
				String mypage_content = rs.getString("mypage_content");
				int user_uid = rs.getInt("user_uid");
				
				MypageDTO dto = new MypageDTO(mypage_uid, mypage_subject, mypage_content, user_uid);
			
				list.add(dto);
				
			} // end while
			
			int size = list.size();
			
			if(size == 0) return null;
			
			arr = new MypageDTO[size];
			list.toArray(arr);  // List -> 배열		
			return arr;
		}
		
		// 글 내용 읽기
		public MypageDTO [] readByUid(int mypage_uid) throws SQLException{
			MypageDTO [] arr = null;
			
			try {
				// Auto-commit 비활성화
				conn.setAutoCommit(false);
				
				pstmt = conn.prepareStatement(D.SQL_MYPAGE_SELECT_BY_UID);
				pstmt.setInt(1, mypage_uid);
				rs = pstmt.executeQuery();
				
				arr = createArray(rs);
				
				
			}catch (SQLException e) {
				conn.rollback();
				throw e;
			} finally {
				close();
			}
			return arr;
		} // end readByUid()
		
		// 새글 작성
		public int insert(int attach_uid, String attach_oriname, String attach_servername, int mypage_uid) throws SQLException{
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(D.SQL_MYPAGE_WRITE_INSERT);
				pstmt.setString(1, attach_oriname);
				pstmt.setString(2, attach_servername);
				pstmt.setInt(3, mypage_uid);
				
				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}
			return cnt;
		} // end insert()
		
		// 특정 user의 uid 의 글 수정 (제목, 내용)
		public int update(int mypage_uid, String mypage_subject, String mypage_content) throws SQLException {
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(D.SQL_MAPAGE_UPDATE);
				pstmt.setString(1, mypage_subject);
				pstmt.setString(2, mypage_content);
				pstmt.setInt(3,mypage_uid);
				
				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}		
			
			return cnt;
		} // end update()
		

}
