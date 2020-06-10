package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PostDAO;
import beans.PostDTO;
import beans.StarDAO;
import beans.StarDTO;
import common.Command;

public class PostViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		PostDAO dao = new PostDAO(); //DAO 객체 생성
		PostDTO [] arr = null;
		StarDAO sdao = new StarDAO();
		StarDTO [] starArr = null;

		int page = 1; //default
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
			request.setAttribute("page", page);
			
		} catch(NumberFormatException e) {
			
		}
		
		try {
			arr = dao.readByUid(Integer.parseInt(request.getParameter("post_uid")));
			request.setAttribute("list", arr);
			
			starArr = sdao.selectByPost(Integer.parseInt(request.getParameter("post_uid")));
			request.setAttribute("starList", starArr);
			System.out.println(starArr);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
