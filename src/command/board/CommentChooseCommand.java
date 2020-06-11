package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CommentDAO;
import beans.PostDAO;
import common.Command;

public class CommentChooseCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CommentDAO dao = new CommentDAO(); //DAO 객체 생성
		PostDAO pdao = new PostDAO();
		
		int comment_uid = Integer.parseInt(request.getParameter("comment_uid"));
		int cnt = 0;
		int user_uid;
		
		try {
			cnt = dao.updateSelectedComment(comment_uid);
			
			dao = new CommentDAO();
			user_uid = dao.findCommentWriter(comment_uid);
			
			//댓글 작성자에게 15점 부여
			pdao.incUserPoint(15, user_uid);
			
			request.setAttribute("result", cnt);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}

	}

}
