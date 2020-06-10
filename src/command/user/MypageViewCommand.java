package command.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.MypageDAO;
import beans.UserDTO;
import common.Command;

public class MypageViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MypageDAO dao = new MypageDAO();
		UserDTO [] arr = null;
		//첨부파일
//		AttachDAO attachfileDao = new AttachDAO();
		
		// user uid 얻어오기..  어디서?  -->  mypageView.jsp 에서 input hidden 으로  uid값 보내줌.
		int user_uid = Integer.parseInt(request.getParameter("user_uid"));
		
		try {
			cnt = dao.viewByUid(user_uid);
			request.setAttribute("list", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//첨부파일 읽어 들이기
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

	} // end execute()

} // end Command
