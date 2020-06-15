package command.user;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import beans.AttachDAO;
import common.Command;

public class FileUploadCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		AttachDAO dao = new AttachDAO();
		int cnt = 0;

//		int user_uid = Integer.parseInt(request.getParameter("user_uid"));
		StringBuffer message = new StringBuffer();
		String status = "FAIL"; // 기본 FAIL

		// mypageView.jsp form action 에서 uid 파라미터 받아오기.
		String param = request.getParameter("user_uid");
		String originalFileName = null;
		String servername = null;
		

		// 파일 저장경로
		// 서버에서(서블릿) 어디에 어느폴더에서 서블릿으로 변환되는지 알아내기
		ServletContext context = request.getServletContext();// 현재 가동중인 서블릿 : this,    
		String attach_uri = context.getRealPath("fileUpload");
	
		System.out.println("업로드 경로: " + attach_uri); // 콘솔에 찍어보기
	
		int maxPostSize = 1024 * 1024 * 100; // POST 받기, 최대크기 5M byte = ? byte
		String encoding = "UTF-8"; // 인코딩

		FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 업로딩 파일 이름 중복에 대한 rename 정책
		
		MultipartRequest multi = null;
		
		try{ // jsp 파일에서 에외를 반드시 catch 할 필요는 없다.. 안하면 500이 나올 뿐
			
			// MultipartRequest 생성단계에서 이미 파일은 저장됨(((((())))))
			multi = new MultipartRequest(
					request, // JSP 내부객체 request
					attach_uri, // 업로드 파일 저장 경로 
					maxPostSize, // 최대 파일 크기 (post 크기)
					encoding, 
					policy  // 중복이름의 파일 rename 객체 
					);
		
		
		Enumeration names = null;
		
		// 1. Parameter name 들 추출
		names = multi.getParameterNames(); // 일반 form parameter name 
		while(names.hasMoreElements()){
			String name  = (String)names.nextElement(); // name
			String value = multi.getParameter(name); // value
			System.out.println(name + " : " + value + "<br>");
			
		} // end while 
//		out.println("<hr>");
		
		// 2. File 들 추출 
		names = multi.getFileNames(); // type="file" 요소 name 들 추출(input 의  file 타입의 name 들을 뽑음) 
		while(names.hasMoreElements()){
			String name = (String)names.nextElement();
			System.out.println("input name: " + name + "<br>"+ "<br>");
			
			
			// 파일첨부 구현하려면, 이 두가지의 파일명을 모두 서버에 저장해야 한다 !!!
			
			// 위 name 의 '업로드 파일명'을 가져온다.
			originalFileName = multi.getOriginalFileName(name);
			System.out.println("원본파일 이름: " + originalFileName + "<br>"+ "<br>");
			System.out.println("<input type='hidden' name='originalFileName' value='" + originalFileName + "'");
		
			// 서버 시스템에 '저장된 파일명'을 가져온다. 
			servername = multi.getFilesystemName(name);
			System.out.println("파일시스템 이름: " + servername + "<br>"+ "<br>");
			System.out.println("<input type='hidden' name='servername' value='" + servername + "'");
			
			// 업로딩된 파일의 타입 : MIME 타입(ex: image/png ...)  __ 내가 정해준 파일 타입만 업로드 걸어줄 경우  -> 이 시점에서 마임타입 정해서 해줘야 한다. 
			String fileType = multi.getContentType(name);
			System.out.println("파일타입: " +  fileType + "<br>"+ "<br>");
			
			// 문자열 '파일이름' 이 name 에 들어온 상태
			// 문자열 파일이름을 통해 실제 파일 정보를 -> File 객체로 가져오기 
			File file  = multi.getFile(name);
			if(file != null){
				long fileSize = file.length(); // 파일 크기 (byte)
				System.out.println("파일크기: " + file + " bytes<br>");
			}
			
			// 이미지 파일 다루기
			BufferedImage bi = ImageIO.read(file); // 파일 객체를 read 안에 넣어주면 파일을 읽어들임. 
			
			// 파일이 이미지였으면 -> null 이 아닌 어떤 걸 리턴할 것임.
			
			if(bi != null){ // ★이미지 파일 판정 여부 ★
				int width = bi.getWidth();
				int height = bi.getHeight();
//				out.println("이미지파일 W x H: " + width + " x " + height);
			} else {
//				out.println("이미지가 아닙니다.<br>");
			}
			
//				out.println("<hr>");
		} // end while 
		
			
		} catch(Exception e){
			e.printStackTrace();
//			out.println("파일 처리 예외 발생 <br>");
			
		}
		
		// 유효성 검사
		if (param == null) {
			message.append("[유효하지 않은 parameter 0 or null]");
		} else {
			try {
				int user_uid = Integer.parseInt(param);
				request.setAttribute("user_uid", user_uid);

				cnt = dao.insert(user_uid, originalFileName, servername, attach_uri); // 특정 uid 로부터 file oriname 과 servername 배열에 담음. 
				System.out.println("insert cnt: " + cnt + "개");
				// insert 수행하고, 

				if (cnt == 0) {
					message.append("[해당 데이터가 없습니다]");
				} else {
					status = "OK";
				}

			} catch (SQLException e) {
				 e.printStackTrace();
				message.append("[MypageDAO 수행 에러:" + e.getMessage() + "]");
			} catch (Exception e) {
				e.printStackTrace();
				message.append("[예외발생:" + e.getMessage() + "]");
			} // end try
			
		} // end if
		
			
	} // end execute()
} // end Command
