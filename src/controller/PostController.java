package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.board.CommentListCommand;
import command.board.FileUploadCommand;
import command.board.PostDeleteCommand;
import command.board.PostFindCommand;
import command.board.PostListCommand;
import command.board.PostSelectCommand;
import command.board.PostUpdateCommand;
import command.board.PostViewCommand;
import command.board.PostWriteCommand;
import command.board.StarPostCommand;
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
				
				case "/Board/starFreePost.po":
					command = new StarPostCommand();
					command.execute(request, response);	
					viewPage = "starFreePostOk.jsp";
					break;
					
				case "/Board/starQnaPost.po":
					command = new StarPostCommand();
					command.execute(request, response);	
					viewPage = "starQnaPostOk.jsp";
					break;
					
				case "/Board/freeBoardList.po":
					command = new PostListCommand();
					request.setAttribute("board_uid", 2); //자유게시판 uid 세팅
					command.execute(request, response);					
					viewPage = "freeBoardList.jsp";
					break;
					
				case "/Board/qnaBoardList.po":
					command = new PostListCommand();
					request.setAttribute("board_uid", 4); //질문게시판 uid 세팅
					command.execute(request, response);					
					viewPage = "qnaBoardList.jsp";
					break;
					
				case "/index.po":
					command = new PostListCommand();
					command.execute(request, response);
					viewPage = "index.jsp";
					break;
				
				case "/Board/tipBoardList.po":
					command = new PostListCommand();
					request.setAttribute("board_uid", 3); //팁게시판 uid 세팅
					command.execute(request, response);
					viewPage = "tipBoardList.jsp";
					break;
					
				case "/Board/freePostView.po":
					command = new PostViewCommand();
					command.execute(request, response);
					command = new CommentListCommand();
					command.execute(request, response);
					viewPage = "freePostView.jsp";
					break;
				
				case "/Board/qnaPostView.po":
					command = new PostViewCommand();
					command.execute(request, response);
					command = new CommentListCommand();
					command.execute(request, response);
					viewPage = "qnaPostView.jsp";
					break;
					
				case "/Board/noticePostView.po":
					command = new PostViewCommand();
					command.execute(request, response);
					viewPage = "noticePostView.jsp";
					break;
					
				case "/Board/tipPostView.po":
					command = new PostViewCommand();
					command.execute(request, response);
					viewPage = "tipPostView.jsp";
					break;
					
				case "/Board/freePostWrite.po":
					viewPage = "freePostWrite.jsp";
					break;
					
				case "/Board/qnaPostWrite.po":
					viewPage = "qnaPostWrite.jsp";
					break;
					
				case "/Board/tipPostWrite.po":
					viewPage = "tipPostWrite.jsp";
					break;
					
				case "/Board/freePostWriteOk.po":
					command = new PostWriteCommand();
					command.execute(request, response);
					viewPage = "freePostWriteOk.jsp";
					break;
					
				case "/Board/qnaPostWriteOk.po":
					command = new PostWriteCommand();
					command.execute(request, response);
					viewPage = "qnaPostWriteOk.jsp";
					break;
					
				case "/Board/freePostFind.po":
					command = new PostFindCommand();
					request.setAttribute("board_uid", 2); //자유게시판 uid 세팅
					command.execute(request, response);
					viewPage = "freePostFind.jsp";
					break;
					
				case "/Board/qnaPostFind.po":
					command = new PostFindCommand();
					request.setAttribute("board_uid", 4); //질문게시판 uid 세팅
					command.execute(request, response);
					viewPage = "qnaPostFind.jsp";
					break;
					
				case "/Board/tipPostWriteOk.po":
					command = new PostWriteCommand();
					command.execute(request, response);
					viewPage = "tipPostWriteOk.jsp";
					break;
					
				case "/Board/freePostUpdate.po":
					command = new PostSelectCommand();
					command.execute(request, response);
					viewPage = "freePostUpdate.jsp";
					break;
					
				case "/Board/qnaPostUpdate.po":
					command = new PostSelectCommand();
					command.execute(request, response);
					viewPage = "qnaPostUpdate.jsp";
					break;
					
				case "/Board/tipPostUpdate.po":
					command = new PostSelectCommand();
					command.execute(request, response);
					viewPage = "tipPostUpdate.jsp";
					break;
					
				case "/Board/freePostUpdateOk.po":
					command = new PostUpdateCommand();
					command.execute(request, response);
					viewPage = "freePostUpdateOk.jsp";
					break;
					
				case "/Board/qnaPostUpdateOk.po":
					command = new PostUpdateCommand();
					command.execute(request, response);
					viewPage = "qnaPostUpdateOk.jsp";
					break;
					
				case "/Board/tipPostUpdateOk.po":
					command = new PostUpdateCommand();
					command.execute(request, response);
					viewPage = "tipPostUpdateOk.jsp";
					break;
					
				case "/Board/freePostDeleteOk.po":
					command = new PostDeleteCommand();
					command.execute(request, response);
					viewPage = "freePostDeleteOk.jsp";
					break;				
					
				case "/Board/qnaPostDeleteOk.po":
					command = new PostDeleteCommand();
					command.execute(request, response);
					viewPage = "qnaPostDeleteOk.jsp";
					break;				
					
				case "/Board/tipPostDeleteOk.po":
					command = new PostDeleteCommand();
					command.execute(request, response);
					viewPage = "tipPostDeleteOk.jsp";
					break;				
				
					
				case "/Board/noticeBoardList.po":
					command = new PostListCommand();
					request.setAttribute("board_uid", 1); //공지게시판 uid 세팅
					command.execute(request, response);
					viewPage = "noticeBoardList.jsp";
					break;				


				// 웹 에디터용 파일 업로드 처리
				case "/Board/fileUpload.po":
					new FileUploadCommand().execute(request, response);
					break;

					
				} // end switch
				
				// request 를 위에서 결정된 view 에 forward 해줌.
				if(viewPage != null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
				}	
	
	
	
	}

}
