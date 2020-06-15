package command.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.MypageDAO;
import beans.UserDTO;
import common.Command;

public class MypageUpdateOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		MypageDAO dao = new MypageDAO(); // DAO 객체 생성 => 여기서는 서블릿에서 생성한다. 아까는 JSP에서 빈객체로 생성했음 그 차이 알기
		UserDTO [] arr = null;

		// ajax response 에 필요한 값들
		StringBuffer message = new StringBuffer();
		String status = "FAIL"; // 기본 FAIL

		// 입력한 값을 받아오기(form 태그 serialize 한 애emf_ 즉 form 안에 name 애들 가지고 옴)
		String param = request.getParameter("user_uid");
		String mypage_subject = request.getParameter("mypage_subject");
		String mypage_content = request.getParameter("mypage_content");

		// 유효성 체크
		if(param == null) {
			message.append("유효하지 않은 parameter 0 or null");
		} else if(mypage_subject == null || mypage_subject.trim().length() == 0) {
			message.append("유효하지 않은 parameter : 글제목 필수 !");
		} else {
			
			try {
				int user_uid = Integer.parseInt(param);
				
				cnt = dao.updateByUid(user_uid, mypage_subject, mypage_content); // 성공하면 1
				status = "OK";
				System.out.println("update:" + cnt);

//				dao = new MypageDAO();
//				arr = dao.viewByUid(user_uid);
//				System.out.println("arr : " + arr[0]);
//				
//				// status 는 일단 OK 로 갈게, 근데 메시지만 다르게 해줄게
				if(cnt == 0) {
					message.append("[0 update]");
				} 
//
//				if(arr != null) {
//					request.setAttribute("mypage", arr);
//				}
				
			} catch (SQLException e) {
				//e.printStackTrace();
				message.append("트랜잭션 에러: " + e.getMessage());
			} catch (Exception e) {
				message.append("유효하지 않은 parameter : " + param);
			}

		} // end if

		// 얘네들의 결과가 AjaxListCommand 로 넘어감
		request.setAttribute("result", cnt);  // 1 넘어갈 것 
		request.setAttribute("status", status);
		request.setAttribute("message", message.toString());
		
	}


}
