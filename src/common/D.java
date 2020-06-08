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

		
		// 첨부파일 관련 쿼리
		// 특정 user의 mypage 에 첨부파일 1개 insert
		public static final String SQL_MYPAGE_FILE_INSERT = 
				"INSERT INTO tb_attach"
				+ "(attach_uid, attach_oriname, attach_servername, mypage_uid) "
				+ "VALUES"
				+ "(tb_attach_seq.nextval, ?, ?, ?)"
				;
		// 특정 user mypage에 첨부파일 (attach_uid) 하나를 SELECT
		public static final String SQL_MYPAGE_FILE_SELECT =
				"SELECT attach_uid, attach_oriname, attach_servername FROM tb_attach "
				+ "WHERE mypage_uid = ?"
				;
		// mypage 글 등록
		public static final String SQL_MYPAGE_WRITE_INSERT = 
				"INSERT INTO tb_mypage " +
				"(mypage_uid, mypage_subject, mypage_content, user_uid) " +
				"VALUES(test_write_seq.nextval, ?, ?, ?)";
		// mypage 수정
		public static final String SQL_MAPAGE_UPDATE =
				"UPDATE tb_mypage " +
				"SET mypage_subject = ? , mypage_content = ? WHERE mypage_uid = ?";
		// 글 읽어오기	
		public static final String SQL_MYPAGE_SELECT_BY_UID =
				"SELECT mypage_subject, mypage_content FROM tb_mypage WHERE mypage_uid = ?";
				
}
				
				
				
				
				
				
				
				
				
				
