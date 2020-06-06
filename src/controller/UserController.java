package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.user.JoinCommand;
import command.user.LoginCommand;
import command.user.UserDeleteCommand;
import command.user.UserEmailCheckCommand;
import command.user.UserEmailRegisterCommand;
import command.user.UserEmailSendCommand;
import command.user.NameChkCommand;
import common.Command;

@WebServlet("*.uo") // "~~.uo"로 오는 요청은 모두 여기서 처리 
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserController() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionUo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionUo(request, response);
	}
	
	protected void actionUo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		case "/User/login.uo":
			viewPage = "login.jsp";
			break;
		case "/User/loginOk.uo":
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "loginOk.jsp";
			break;
		case "/User/logout.uo":
			viewPage = "logout.jsp";
			break;
		case "/User/userEmailRegister.uo":
			viewPage = "userEmailRegister.jsp";
			break;
		case "/User/userEmailRegisterOk.uo":
			command = new UserEmailRegisterCommand();
			command.execute(request, response);
			viewPage = "userEmailRegisterOk.jsp";
			break;
		case "/User/userEmailSend.uo":
			command = new UserEmailSendCommand();
			command.execute(request, response);
			viewPage = "userEmailSend.jsp";
			break;
		case "/User/userEmailCheck.uo":
			command = new UserEmailCheckCommand();
			command.execute(request, response);
			viewPage = "userEmailCheck.jsp";
			break;
		case "/User/joinForm.uo":
			viewPage = "joinForm.jsp";
			break;
		case "/User/joinFormOk.uo":
			command = new JoinCommand();
			command.execute(request, response);
			viewPage = "joinFormOk.jsp";
			break;
		case "/User/userDeleteOk.uo":
			command = new UserDeleteCommand();
			command.execute(request, response);
			viewPage = "userDeleteOk.jsp";
			break;
		case "/User/findEmail.uo":
//			command = new FindEmailCommand();
			command.execute(request, response);
			viewPage = "findEmail.jsp";
			break;
		case "/User/findPw.uo":
//			command = new FindPwCommand();
			command.execute(request, response);
			viewPage = "findPw.jsp";
			break;
		case "/index.uo":
			viewPage = "index.jsp";
			break;
		case "/User/nameChk.uo":
			command = new NameChkCommand();
			command.execute(request, response);
			viewPage = "nameChk.jsp";
		} // end switch
		
		// request 를 위에서 결정된 view 에 forward 해줌.
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}	

	
	} // end actionUo
	
} // end UserController
