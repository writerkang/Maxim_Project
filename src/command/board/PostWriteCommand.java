package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PostDAO;
import common.Command;

public class PostWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int cnt = 0;
		PostDAO dao = new PostDAO();
		
		// request에서 매개변수 받아오기
		String post_subject = request.getParameter("post_subject");
		String post_content = request.getParameter("post_content");
		int board_uid = Integer.parseInt(request.getParameter("board_uid"));
		int category_uid = Integer.parseInt(request.getParameter("category_uid"));
		int user_uid = Integer.parseInt(request.getParameter("user_uid"));
		
		if(post_subject != null && post_content != null &&
				post_subject.trim().length() > 0 && post_content.trim().length() > 0) {
			
			try {
				cnt = dao.insert(post_subject, post_content, board_uid, category_uid, user_uid);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		} // end if
			
		request.setAttribute("result", cnt);
	}

}
