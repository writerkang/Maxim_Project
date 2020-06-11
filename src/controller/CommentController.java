package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.board.CommentChooseCommand;
import command.board.CommentDeleteCommand;
import command.board.CommentListCommand;
import command.board.CommentUpdateCommand;
import command.board.CommentWriteCommand;
import common.Command;


@WebServlet("*.co") //"~~.co"로 오는 요청은 모두 여기서 처리!
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public CommentController() {
    }

    //Get, Post 요청으로 들어와도 actionPo가 처리
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionCo(request, response);	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionCo(request, response);;
	}
	
	protected void actionCo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 컨트롤러는 다음 두개를 선택해야 한다.
				String viewPage = null;   // 어떠한 뷰? --> 페이지
				Command command = null;   // 어떠한 커맨드? --> 어떠한 로직 수행.
				
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
				
				// 댓글 배열로 만들어 전달
				case "/Comment/commentList.co":
					command = new CommentListCommand();
					command.execute(request, response);
					viewPage = "commentList.jsp";
					break;		
					
				case "/Comment/commentWrite.co":
					viewPage = "commentWrite.jsp";
					break;
					
				case "/Comment/commentWriteOk.co":
					command = new CommentWriteCommand();
					command.execute(request, response);
					viewPage = "commentWriteOk.jsp";
					break;
					
				case "/Comment/commentUpdate.co":
					viewPage = "commentUpdate.jsp";
					break;
				
				case "/Comment/commentUpdateOk.co":
					command = new CommentUpdateCommand();
					command.execute(request, response);
					viewPage = "commentUpdateOk.jsp";
					break;
					
				case "/Comment/commentDeleteOk.co":
					command = new CommentDeleteCommand();
					command.execute(request, response);
					viewPage = "commentDeleteOk.jsp";
					break;				
					
				case "/Comment/commentChooseOk.co":
					command = new CommentChooseCommand();
					command.execute(request, response);
					viewPage = "commentChooseOk.jsp";
					break;				
					
				} // end switch
				
				// request 를 위에서 결정된 view 에 forward 해줌.
				if(viewPage != null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
				}	
	
	
	
	}

}
