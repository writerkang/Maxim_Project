package beans;

public class MypageDTO {
	private int mypage_uid;
	private String mypage_subject;
	private String mypage_content;
	private int user_uid;

	// 기본 생성자 생성 
	public MypageDTO() {
		super();
	}

	public MypageDTO(int mypage_uid, String mypage_subject, String mypage_content, int user_uid) {
		super();
		this.mypage_uid = mypage_uid;
		this.mypage_subject = mypage_subject;
		this.mypage_content = mypage_content;
		this.user_uid = user_uid;
	}

	public int getMypage_uid() {
		return mypage_uid;
	}

	public void setMypage_uid(int mypage_uid) {
		this.mypage_uid = mypage_uid;
	}

	public String getMypage_subject() {
		return mypage_subject;
	}

	public void setMypage_subject(String mypage_subject) {
		this.mypage_subject = mypage_subject;
	}

	public String getMypage_content() {
		return mypage_content;
	}

	public void setMypage_content(String mypage_content) {
		this.mypage_content = mypage_content;
	}

	public int getUser_uid() {
		return user_uid;
	}

	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}
	
	
	
	
}
