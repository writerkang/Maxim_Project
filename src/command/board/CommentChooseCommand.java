package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CommentDAO;
import common.Command;

public class CommentChooseCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CommentDAO dao = new CommentDAO(); //DAO 객체 생성
		int comment_uid = Integer.parseInt(request.getParameter("comment_uid"));
		int cnt = 0;
		
		try {
			cnt = dao.updateSelectedComment(comment_uid);			
			
			request.setAttribute("result", cnt);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}

	}

}
