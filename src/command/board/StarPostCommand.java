package command.board;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PostDAO;
import beans.StarDAO;
import common.Command;

public class StarPostCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int cnt = 0;
		int pointCnt = 0;
		int writerUid = 0;
		StarDAO dao = new StarDAO();
		PostDAO pdao = new PostDAO();

		// request에서 매개변수 받아오기
		int user_uid = Integer.parseInt(request.getParameter("user_uid"));
		int post_uid = Integer.parseInt(request.getParameter("post_uid"));

		try {
			cnt = dao.insert(user_uid, post_uid);
			writerUid = pdao.findUserUid(post_uid);
			pdao = new PostDAO();
			
			//게시물 글쓴이에게 포인트 10점 부여
			pointCnt = pdao.incUserPoint(10, writerUid);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("result", cnt);
		request.setAttribute("pointResult", pointCnt);

	}

}
