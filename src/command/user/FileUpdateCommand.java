package command.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import beans.AttachDAO;
import common.Command;

public class FileUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;

		AttachDAO dao = new AttachDAO();  // 첨부파일
		
		//---------------------------------------------------------
		// 1. 업로드 파일 (들)
		ServletContext context = request.getServletContext();
		String attach_uri = context.getRealPath("fileUpload");
		String originalFileName = null;
		String servername = null;
		
		int maxPostSize = 5 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(
					request,
					attach_uri,
					maxPostSize,
					encoding,
					policy
					);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		
		Enumeration names = multi.getFileNames();  // type="file" 요소의 name들 추출
		while(names.hasMoreElements()) {
			String name = (String)names.nextElement();
			originalFileName = multi.getOriginalFileName(name);
			servername = multi.getFilesystemName(name);
			System.out.println("첨부파일: " + originalFileName + "->" + servername);
			
//			if(originalFileName != null && servername != null) {
//				
//				originalFileNames.add(originalFileName);
//				fileSystemNames.add(fileSystemName);
//			}
			
		} // end while
		
		//-----------------------------------------------------------
		// 2. 삭제될 첨부파일(들)
		int fileUid = Integer.parseInt(multi.getParameter("uid"));
		
			try {
				dao.deleteByUid(fileUid, request); // 물리적 삭제 + DB 테이블 삭제 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		

		//------------------------------------------------------------
		// 추가된 첨부파일(들)
		dao = new AttachDAO();
		try {
			dao.insert(fileUid, originalFileName, servername, attach_uri);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
		request.setAttribute("user_uid", fileUid);  // Multipart 로 받은 뒤 mypageView.jsp로 넘겨야 함

		

	} // end execute()

} // end Command 
