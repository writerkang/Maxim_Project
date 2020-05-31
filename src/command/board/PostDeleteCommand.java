package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PostDAO;
import common.Command;

public class PostDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		PostDAO dao = new PostDAO(); //DAO 객체 생성
		
		//request에서 post_uid 가져오기
		int post_uid = Integer.parseInt(request.getParameter("post_uid"));
		int cnt = 0;
		
		try {
			cnt = dao.deleteByUid(post_uid);
			
			//request에 "result"라는 이름으로 결과값 cnt 저장, 삭제 실패하면 cnt값은 0
			request.setAttribute("result", cnt);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

}
