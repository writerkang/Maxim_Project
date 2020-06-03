package command.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserDAO;
import common.Command;
import util.SHA256;

public class UserEmailCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserDAO dao = new UserDAO();
		
		String code = request.getParameter("code");
		String user_email = null;
		
		try {
			user_email = dao.GetUserEmail();  // 이메일 주소가 담김 
			if (user_email != null && user_email.trim().length() > 0) {

//				boolean rightCode = (new SHA256().getSHA256(user_email).equals(code));
//				String setChk = dao.SetUserEmailChecked(user_email);
				request.setAttribute("checkEmail", user_email);
				request.setAttribute("code", code);
			} // end if
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
