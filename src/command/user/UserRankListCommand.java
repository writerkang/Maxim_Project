package command.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserRankDAO;
import beans.UserRankDTO;
import common.Command;

public class UserRankListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		UserRankDAO dao = new UserRankDAO();
		UserRankDTO [] arr = null;
		
		try {
			arr = dao.getUserRankList();
			
			// "userRankList"란 name으로  request에 arr값 전달
			// 즉 request에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("userRankList", arr);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
