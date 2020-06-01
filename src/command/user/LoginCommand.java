package command.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserDAO;
import common.Command;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		UserDAO dao = new UserDAO();
		
		// request에서 매개변수 받아오기
		String user_email = request.getParameter("user_email");
		String user_pw = request.getParameter("user_pw");
		
		if(user_email != null && user_pw != null &&
				user_email.trim().length() > 0 && user_pw.trim().length() > 0) {
			
			try {
				cnt = dao.Login(user_email, user_pw);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		} // end if
			
		request.setAttribute("login", cnt);
	}
	

}
