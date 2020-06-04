package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserDAO;
import common.Command;

public class UserEmailSendCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserDAO dao = new UserDAO();
		String user_emailchecked = null;
		
		String user_email = request.getParameter("user_email");
		
		if(user_email != null && user_email.trim().length() > 0) {
			
			try {
				
				// '0' 을 담음.
				user_emailchecked = dao.GetUserEmailChecked(user_email);
				
			}catch(Exception e)	{
				e.printStackTrace();
			}
		} // end if
		
		request.setAttribute("user_email", user_email);
		request.setAttribute("emailChkNum", user_emailchecked);
		
		
		
	}

}
