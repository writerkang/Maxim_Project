package command.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AttachDAO;
import beans.AttachDTO;
import beans.MypageDAO;
import beans.UserDAO;
import beans.UserDTO;
import common.Command;

public class MyPageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		UserDAO dao = new UserDAO(); // DAO 객체 생성
		MypageDAO dao2 = new MypageDAO();
		AttachDAO dao3 = new AttachDAO();
		UserDTO[] arr = null;
		UserDTO[] arr2 = null;
		AttachDTO[] arr3 = null;

		
		try {
			arr = dao.select(Integer.parseInt(request.getParameter("user_uid")));
			request.setAttribute("list", arr);
			
			arr2 = dao2.viewByUid(Integer.parseInt(request.getParameter("user_uid")));
			request.setAttribute("mypage", arr2);
			
			arr3 = dao3.selectFileByUid(Integer.parseInt(request.getParameter("user_uid")));
			request.setAttribute("file", arr3);
		} catch (SQLException e) {
			e.printStackTrace();

		}

	}
}
