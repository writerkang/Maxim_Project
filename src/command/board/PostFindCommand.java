package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PostDAO;
import beans.PostDTO;
import common.Command;

public class PostFindCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int page = 1; //default
		
		try {
		page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			
		}
		
		PostDAO dao = new PostDAO(); //DAO 객체 생성
		PostDTO [] arr = null;
		int totalPage = 1;
		
		try {
//			arr = dao.select();
			arr = dao.selectWithOption(page*5 + - 4);
			totalPage = dao.getTotalPages();
			
			if(totalPage % 5 == 0) {
				totalPage = totalPage / 5;
				
			} else {
				totalPage = totalPage / 5 + 1;
			}
			
			// "list"란 name으로  request에 arr값 전달
			// 즉 request에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("list", arr);
			request.setAttribute("totalPage", totalPage);
			
			
		} catch(SQLException e) {
			// 만약  connection pool 사용한다면
			// NamingException도 처리해야 함
			e.printStackTrace();
		}
		
	}

}
