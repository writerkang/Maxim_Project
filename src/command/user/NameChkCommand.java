package command.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import beans.UserDAO;
import common.Command;

public class NameChkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		UserDAO dao = new UserDAO();

		// request에서 매개변수 받아오기
		String user_name = request.getParameter("user_name");
		
		if(user_name != null && user_name.trim().length() > 0) {
			
			try {
				cnt = dao.nameCheck(user_name);  // cnt 는  1(중복있음) 또는 0(없음) 담길 것.
			} catch(SQLException e){
				e.printStackTrace();
			}
		} // end if
				
		request.setAttribute("result", cnt);

		//타입을 json으로 바꿔줘야됨
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // cnt를 json 형태로 바꿔주는 구문(라이브러리 필수, zip->jar 확장자명 꼭 확인)
        String gson = new Gson().toJson(cnt);

        try {
            //ajax로 리턴해주는 부분
            response.getWriter().write(gson);
        } catch (JsonIOException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
		
	}

}
