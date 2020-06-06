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
		
		int page = 1; //default
		
		try {
		page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			
		}
		
		PostDAO dao = new PostDAO(); //DAO 객체 생성
		PostDTO [] arr = null;
		int totalPage = 1;
		int writePages = 7;
		int boardUid = 1; //기본: 공지
		
		try {
			boardUid = (int)(request.getAttribute("board_uid")); //게시판 uid 가져오기
			
			
			arr = dao.selectWithOption(boardUid, writePages*(page - 1) + 1, writePages);
			dao = new PostDAO();
			
			
			totalPage = dao.getTotalPages();
			
			if(totalPage % writePages == 0) {
				totalPage = totalPage / writePages;
				
			} else {
				totalPage = totalPage / writePages + 1;
			}
			
			// "list"란 name으로  request에 arr값 전달
			// 즉 request에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("list", arr);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("writePages", writePages);
			
			
		} catch(SQLException e) {
			// 만약  connection pool 사용한다면
			// NamingException도 처리해야 함
			e.printStackTrace();
		} 
		
	}

}
