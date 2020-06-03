package common;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PostDAO;
import beans.PostDTO;


/**
 * Servlet implementation class IndexServlet
 */
@WebServlet({ "/index.*", "/" })
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				request.setCharacterEncoding("UTF-8");
		
				// 컨트롤러는 다음 두개를 선택해야 한다.
				String viewPage = null;   // 어떠한 뷰? --> 페이지
										
				PostDAO dao = new PostDAO(); //DAO 객체 생성
				PostDTO [] arr = null;
				
				try {
					arr = dao.select();
					
					// "list"란 name으로  request에 arr값 전달
					// 즉 request에 담아서 컨트롤러에 전달되는 셈
					request.setAttribute("list", arr);
					
					
				} catch(SQLException e) {
					// 만약  connection pool 사용한다면
					// NamingException도 처리해야 함
					e.printStackTrace();
				}
				
				
				viewPage = "index.jsp";
				
					
					
				
				// request 를 위에서 결정된 view 에 forward 해줌.
				if(viewPage != null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
				}	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
