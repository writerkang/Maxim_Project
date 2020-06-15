package beans;


public class AttachDTO {
	private int attach_uid;
	private String attach_oriname;
	private String attach_servername;
	private String attach_type;
	private String attach_uri;
	private String attach_regdate;
	private int attach_size;
	private int user_uid;
	private int post_uid;
	private boolean isImage; // 이미지 여부 확인용
	
	public AttachDTO() {
		super();
	}

	public AttachDTO(String attach_oriname, String attach_servername, String attach_uri) {
		super();
		this.attach_oriname = attach_oriname;
		this.attach_servername = attach_servername;
		this.attach_uri = attach_uri;
	}

	public int getAttach_uid() {
		return attach_uid;
	}
	public void setAttach_uid(int attach_uid) {
		this.attach_uid = attach_uid;
	}
	public String getAttach_oriname() {
		return attach_oriname;
	}
	public void setAttach_oriname(String attach_oriname) {
		this.attach_oriname = attach_oriname;
	}
	public String getAttach_servername() {
		return attach_servername;
	}
	public void setAttach_servername(String attach_servername) {
		this.attach_servername = attach_servername;
	}
	public String getAttach_type() {
		return attach_type;
	}
	public void setAttach_type(String attach_type) {
		this.attach_type = attach_type;
	}
	public String getAttach_uri() {
		return attach_uri;
	}
	public void setAttach_uri(String attach_uri) {
		this.attach_uri = attach_uri;
	}
	public String getAttach_regdate() {
		return attach_regdate;
	}
	public void setAttach_regdate(String attach_regdate) {
		this.attach_regdate = attach_regdate;
	}
	public int getAttach_size() {
		return attach_size;
	}
	public void setAttach_size(int attach_size) {
		this.attach_size = attach_size;
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

	public boolean isImage() {
		return isImage;
	}

	public void setImage(boolean isImage) {
		this.isImage = isImage;
	}
	
	
}
