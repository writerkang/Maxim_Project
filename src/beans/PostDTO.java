package beans;

public class PostDTO {

	int post_uid; 
	String post_subject; 
	String post_content; 
	String post_regdate; 
	int post_viewcnt; 
	int board_uid; 
	int user_uid; 
	int category_uid;
	String user_name;
	
	public PostDTO(int post_uid, String post_subject, String post_content, String post_regdate, int post_viewcnt,
			int board_uid, int user_uid, int category_uid) {
		super();
		this.post_uid = post_uid;
		this.post_subject = post_subject;
		this.post_content = post_content;
		this.post_regdate = post_regdate;
		this.post_viewcnt = post_viewcnt;
		this.board_uid = board_uid;
		this.user_uid = user_uid;
		this.category_uid = category_uid;
	}

	public PostDTO() {
		super();
	}

	public int getPost_uid() {
		return post_uid;
	}

	public void setPost_uid(int post_uid) {
		this.post_uid = post_uid;
	}

	public String getPost_subject() {
		return post_subject;
	}

	public void setPost_subject(String post_subject) {
		this.post_subject = post_subject;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public String getPost_regdate() {
		return post_regdate;
	}

	public void setPost_regdate(String post_regdate) {
		this.post_regdate = post_regdate;
	}

	public int getPost_viewcnt() {
		return post_viewcnt;
	}

	public void setPost_viewcnt(int post_viewcnt) {
		this.post_viewcnt = post_viewcnt;
	}

	public int getBoard_uid() {
		return board_uid;
	}

	public void setBoard_uid(int board_uid) {
		this.board_uid = board_uid;
	}

	public int getUser_uid() {
		return user_uid;
	}

	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}

	public int getCategory_uid() {
		return category_uid;
	}

	public void setCategory_uid(int category_uid) {
		this.category_uid = category_uid;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
	
}
