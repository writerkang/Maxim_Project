package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.D;

public class AttachDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()
	
	// DefaultDAO 객체가 생성될때 Connection 도 생성된다.
		public AttachDAO() {
			
			try {
				Class.forName(D.DRIVER);
				conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
				System.out.println("AttchDAO 생성, 데이터 베이스 연결!");
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

		public int fileUpload (String attach_oriname, String attach_servername) 
		{
			
			try {
				pstmt = conn.prepareStatement(D.SQL_FILE_UPLOAD);
				pstmt.setString(1, attach_oriname);
				pstmt.setString(2, attach_servername);
				return pstmt.executeUpdate();
				// 정상 처리 되는 경우 1 리턴  
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					close();
				} catch (SQLException e) {
					e.printStackTrace();
				}				
			}
			// 오류가 생기면 -1 을 리턴
			return -1; 
		} // end upload()
}



















