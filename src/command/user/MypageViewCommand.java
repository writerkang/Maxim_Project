package command.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import beans.MypageDAO;
import beans.UserDTO;
import common.Command;

public class MypageViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		MypageDAO dao = new MypageDAO();
		UserDTO[] arr = null;

//		int user_uid = Integer.parseInt(request.getParameter("user_uid"));
		StringBuffer message = new StringBuffer();
		String status = "FAIL"; // 기본 FAIL

		// mypageView.jsp 에서 uid 파라미터 받아오기.
		String param = request.getParameter("user_uid");

		// 유효성 검사
		if (param == null) {
			message.append("[유효하지 않은 parameter 0 or null]");
		} else {
			try {
				int user_uid = Integer.parseInt(param);

				arr = dao.viewByUid(user_uid); // subject 와 content 를 가져와서 UserDTO [] 에 담아줌 

				if (arr == null) {
					message.append("[해당 데이터가 없습니다]");
				} else {
					status = "OK";
					HttpSession session = request.getSession(true);
					session.setAttribute("mypage", arr); // 그 정보를 session 에 저장하고 보내줌.
					
				}

			} catch (SQLException e) {
				 e.printStackTrace();
				message.append("[MypageDAO 수행 에러:" + e.getMessage() + "]");
			} catch (Exception e) {
				e.printStackTrace();
				message.append("[예외발생:" + e.getMessage() + "]");
			} // end try
		} // end if
			
		

		// 첨부파일 읽어 들이기
//		try {
//			if(mypagearr != null && mypagearr.length == 1) {
//				attachfileArr = attachfileDao.selectFilesByMypageUid(uid);  // 첨부파일 읽어오기
//				
//				// 이미지 파일 여부 세팅
//				String realPath = "";
//				String saveFolder = "upload";
//				ServletContext context = request.getServletContext();
//				realPath = context.getRealPath(saveFolder);
//				
//				for(AttachDTO attachDto : attachfileArr) {
//											//  물리적으로 저장된 이름만 가져왔음(경로)
//					String downloadFilePath = realPath + File.separator + attachDto.getAttach_servername();
//					ImageIO.read(new File(downloadFilePath));
//					BufferedImage imgData = ImageIO.read(new File(downloadFilePath));
//					if(imgData != null) {
//						attachDto.setImage(true); // is image
//					}
//				}
//				request.setAttribute("file", attachfileArr);
//			}			
//			
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} catch(IOException e) {
//			e.printStackTrace();
//		}
//
//		MypageDAO dao = new MypageDAO();
//		UserDTO[] arr = null;
		// 첨부파일
//		AttachDAO attachfileDao = new AttachDAO();
//
		// user uid 얻어오기.. 어디서? --> mypageView.jsp 에서 input hidden 으로 uid값 보내줌.
//		int user_uid = Integer.parseInt(request.getParameter("user_uid"));
//
//		// ajax response 에 필요한 값들
//		StringBuffer message = new StringBuffer();
//		String status = "FAIL"; // 기본 FAIL
//
//		// mypageView.jsp 에서 uid 파라미터 받아오기.
//		String param = request.getParameter("user_uid");
//
//		// 유효성 검사
//		if (param == null) {
//			message.append("[유효하지 않은 parameter 0 or null]");
//		} else {
//			try {
//				int user_uid = Integer.parseInt(param);
//
//				arr = dao.viewByUid(user_uid); // subject 와 content 를 가져와서 UserDTO [] 에 담아줌 
//
//				if (arr == null) {
//					message.append("[해당 데이터가 없습니다]");
//				} else {
//					status = "OK";
//				}
//
//			} catch (SQLException e) {
//				 e.printStackTrace();
//				message.append("[MypageDAO 수행 에러:" + e.getMessage() + "]");
//			} catch (Exception e) {
//				e.printStackTrace();
//				message.append("[예외발생:" + e.getMessage() + "]");
//			} // end try
//		} // end if
//		
//		request.setAttribute("status", status);
//		request.setAttribute("message", message.toString());
//		
//		//타입을 json으로 바꿔줘야됨
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        // arr 을 json 형태로 바꿔주는 구문(라이브러리 필수, zip->jar 확장자명 꼭 확인)
//        String gson = new Gson().toJson(arr);
//
//        try {
//            //ajax로 리턴해주는 부분
//            response.getWriter().write(gson);
//        } catch (JsonIOException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//		
	}

} // end Command