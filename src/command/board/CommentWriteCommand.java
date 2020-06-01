package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CommentDAO;
import common.Command;

public class CommentWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int cnt = 0;
		CommentDAO dao = new CommentDAO();
		
		// request에서 매개변수 받아오기
		String comment_content = request.getParameter("comment_content");
		int post_uid = Integer.parseInt(request.getParameter("post_uid"));
		int user_uid = Integer.parseInt(request.getParameter("user_uid"));
		
		if(comment_content != null &&
				comment_content.trim().length() > 0) {
			
			try {
				cnt = dao.insert(comment_content, post_uid, user_uid);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		} // end if
			
		request.setAttribute("result", cnt);
	}

}
