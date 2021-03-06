package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserDAO;
import beans.UserDTO;
import common.Command;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		UserDAO dao = new UserDAO();
		UserDTO [] arr = null;
		
		// request에서 매개변수 받아오기
		String user_email = request.getParameter("user_email");
		String user_pw = request.getParameter("user_pw");
		
		if(user_email != null && user_pw != null &&
				user_email.trim().length() > 0 && user_pw.trim().length() > 0) {
			
			try {
				
				cnt = dao.Login(user_email, user_pw);
				
				dao = new UserDAO();
				int user_uid = dao.findUid(user_email); // 해당 uid 회원의 모든 정보가 담겨있음.
//				System.out.println(user_uid); // 확인용
				
				dao = new UserDAO();
				arr = dao.select(user_uid);

				if(cnt == 1) {
					// 로그인 성공 -> 세션 생성 및 저장
					HttpSession session = request.getSession(true);
					session.setAttribute("userDto", arr); // 그 정보를 session 에 저장하고 보내줌.
				} else { // 그 밖의 cnt == 0 || cnt == -1
					// 로그인 실패
					// 일단 무시...
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("loginOk", cnt); // cnt 는 1 이라는 값이 보내질 것.
			
		} // end if
			
	}
	

}
