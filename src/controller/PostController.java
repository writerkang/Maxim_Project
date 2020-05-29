package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
				case "/list.do":
					command = new ListCommand();
					command.execute(request, response);
					viewPage = "list.jsp";
					break;
				case "/write.do":
					viewPage = "write.jsp";
					break;
					
				case "/writeOk.do":
					command = new WriteCommand();
					command.execute(request, response);
					viewPage = "writeOk.jsp";
					break;
				
				case "/view.do":
					command = new ViewCommand();
					command.execute(request, response);
					viewPage = "view.jsp";
					break;
					
				case "/update.do":
					command = new SelectCommand();
					command.execute(request, response);
					viewPage = "update.jsp";
					break;
					
				case "/updateOk.do":
					command = new UpdateCommand();
					command.execute(request, response);
					viewPage = "updateOk.jsp";
					break;
					
				case "/deleteOk.do":
					command = new DeleteCommand();
					command.execute(request, response);
					viewPage = "deleteOk.jsp";
					break;
					
				} // end switch
				
				// request 를 위에서 결정된 view 에 forward 해줌.
				if(viewPage != null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
				}	
	
	
	
	}

}
