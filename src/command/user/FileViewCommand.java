package command.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.AttachDAO;
import beans.AttachDTO;
import common.Command;

public class FileViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		AttachDAO dao = new AttachDAO();
		AttachDTO[] arr = null;

//		int user_uid = Integer.parseInt(request.getParameter("user_uid"));
		StringBuffer message = new StringBuffer();
		String status = "FAIL"; // 기본 FAIL

		// mypageView.jsp 에서 uid 파라미터 받아오기.
		String param = request.getParameter("user_uid");

		// 유효성 검사
//		if (param == null) {
//			message.append("[유효하지 않은 parameter 0 or null]");
//		} else {
//			try {
//				int user_uid = Integer.parseInt(param);
//
//				arr = dao.selectFileByUid(user_uid); // 특정 uid 로부터 file oriname 과 servername 배열에 담음. 
//
//				if (arr == null) {
//					message.append("[해당 데이터가 없습니다]");
//				} else {
//					status = "OK";
//					HttpSession session = request.getSession(true);
//					session.setAttribute("file", arr); // 그 정보를 session 에 저장하고 보내줌.
//				}
//
//			} catch (SQLException e) {
//				 e.printStackTrace();
//				message.append("[MypageDAO 수행 에러:" + e.getMessage() + "]");
//			} catch (Exception e) {
//				e.printStackTrace();
//				message.append("[예외발생:" + e.getMessage() + "]");
//			} // end try
//		} // end if
			
	}

}
