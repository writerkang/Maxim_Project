package beans;

public class AjaxWriteResult {
	// response 에 있었던 결과들  멤버변수로 놓자 <-- 얘네   jacksonDatabined 사용하여 json 파일 만들기  위한 준비 .
	private int count; // 데이터 개수
	private String status; // 처리 결과
	private String message; //결과 메시지 
	
	/*
	 * 
	 * 
	 * 
	 */
	
	public AjaxWriteResult() {
		super();
	}

	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
