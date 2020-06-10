package beans;

public class UserDTO {
	int user_uid; 	// user uid
	String user_email; //이메일
	String user_pw;    // 비번
	String user_name;   // 이름
	String user_regdate;  // 가입 날짜
	String user_phone;  // 휴대전화
	int user_point;    // 랭킹 포인트 
	String mypage_subject; // 마이페이지 제목
	String mypage_content; // 마이페이지 내용
	
	public UserDTO() {
		super();
	}

	public UserDTO(int user_uid, String user_email, String user_pw, String user_name, String user_phone, int user_point,
			String mypage_subject, String mypage_content) {
		super();
		this.user_uid = user_uid;
		this.user_email = user_email;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_point = user_point;
		this.mypage_subject = mypage_subject;
		this.mypage_content = mypage_content;
	}
	public UserDTO(String mypage_subject, String mypage_content) {
		super();
		this.mypage_subject = mypage_subject;
		this.mypage_content = mypage_content;
	}


	public int getUser_uid() {
		return user_uid;
	}

	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(String user_regdate) {
		this.user_regdate = user_regdate;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
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
	
} // end UserDTo()
