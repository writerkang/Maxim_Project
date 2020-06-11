package beans;

public class UserRankDTO {
	int user_uid; // user uid
	String user_name; // 이름
	int user_point; // 랭킹 포인트
	int user_rank; // 순위
	
	public UserRankDTO() {
		super();
	}

	public UserRankDTO(int user_uid, String user_name, int user_point, int user_rank) {
		super();
		this.user_uid = user_uid;
		this.user_name = user_name;
		this.user_point = user_point;
		this.user_rank = user_rank;
	}

	public int getUser_uid() {
		return user_uid;
	}

	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public int getUser_rank() {
		return user_rank;
	}

	public void setUser_rank(int user_rank) {
		this.user_rank = user_rank;
	}
	
} // end UserRankDTO()
