package beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.StarQuery;

public class StarDAO extends DefaultDAO {

	// 새추천 삽입 <-- DTO 사용 X
	public int insert(int user_uid, int post_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(StarQuery.SQL_STAR_INSERT);
			pstmt.setInt(1, user_uid);
			pstmt.setInt(2, post_uid);

			cnt = pstmt.executeUpdate();

		} finally {
			close();
		}

		return cnt;
	}

	// ResultSet --> DTO 배열로 리턴
	public StarDTO[] createArray(ResultSet rs) throws SQLException {
		StarDTO[] arr = null; // DTO 배열

		ArrayList<StarDTO> list = new ArrayList<StarDTO>();

		while (rs.next()) {
			int star_uid = rs.getInt("star_uid");
			int user_uid = rs.getInt("user_uid");
			int post_uid = rs.getInt("post_uid");

			StarDTO dto = new StarDTO(star_uid, user_uid, post_uid);

			list.add(dto);

		} // end while

		int size = list.size();

		if (size == 0)
			return null;

		arr = new StarDTO[size];
		list.toArray(arr); // List -> 배열
		return arr;
	}

	// 게시물의 추천 수 가져오기
	public int getTotalStars(int post_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(StarQuery.SQL_STAR_COUNT);
			pstmt.setInt(1, post_uid);

			rs = pstmt.executeQuery();
			cnt = rs.getInt(1);

		} finally {
			close();
		}

		return cnt;
	}
	
	// 유저의 추천여부 확인
		public int getTotalStars(int user_uid, int post_uid) throws SQLException {
			int cnt = 0;

			try {
				pstmt = conn.prepareStatement(StarQuery.SQL_STAR_COUNT_BY_POST_AND_USER);
				pstmt.setInt(1, user_uid);
				pstmt.setInt(2, post_uid);

				rs = pstmt.executeQuery();
				cnt = rs.getInt(1);

			} finally {
				close();
			}

			return cnt;
		}

	// 특정 게시물의 추천배열 가져오기
	public StarDTO[] selectByPost(int post_uid) throws SQLException {
		StarDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(StarQuery.SQL_STAR_GET_BY_POSTUID);
			pstmt.setInt(1, post_uid);
			
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	} // end select()

}
