package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.board.AjaxCommentListCommand;
import command.board.CommentDeleteCommand;
import command.board.CommentListCommand;
import command.board.CommentUpdateCommand;
import command.board.CommentWriteCommand;
import command.user.AjaxMypageListCommand;
import command.user.AjaxResultCommand;
import command.user.AjaxUserRankListCommand;
import command.user.FileUploadViewCommand;
import command.user.MypageUpdateOkCommand;
import command.user.UserRankListCommand;

@WebServlet("*.ajax")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request, response);
	}
	
	protected void ajaxAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajaxAction()");
		
		request.setCharacterEncoding("UTF-8");
		
		// URL로부터 URI, ContextPath, Command 분리 
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		
		// 컨트롤러는 커맨드에 따라, 로직을 수행하고
		// 결과를 내보낼 view 를 결정한다
		switch(com) {
		case "/Board/commentList.ajax":  // 댓글 목록 보여주기
			new CommentListCommand().execute(request, response);
			new AjaxCommentListCommand().execute(request, response);
			break;
			
		case "/Board/commentWrite.ajax": // 댓글 작성
			new CommentWriteCommand().execute(request, response);
			new CommentListCommand().execute(request, response);
			new AjaxCommentListCommand().execute(request, response);
			break;
			
		case "/Board/commentUpdate.ajax": // 댓글 수정
			new CommentUpdateCommand().execute(request, response);
			new CommentListCommand().execute(request, response);
			new AjaxCommentListCommand().execute(request, response);
			break;
			
		case "/Board/commentDelete.ajax": // 댓글 삭제
			new CommentDeleteCommand().execute(request, response);
			new CommentListCommand().execute(request, response);
			new AjaxCommentListCommand().execute(request, response);
			break;
		
		case "/User/userRankList.ajax": // 유저 랭킹 목록 보여주기
			new UserRankListCommand().execute(request, response);
			new AjaxUserRankListCommand().execute(request, response);
			break;
			
		case "/User/updateOk.ajax": // 마이페이지 글수정
			new MypageUpdateOkCommand().execute(request, response);
			new AjaxMypageListCommand().execute(request, response);
			break;

		case "/User/fileUploadOk.ajax": // 
			new FileUploadViewCommand().execute(request, response);
			new AjaxResultCommand().execute(request, response);
			break;
			
			
		} // end switch
	}

}