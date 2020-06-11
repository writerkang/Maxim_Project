package beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.MypageQuery;

public class AttachDAO extends DefaultDAO {

	// 특정 회원(user_uid) DB 에 첨부파일 하나 INSERT
//	public int fileUpload(String attach_oriname, String attach_servername, String attach_url, int user_uid) {
//
//		try {
//			pstmt = conn.prepareStatement(MypageQuery.SQL_ATTACH_FILE_INSERT);
//			pstmt.setString(1, attach_oriname);
//			pstmt.setString(2, attach_servername);
//			pstmt.setString(3, attach_url);
//			pstmt.setInt(4, user_uid);
//
//			return pstmt.executeUpdate(); // 정상 처리 되는 경우 1 리턴
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//
//		return -1;
//
//	} // end fileUpload()

	
	// 특정 회원(user_uid) 프로필 첨부파일  처음 insert & 수정
	public int insert(int user_uid, List<String> originalFileNames, List<String> fileSystemNames, String attach_url)
			throws SQLException {
		int cnt = 0;

		try {
			// 첨부파일 정보 추가 (저장) 하기
			pstmt = conn.prepareStatement(MypageQuery.SQL_ATTACH_FILE_INSERT);
			
			for (int i = 0; i < originalFileNames.size(); i++) {
			
				pstmt.setString(1, originalFileNames.get(i));
				pstmt.setString(2, fileSystemNames.get(i));
				pstmt.setString(3, attach_url);
				pstmt.setInt(4, user_uid);

				return pstmt.executeUpdate(); // 정상 처리 되는 경우 1 리턴
			} // end for

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1; // 오류가 생기면 -1 을 리턴
	}

	
	
	
	// 이미지 보여줄 때 사용
	
	// ResultSet -> DTO 배열로 return
	public AttachDTO[] createArray(ResultSet rs) throws SQLException {
		AttachDTO[] arr = null;
		List<AttachDTO> list = new ArrayList<AttachDTO>();

		while (rs.next()) {
			String attach_oriname = rs.getString("attach_oriname");
			String attach_servername = rs.getString("ori_servername");

			AttachDTO dto = new AttachDTO(attach_oriname, attach_servername);
			list.add(dto);
		} // end while

		arr = new AttachDTO[list.size()];
		list.toArray(arr);
		return arr;
	} // end createArray()

	// 특정 회원(user_uid) 의 첨부파일 하나 SELECT
	public AttachDTO[] selectFileByUid(int user_uid) throws SQLException {
		AttachDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(MypageQuery.SQL_ATTACH_FILE_SELECT); // 특정 uid의 첨부된 파일만 가져옴
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs); // 결과를 위에 만들어놓은 createArray 로 받겠다.
		} finally {
			close();
		}
		return arr;
	} // end selectFileByUid

}
