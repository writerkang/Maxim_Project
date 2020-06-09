package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserDAO;
import common.Command;
import util.SHA256;

public class UserEmailRegisterCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		UserDAO dao = new UserDAO();
		
		// request 에서 매개변수 받아오기 
		String user_email = request.getParameter("user_email"); 
	
		if(user_email != null && user_email.trim().length() > 0) {
			
			try {
				cnt = dao.insertEmail(user_email, SHA256.getSHA256(user_email));
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		} // end if
		request.setAttribute("user_email", user_email);
		request.setAttribute("userEmailRegisterOk", cnt);
		
	}
	
	// 성공적으로 request 되면  Emailsend.jsp로 이동 

} // end class
