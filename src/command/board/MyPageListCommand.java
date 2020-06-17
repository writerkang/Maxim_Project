package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PostDAO;
import beans.PostDTO;
import common.Command;

public class MyPageListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		PostDAO dao = new PostDAO(); //DAO 객체 생성
		PostDTO [] arr = null;
		
		try {
			arr = dao.selectByUid(1);
			
			request.setAttribute("list", arr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
