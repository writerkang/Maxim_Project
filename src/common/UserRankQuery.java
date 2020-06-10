package common;

public class UserRankQuery {
	// user_uid, user_name, user_pioint 를 포인트의 내림차순으로 가져오기
	public static final String GET_USER_RANK_LIST = "SELECT user_uid, user_name, user_point, RANK() OVER (ORDER BY user_point DESC) as user_rank FROM tb_user";
}
