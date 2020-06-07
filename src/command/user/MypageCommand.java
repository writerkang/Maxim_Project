package command.user;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AttachDAO;
import beans.AttachDTO;
import beans.MypageDAO;
import beans.MypageDTO;
import common.Command;

public class MypageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MypageDAO mypagedao = new MypageDAO();
		MypageDTO [] mypagearr = null;
		
		
		//첨부파일
		AttachDAO attachfileDao = new AttachDAO();
		AttachDTO [] attachfileArr = null;
		
		
		
		int uid = Integer.parseInt(request.getParameter("mypage_uid"));
		
		try {
			mypagearr = mypagedao.readByUid(uid);
			request.setAttribute("list", mypagearr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//첨부파일 읽어 들이기
		try {
			if(mypagearr != null && mypagearr.length == 1) {
				attachfileArr = attachfileDao.selectFilesByMypageUid(uid);  // 첨부파일 읽어오기
				
				// 이미지 파일 여부 세팅
				String realPath = "";
				String saveFolder = "upload";
				ServletContext context = request.getServletContext();
				realPath = context.getRealPath(saveFolder);
				
				for(AttachDTO attachDto : attachfileArr) {
											//  물리적으로 저장된 이름만 가져왔음(경로)
					String downloadFilePath = realPath + File.separator + attachDto.getAttach_servername();
					ImageIO.read(new File(downloadFilePath));
					BufferedImage imgData = ImageIO.read(new File(downloadFilePath));
					if(imgData != null) {
						attachDto.setImage(true); // is image
					}
				}
				request.setAttribute("file", attachfileArr);
			}			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}

	} // end execute()

} // end Command
