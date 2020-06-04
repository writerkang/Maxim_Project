package common;

/*
 * DB 접속 정보, 쿼리문, 테이블명, 컬럼명 등은
 * 별도로 관리하든지
 * XML, 초기화 파라미터 등에서 관리하는 것이 좋다.
 */

public class D {
	// Connection에 필요한 값 세팅
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USERID = "maxim0316";
	public static final String USERPW = "tiger0316";
		
		public static final String SQL_WRITE_SELECT =
				"SELECT * FROM test_write ORDER BY wr_uid DESC";
		public static final String SQL_WRITE_UPDATE = 
				"UPDATE test_write SET wr_subject = ?, wr_content = ? WHERE wr_uid = ?";
		public static final String SQL_WRITE_INSERT = "INSERT INTO test_write " +
				"(wr_uid, wr_subject, wr_content, wr_name) " +
				"VALUES(test_write_seq.nextval, ?, ?, ?)";		
		public static final String SQL_WRITE_DELETE_BY_UID = 
				"DELETE FROM test_write WHERE wr_uid = ?";		
		public static final String SQL_WRITE_INC_VIEWCNT = //조회수 증가 
				"UPDATE test_write SET wr_viewcnt = wr_viewcnt + 1 WHERE wr_uid = ?";
		public static final String SQL_WRITE_SELECT_BY_UID = //글 읽어오기
					"SELECT * FROM test_write WHERE wr_uid = ?";

		
		// mypage upload - 첨부파일 관련 쿼리
		public static final String SQL_FILE_UPLOAD = // 파일 업로드
				"INSERT INTO tb_attach"
				+ "(attach_oriname, attach_servername, mypage_uid) "
				+ "VALUES"
				+ "(tb_attach_seq.nextval,?, ?)"
				;
}
