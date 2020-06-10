package beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.UserRankQuery;

public class UserRankDAO extends DefaultDAO {
	
	public UserRankDTO[] getUserRankList() throws SQLException{
		UserRankDTO [] arr = null;

		try {
			pstmt = conn.prepareStatement(UserRankQuery.GET_USER_RANK_LIST);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	// ResultSet --> DTO 배열로 리턴
	public UserRankDTO [] createArray(ResultSet rs) throws SQLException {
		UserRankDTO [] arr = null;  // DTO 배열
				
		ArrayList<UserRankDTO> list = new ArrayList<UserRankDTO>();
		
		while(rs.next()) {
			int user_uid = rs.getInt("user_uid");
			String user_name = rs.getString("user_name");
			int user_point = rs.getInt("user_point");
			int user_rank = rs.getInt("user_rank");
			
			UserRankDTO dto = new UserRankDTO(user_uid, user_name, user_point, user_rank);
			
			list.add(dto);
		} // end while
		
		int size = list.size();
		
		if(size == 0) return null;
		
		arr = new UserRankDTO[size];
		list.toArray(arr);  // List -> 배열		
		return arr;
	}
}
