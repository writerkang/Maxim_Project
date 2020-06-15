package beans;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import common.D;
import common.MypageQuery;

public class AttachDAO extends DefaultDAO {

	// 특정 회원(user_uid) 프로필 첨부파일 처음 insert
	public int insert(int user_uid, String originalFileName, String servername, String attach_uri)
			throws SQLException {
		int cnt = 0;

		try {
			// 첨부파일 정보 추가 (저장) 하기
			pstmt = conn.prepareStatement(MypageQuery.SQL_ATTACH_FILE_INSERT);

				pstmt.setString(1, originalFileName);
				pstmt.setString(2, servername);
				pstmt.setString(3, attach_uri);
				pstmt.setInt(4, user_uid);

				return pstmt.executeUpdate(); // 정상 처리 되는 경우 1 리턴
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
			String attach_servername = rs.getString("attach_servername");
			String attach_uri = rs.getString("attach_uri");

			AttachDTO dto = new AttachDTO(attach_oriname, attach_servername, attach_uri);
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
	
	
	

	// 특정 글 (wr_uid) 의 첨부파일(들) 삭제
	// DB 삭제, 파일 삭제 --> 파일까지 삭제하려면 파일 정보에 대한 경로도 필요하다.(파일 경로는 request 에 담겨 있다... 그래서
	// 매개변수로 request 보낸다)
	public int deleteByUid(int user_uid, HttpServletRequest request) throws SQLException {
		int cnt = 0;
		AttachDTO[] arr = null;

		try {
			// 1. 물리적인 파일 삭제
			pstmt = conn.prepareStatement(MypageQuery.SQL_ATTACH_FILE_SELECT); // 특정 회원 uid의 첨부파일 하나
			pstmt.setInt(1, user_uid);
			rs = pstmt.executeQuery();

			arr = createArray(rs); // 이 배열에 담긴 물리적인 경로를 지워야 한다.

			// 물리적인 경로
			ServletContext context = request.getServletContext();
			String saveDirectory = context.getRealPath("fileUpload");

			for (AttachDTO dto : arr) {
				File f = new File(saveDirectory, dto.getAttach_servername()); // 매개변수 : 첫번쨰 파일 경로, 두번째 파일 이름
				System.out.println("삭제시도--> " + f.getAbsolutePath());

				if (f.exists()) { // 먼저 파일이 존재하는지 체크
					if (f.delete()) { // 그러면 삭제 !! 성공하면 true, 실패하면 false
						System.out.println("삭제 성공");
					} else {
						System.out.println("삭제 실패");
					}
				} else {
					System.out.println("파일이 존재하지 않습니다.");
				} // end if
			} // end for

			// 2. tb_attach 테이블 내용 삭제
			pstmt.close();
			rs.close();

			pstmt = conn.prepareStatement(MypageQuery.SQL_ATTACH_FILE_DELETE_BY_UID); // 특절 uid에 담겨 있는 모든 첨부파일들을 삭제
			pstmt.setInt(1, user_uid);
			cnt = pstmt.executeUpdate();
			System.out.println("첨부파일" + cnt + "개 삭제");

		} finally {
			close();
		}
		return cnt;
	} 
} // end deleteByUid