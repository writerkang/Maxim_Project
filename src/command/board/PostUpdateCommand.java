package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PostDAO;
import common.Command;

public class PostUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		PostDAO dao = new PostDAO(); //DAO 객체 생성
		int post_uid = Integer.parseInt(request.getParameter("post_uid"));
		String post_subject = request.getParameter("post_subject");
		int category_uid = Integer.parseInt(request.getParameter("category_uid"));
		String post_content = request.getParameter("post_content");
		int cnt = 0;
		
		try {
			cnt = dao.update(post_uid, post_subject, category_uid, post_content);			
			
			request.setAttribute("result", cnt);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
