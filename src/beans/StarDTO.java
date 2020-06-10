package beans;

public class StarDTO {
	private int star_uid;
	private int user_uid;
	private int post_uid;
	
	public StarDTO(int star_uid, int user_uid, int post_uid) {
		super();
		this.star_uid = star_uid;
		this.user_uid = user_uid;
		this.post_uid = post_uid;
	}

	public StarDTO() {
		super();
	}

	public int getStar_uid() {
		return star_uid;
	}

	public void setStar_uid(int star_uid) {
		this.star_uid = star_uid;
	}

	public int getUser_uid() {
		return user_uid;
	}

	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}

	public int getPost_uid() {
		return post_uid;
	}

	public void setPost_uid(int post_uid) {
		this.post_uid = post_uid;
	}
	
	

}
