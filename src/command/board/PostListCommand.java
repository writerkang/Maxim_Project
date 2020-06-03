package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PostDAO;
import beans.PostDTO;
import common.Command;

public class PostListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		PostDAO dao = new PostDAO(); //DAO 객체 생성
		PostDTO [] arr = null;
		
		try {
			arr = dao.select();
			
			// "list"란 name으로  request에 arr값 전달
			// 즉 request에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("list", arr);
			
			
		} catch(SQLException e) {
			// 만약  connection pool 사용한다면
			// NamingException도 처리해야 함
			e.printStackTrace();
		}
		
	}

}
