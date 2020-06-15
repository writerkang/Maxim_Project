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
import common.Command;

public class FileUploadViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int cnt = 0;

		AttachDAO dao = new AttachDAO();
		AttachDTO[] fileArr = null;

		// uid 파라미터 받아오기.
		int user_uid = Integer.parseInt(request.getParameter("user_uid"));

		// 첨부파일 읽어 들이기
		try {
			fileArr = dao.selectFileByUid(user_uid); // 첨부파일 읽어오기(데이터베이스에서 DB 정보만 읽어온 것임.(•alarm-black-18dp.svg) 이런식으로
														// 화면에 보임)
			// 이미지 파일 여부 세팅
			String realPath = "";
			String saveFolder = "fileUpload";
			ServletContext context = request.getServletContext();
			realPath = context.getRealPath(saveFolder);

			for (AttachDTO fileDto : fileArr) {
				String downloadedFilePath = realPath + File.separator + fileDto.getAttach_servername();
				BufferedImage imgData = ImageIO.read(new File(downloadedFilePath));
				if (imgData != null) {
					fileDto.setImage(true); // 이미지 임!
				}
			} 
			
			request.setAttribute("attach", fileArr); // attach 이라는 이름에 결과값 담아서 view 로 보내줌

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	} // end execute()
} // end Command
