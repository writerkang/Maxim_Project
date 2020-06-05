package beans;

import java.sql.SQLException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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
//	public int insertEmail(UserDTO dto) throws SQLException {
//		String user_email = dto.getUser_email();
//		String user_emailHash = dto.getUser_emailHash();
//	
//		int cnt = this.insertEmail(user_email, user_emailHash);
//		return cnt;
//	}
	
	
	// 이메일 insert
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
	
	// 회원가입폼 insert 
		public int insertInfo(String user_email, String user_name, String user_phone, String user_pw) throws SQLException {

			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(UserQuery.SQL_USER_INFO_INSERT);
				pstmt.setString(1, user_email);
				pstmt.setString(2, user_name);
				pstmt.setString(3, user_phone);
				pstmt.setString(4, user_pw);

				cnt = pstmt.executeUpdate(); // insert 성공하면 1

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		} // end insert

		// 로그아웃 처리
		// TODO
		
		
		// ResultSet --> DTO 배열로 리턴
		public UserDTO[] createArray(ResultSet rs) throws SQLException {
			UserDTO[] arr = null; // DTO 배열

			ArrayList<UserDTO> list = new ArrayList<UserDTO>();

			while (rs.next()) {
				int user_uid = rs.getInt("user_uid");
				String user_email = rs.getString("user_email");
				String user_pw = rs.getString("user_pw");
				String user_name = rs.getString("user_name");
				String user_phone = rs.getString("user_phone");
				int user_point = rs.getInt("user_point");
				Date user_regdate = rs.getDate("user_regdate");
				Time t = rs.getTime("user_regdate");

				String regDate = "";
				if (user_regdate != null) {
					regDate = new SimpleDateFormat("yyyy-MM-dd").format(user_regdate) + " "
							+ new SimpleDateFormat("hh:mm:ss").format(t);
				}

				UserDTO dto = new UserDTO(user_uid, user_email, user_pw, user_name, user_phone, user_point);
				dto.setUser_regdate(regDate);
				list.add(dto);

			} // end while

			int size = list.size();

			if (size == 0)
				return null;

			arr = new UserDTO[size];
			list.toArray(arr); // List -> 배열
			return arr;
		}

		
		
		

		
		// 전체 SELECT (해당 uid 회원에 대한 모든 데이터 조회)
		public UserDTO[] select(int user_uid) throws SQLException {
			UserDTO[] arr = null;

			try {
				pstmt = conn.prepareStatement(UserQuery.SQL_USER_SELECT_BY_UID);
				pstmt.setInt(1, user_uid);
				rs = pstmt.executeQuery(); // 해당 uid 의 모든 컬럼 정보가 담김.
				arr = createArray(rs);
			} finally {
				close();
			}

			return arr;
		} // end select()
		
		
		
		// 해당 이메일로 부터 회원의 uid 값 뽑기 
		public int findUid(String user_email) throws SQLException{
			try {
				pstmt = conn.prepareStatement(UserQuery.SQL_FIND_UID);
				pstmt.setString(1, user_email);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					return rs.getInt(1); // 해당 uid 값 찍히겠지.
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return 0; // 0 이면 uid 못 찾았음.
		}
		
}
