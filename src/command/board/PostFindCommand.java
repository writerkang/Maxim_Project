package command.board;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PostDAO;
import beans.PostDTO;
import common.Command;

public class PostFindCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		int page = 1; //default
		
		try {
		page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			
		}
		
		PostDAO dao = new PostDAO(); //DAO 객체 생성
		PostDTO [] arr = null;
		int totalPage = 1; // 초기값 총 1페이지
		int writePages = 7; //한 페이지에 7개의 글
		int boardUid = 1; //기본: 공지
		String keyword = ""; //검색어
		int serOption = 1; //검색옵션, 1제목, 2내용, 3작성자
		
		try {
			boardUid = (int)(request.getAttribute("board_uid")); //게시판 uid 가져오기
			keyword = "%" + (String)request.getParameter("ser_content") + "%";
			serOption = Integer.parseInt((request.getParameter("search")));
			
			arr = dao.findPostByOption(writePages*(page - 1) + 1, writePages, keyword, serOption, boardUid);
			dao = new PostDAO();
			
			totalPage = dao.getTotalPagesByOption(keyword, serOption);
			
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
