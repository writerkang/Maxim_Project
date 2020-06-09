package command.board;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.Command;

public class FileUploadCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 1. 업로드 된 파일 저장
		final String SAVE_URL = "ckupload";

		// 실제 저장되는 물리적인 경로 확인
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath(SAVE_URL);
		System.out.println("업로드 경로: " + saveDirectory);

		Enumeration names = null;
		String name = null; // parameter 로 넘어오는 name 값
		String originalFileName = null; // 원본 파일 이름
		String fileSystemName = null; // 실제 저장되는 파일 이름
		String fileType = null; // 파일 MIME 타입
		String fileUrl = null; // 업로드된 파일의 URl

		int maxPostSize = 5 * 1024 * 1024; // POST 받기, 최대 5M byte
		String encoding = "UTF-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 업로딩 파일 이름 중복에 대한 정책

		MultipartRequest multi = null;

		try {
			multi = new MultipartRequest(
					request,
					saveDirectory,
					maxPostSize,
					encoding,
					policy
					);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 1-2
		names = multi.getFileNames(); // type="file" 요소의 name들 추출
		while(names.hasMoreElements()) {
			name = (String)names.nextElement();
			System.out.println("input name: " + name); // CKEditor 에선 name 이 "upload" 이다.

			originalFileName = multi.getOriginalFileName(name);
			fileSystemName = multi.getFilesystemName(name);
			fileType = multi.getContentType(name);

			fileUrl = request.getContextPath() + "/" + SAVE_URL + "/" + fileSystemName;
			System.out.println("fileUrl: " + fileUrl);
		}

		// 2. response (CKEditor 에서 정한 포맷, json)
//		{
//		    "uploaded": 1,
//		    "fileName": "foo.jpg",
//		    "url": "/files/foo.jpg"
//		}

		String jsonString = "{\"filename\" : \"" + fileSystemName 
				+ "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}";

		try {
			response.setContentType("application/json); charset=utf-8");
			response.getWriter().write(jsonString);
		} catch(IOException e) {
			e.printStackTrace();
		}

	} // end execute()

}