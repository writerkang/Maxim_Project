package beans;

public class UserDTO {
	int user_uid; 
	String user_email;
	String user_pw;
	String user_name; 
	String user_regdate; 
	String user_phone; 
	char user_isvalid; 
	char user_auth; 
	int user_point; 
	String user_sns; 
	String user_snsid; 
	String user_email2;
	public UserDTO(int user_uid, String user_email, String user_pw, String user_name, String user_regdate,
			String user_phone, char user_isvalid, char user_auth, int user_point, String user_sns, String user_snsid,
			String user_email2) {
		super();
		this.user_uid = user_uid;
		this.user_email = user_email;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_regdate = user_regdate;
		this.user_phone = user_phone;
		this.user_isvalid = user_isvalid;
		this.user_auth = user_auth;
		this.user_point = user_point;
		this.user_sns = user_sns;
		this.user_snsid = user_snsid;
		this.user_email2 = user_email2;
	}
	public UserDTO() {
		super();
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
	public char getUser_isvalid() {
		return user_isvalid;
	}
	public void setUser_isvalid(char user_isvalid) {
		this.user_isvalid = user_isvalid;
	}
	public char getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(char user_auth) {
		this.user_auth = user_auth;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	public String getUser_sns() {
		return user_sns;
	}
	public void setUser_sns(String user_sns) {
		this.user_sns = user_sns;
	}
	public String getUser_snsid() {
		return user_snsid;
	}
	public void setUser_snsid(String user_snsid) {
		this.user_snsid = user_snsid;
	}
	public String getUser_email2() {
		return user_email2;
	}
	public void setUser_email2(String user_email2) {
		this.user_email2 = user_email2;
	}
	
	
	
}
