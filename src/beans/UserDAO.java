package beans;

import java.sql.SQLException;

import common.UserQuery;

public class UserDAO extends DefaultDAO {

	// 로그인 처리 메소드
	public int Login(String user_email, String user_pw) {
		try {
			pstmt = conn.prepareStatement(UserQuery.SQL_USER_PW);
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(user_pw))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 틀림
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // 이메일이 존재하지 않음
	}

	// DTO 활용
	public int insertEmail(UserDTO dto) throws SQLException {
		String user_email = dto.getUser_email();
		String user_emailHash = dto.getUser_emailHash();
	
		int cnt = this.insertEmail(user_email, user_emailHash);
		return cnt;
	}
	
	// 회원가입 이메일 insert
	public int insertEmail(String user_email, String user_emailHash) throws SQLException{
		try {
			pstmt = conn.prepareStatement(UserQuery.SQL_USER_EMAIL_INSERT);
			pstmt.setString(1, user_email);
			pstmt.setString(2, user_emailHash);

			return pstmt.executeUpdate(); // insert 성공하면 1 리턴

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // 회원가입 실패
	}

	
	
	
	
	// 회원정보 insert 
	public int insertInfo(String user_email, String user_nickName, String user_phone, String user_pw) throws SQLException {

		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(UserQuery.SQL_USER_INFO_INSERT);
			pstmt.setString(1, user_nickName);
			pstmt.setString(2, user_phone);
			pstmt.setString(3, user_pw);
//			pstmt.setString(4, user_email);

			cnt = pstmt.executeUpdate(); // insert 성공하면 1

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	} // end insert

	// 이메일 가져오기
	public String GetUserEmail() throws SQLException{
		try {
			pstmt = conn.prepareStatement(UserQuery.SQL_USER_EMAIL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getString(1); // 이메일 주소 String 리턴
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스에 해당 이메일이 없음.(DB 오류)
	}

	// 이메일 체크값 가져오기 
	public String GetUserEmailChecked(String user_email) throws SQLException{
		try {
			pstmt = conn.prepareStatement(UserQuery.SQL_GET_EMAIL_CHECK);
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				// 컬럼값 리턴 -> "0"
				return rs.getString("user_emailchecked"); // 이메일 등록 여부 반환
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "1"; // 이미 인증여부 완료?..
	}
	
	// 이메일체크값 '1' 로 변경 
	public String SetUserEmailChecked(String user_email) throws SQLException{

		try {

			pstmt = conn.prepareStatement(UserQuery.SQL_SET_EMAIL_CHECK);
			pstmt.setString(1, user_email);
			pstmt.executeUpdate();

			return "1"; // update set 성공 시 -> "1" 리턴
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "0"; // 이메일 등록 설정 실패
	}

	// 로그아웃 처리

}
