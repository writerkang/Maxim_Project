package command.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserDAO;
import beans.UserDTO;
import common.Command;

public class MyPageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		UserDAO dao = new UserDAO(); // DAO 객체 생성
		UserDTO[] arr = null;

		try {
			arr = dao.select(Integer.parseInt(request.getParameter("user_uid")));
			request.setAttribute("list", arr);

		} catch (SQLException e) {
			e.printStackTrace();

		}

	}
}
