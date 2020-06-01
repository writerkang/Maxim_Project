package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserDAO;
import common.Command;

public class UserEmailCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserDAO dao = new UserDAO();
		
		String user_email = dao.GetUserEmail();
		
		if(user_email != null && user_email.trim().length() > 0) {
			
			try {
				String setChk = dao.SetUserEmailChecked(user_email);
				
				request.setAttribute("checkEmail", setChk);
				
			}catch(Exception e)	{
				e.printStackTrace();
			}
		} // end if
		
	}

}
