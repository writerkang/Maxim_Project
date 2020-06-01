package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CommentDAO;
import common.Command;

public class CommentDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		CommentDAO dao = new CommentDAO(); //DAO 객체 생성
		
		//request에서 post_uid 가져오기
		int comment_uid = Integer.parseInt(request.getParameter("comment_uid"));
		int cnt = 0;
		
		try {
			cnt = dao.deleteByUid(comment_uid);
			
			//request에 "result"라는 이름으로 결과값 cnt 저장, 삭제 실패하면 cnt값은 0
			request.setAttribute("result", cnt);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

}
