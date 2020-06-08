package beans;


public class AttachDTO {
	private int attach_uid;
	private String attach_oriname;
	private String attach_servername;
	private String attach_url;
	private boolean isImage; 
	private int mypage_uid;
	
	
	//마이페이지 사진 업로드를 위한 생성자 생성
	public AttachDTO(int attach_uid, String attach_oriname, String attach_servername,
			int mypage_uid) {
		super();
		this.attach_uid = attach_uid;
		this.attach_oriname = attach_oriname;
		this.attach_servername = attach_servername;
//		this.attach_url = attach_url;
//		this.isImage = isImage;
		this.mypage_uid = mypage_uid;
	}

	// getter and setter 생성


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

	public String getAttach_url() {
		return attach_url;
	}

	public void setAttach_url(String attach_url) {
		this.attach_url = attach_url;
	}


	public int getMypage_uid() {
		return mypage_uid;
	}

	public void setMypage_uid(int mypage_uid) {
		this.mypage_uid = mypage_uid;
	}
	
	public boolean isImage() {
		return isImage;
	}
	public void setImage(boolean isImage) {
		this.isImage = isImage;
	}

	
}
