package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CommentDAO;
import common.Command;

public class CommentUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		CommentDAO dao = new CommentDAO(); //DAO 객체 생성
		int comment_uid = Integer.parseInt(request.getParameter("comment_uid"));
		String comment_content = request.getParameter("comment_content");
		int cnt = 0;
		
		try {
			cnt = dao.update(comment_uid, comment_content);			
			
			request.setAttribute("result", cnt);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
