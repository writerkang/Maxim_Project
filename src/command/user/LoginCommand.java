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
		
		// 세션생성 
		HttpSession session = request.getSession(true);
//		session.invalidate();
		
		// request에서 매개변수 받아오기
		String user_email = request.getParameter("user_email");
		String user_pw = request.getParameter("user_pw");
		
		if(user_email != null && user_pw != null &&
				user_email.trim().length() > 0 && user_pw.trim().length() > 0) {
			
			try {
				
				cnt = dao.Login(user_email, user_pw);
				
				dao = new UserDAO();
				int user_uid = dao.findUid(user_email); // 해당 uid 회원의 모든 정보가 담겨있음.
				System.out.println(user_uid);
				
				dao = new UserDAO();
				arr = dao.select(user_uid);
			
				
				
				request.setAttribute("loginOk", cnt);
//				request.setAttribute("arr", arr);
				session.setAttribute("userDto", arr); // 그 정보를 session 에 저장하고 보내줌.
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		} // end if
			
	}
	

}
