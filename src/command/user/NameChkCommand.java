package command.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserDAO;
import common.Command;

public class NameChkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		UserDAO dao = new UserDAO();

		// request에서 매개변수 받아오기
		String user_name = request.getParameter("user_name");
		
		if(user_name != null && user_name.trim().length() > 0) {
			
			try {
				cnt = dao.nameCheck(user_name);  // cnt 는  1(중복있음) 또는 0(없음) 담길 것.
				
			} catch(SQLException e){
				e.printStackTrace();
			}
		} // end if
				
		request.setAttribute("nameChk", cnt);
	}

}
