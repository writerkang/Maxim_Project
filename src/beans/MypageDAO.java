package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
		
		// 새글 작성
//		public int insert(MypageDTO dto) throws SQLException{
//			String mypage_subject = dto.getMypage_subject();
//			String mypage_content = dto.getMypage_content();
//			
//			int cnt = this.insert(mypage_subject, mypage_subject);
//			return cnt;
//		}
		
		
		// 특정 user의 uid 의 글 수정 (제목, 내용)
		public int update(int mypage_uid, String mypage_subject, String mypage_content) throws SQLException {
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(D.SQL_MAPAGE_WRITE_UPDATE);
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
