package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.D;
import common.MypageQuery;
import common.UserQuery;


public class MypageDAO extends DefaultDAO {

// --------------------- 마이페이지에 보이기(View) --------------------------
	
	// ResultSet --> DTO 배열로 리턴
	public UserDTO[] createArray(ResultSet rs) throws SQLException {
		UserDTO[] arr = null; // DTO 배열

		ArrayList<UserDTO> list = new ArrayList<UserDTO>();

		while (rs.next()) {
			//int user_uid = rs.getInt("user_uid");
			String mypage_subject = rs.getString("mypage_subject");
			String mypage_content = rs.getString("mypage_content");

			UserDTO dto = new UserDTO(mypage_subject, mypage_content);

			list.add(dto);

		} // end while

		int size = list.size();

		if (size == 0)
			return null;

		arr = new UserDTO[size];
		list.toArray(arr); // List -> 배열
		return arr;
	}

	// 해당 uid 에 대한 마이페이지 제목과 글내용 가져와서 보이도록.
	public UserDTO[] viewByUid(int user_uid) throws SQLException {
		UserDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(MypageQuery.SQL_VIEW_BY_UID);
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs); // 해당 uid 의 subject , content 가 담김.
		} finally {
			close();
		}
		return arr;
	} // end viewByUid()

// ------------------------------------ 수정 -----------------------------------

	// 특정 uid 글 수정 ( 제목, 내용 )
	public int updateByUid(int user_uid, String mypage_subject, String mypage_content) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(MypageQuery.SQL_UPDATE_BY_UID);
			pstmt.setString(1, mypage_subject);
			pstmt.setString(2, mypage_content);
			pstmt.setInt(3, user_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt; // 성공하면 1
	} // end update()

	// ------------------------------------ 파일첨부 -----------------------------------

	// 새글 작성
	public int insert(int attach_uid, String attach_oriname, String attach_servername, int mypage_uid)
			throws SQLException {
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

}
