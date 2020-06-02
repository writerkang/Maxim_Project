package beans;

public class CommentDTO {
	int comment_uid; 
	String comment_content; 
	String comment_regdate; 
	int post_uid; 
	int user_uid;
	String user_name;
	
	public CommentDTO(int comment_uid, String comment_content, String comment_regdate, int post_uid, int user_uid) {
		super();
		this.comment_uid = comment_uid;
		this.comment_content = comment_content;
		this.comment_regdate = comment_regdate;
		this.post_uid = post_uid;
		this.user_uid = user_uid;
	}

	public CommentDTO() {
		super();
	}

	public int getComment_uid() {
		return comment_uid;
	}

	public void setComment_uid(int comment_uid) {
		this.comment_uid = comment_uid;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_regdate() {
		return comment_regdate;
	}

	public void setComment_regdate(String comment_regdate) {
		this.comment_regdate = comment_regdate;
	}

	public int getPost_uid() {
		return post_uid;
	}

	public void setPost_uid(int post_uid) {
		this.post_uid = post_uid;
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
	
	

}
