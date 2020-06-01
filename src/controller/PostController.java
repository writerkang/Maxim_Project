package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.board.PostDeleteCommand;
import command.board.PostListCommand;
import command.board.PostUpdateCommand;
import command.board.PostViewCommand;
import command.board.PostWriteCommand;
import common.Command;


@WebServlet("*.po") //"~~.po"로 오는 요청은 모두 여기서 처리!
public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public PostController() {
    }

    //Get, Post 요청으로 들어와도 actionPo가 처리
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionPo(request, response);	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionPo(request, response);;
	}
	
	protected void actionPo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				
				case "/Board/freeBoardList.po":
					command = new PostListCommand();
					command.execute(request, response);
					viewPage = "freeBoardList.jsp";
					break;
				
				case "/tipBoardList.po":
					command = new PostListCommand();
					command.execute(request, response);
					viewPage = "/Board/tipBoardList.jsp";
					break;
					
				case "/freePostView.po":
					command = new PostViewCommand();
					command.execute(request, response);
					viewPage = "/Board/freePostView.jsp";
					break;
				
				case "/tipPostView.po":
					command = new PostViewCommand();
					command.execute(request, response);
					viewPage = "/Board/tipPostView.jsp";
					break;
					
				case "/freePostWrite.po":
					viewPage = "/Board/freePostWrite.jsp";
					break;
					
				case "/tipPostWrite.po":
					viewPage = "/Board/tipPostWrite.jsp";
					break;
					
				case "/freePostWriteOk.po":
					command = new PostWriteCommand();
					command.execute(request, response);
					viewPage = "/Board/freePostWriteOk.jsp";
					break;
					
				case "/tipPostWriteOk.po":
					command = new PostWriteCommand();
					command.execute(request, response);
					viewPage = "/Board/tipPostWriteOk.jsp";
					break;
					
				case "/freePostUpdate.po":
					viewPage = "/Board/freePostUpdate.jsp";
					break;
					
				case "/tipPostUpdate.po":
					viewPage = "/Board/tipPostUpdate.jsp";
					break;
					
				case "/freePostUpdateOk.po":
					command = new PostUpdateCommand();
					command.execute(request, response);
					viewPage = "/Board/freePostUpdateOk.jsp";
					break;
					
				case "/tipPostUpdateOk.po":
					command = new PostUpdateCommand();
					command.execute(request, response);
					viewPage = "/Board/tipPostUpdateOk.jsp";
					break;
					
				case "/freePostDeleteOk.po":
					command = new PostDeleteCommand();
					command.execute(request, response);
					viewPage = "/Board/freePostDeleteOk.jsp";
					break;				
					
				case "/tipPostDeleteOk.po":
					command = new PostDeleteCommand();
					command.execute(request, response);
					viewPage = "/Board/tipPostDeleteOk.jsp";
					break;				
					
					
				} // end switch
				
				// request 를 위에서 결정된 view 에 forward 해줌.
				if(viewPage != null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
				}	
	
	
	
	}

}
