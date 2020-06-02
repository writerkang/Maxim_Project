package command.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserDAO;
import common.Command;

public class JoinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		UserDAO dao = new UserDAO();

		// request에서 매개변수 받아오기
		String user_email = request.getParameter("user_email");
		String user_nickName = request.getParameter("user_nickName");
		String user_phone = request.getParameter("user_phone");
		String user_pw = request.getParameter("user_pw");
		
		if(user_email != null && user_nickName != null && user_phone != null &&
				user_pw != null && user_email.trim().length() > 0 && user_nickName.trim().length() > 0 &&
				user_phone.trim().length() > 0 && user_pw.trim().length() > 0) {
			
			try {
				cnt = dao.insertInfo(user_email, user_nickName, user_phone, user_pw);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		} // end if
			
		request.setAttribute("insertInfo", cnt);
		
	}

}