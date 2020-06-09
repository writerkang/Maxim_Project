package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PostDAO;
import beans.PostDTO;
import common.Command;

public class PostViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		PostDAO dao = new PostDAO(); //DAO 객체 생성
		PostDTO [] arr = null;

		int page = 1; //default
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
			request.setAttribute("page", page);
			
		} catch(NumberFormatException e) {
			
		}
		
		try {
			arr = dao.readByUid(Integer.parseInt(request.getParameter("post_uid")));
			request.setAttribute("list", arr);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
