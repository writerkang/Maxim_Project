package beans;

import java.sql.Date;

public class AttachDTO {
	int attach_uid;
	String attach_oriname;
	String attach_servername;
	String attach_url;
	Date attach_regdate;
	int attach_size;
	int mypage_uid;
	
	//마이페이지 사진 업로드를 위한 생성자 생성
	public AttachDTO(int attach_uid, String attach_oriname, String attach_servername, String attach_url,
			Date attach_regdate, int attach_size, int mypage_uid) {
		super();
		this.attach_uid = attach_uid;
		this.attach_oriname = attach_oriname;
		this.attach_servername = attach_servername;
		this.attach_url = attach_url;
		this.attach_regdate = attach_regdate;
		this.attach_size = attach_size;
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

	public Date getAttach_regdate() {
		return attach_regdate;
	}

	public void setAttach_regdate(Date attach_regdate) {
		this.attach_regdate = attach_regdate;
	}

	public int getAttach_size() {
		return attach_size;
	}

	public void setAttach_size(int attach_size) {
		this.attach_size = attach_size;
	}

	public int getMypage_uid() {
		return mypage_uid;
	}

	public void setMypage_uid(int mypage_uid) {
		this.mypage_uid = mypage_uid;
	}
	
	

	
}
