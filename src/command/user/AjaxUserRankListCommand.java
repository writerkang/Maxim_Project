package command.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import beans.UserRankDTO;
import common.Command;

public class AjaxUserRankListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		responseJSON(request, response);
	}
	
	private void responseJSON(HttpServletRequest request, HttpServletResponse response) {
		UserRankDTO[] dtoArr = (UserRankDTO[])request.getAttribute("userRankList");
		
		JSONObject jsonOutput = new JSONObject();   // 최종 결과는 object
		
		if(dtoArr == null) {
			jsonOutput.put("status", "FAIL");
		} else {
			jsonOutput.put("status", "OK");  // object 에 property-value 추가
			int count = dtoArr.length;
			jsonOutput.put("count", count);
			
			// 글 목록
			JSONArray dataArr = new JSONArray();  // array
			
			for(int i = 0; i < count; i++) {
				JSONObject dataObj = new JSONObject();
				
				dataObj.put("user_uid", dtoArr[i].getUser_uid());		
				dataObj.put("user_name", dtoArr[i].getUser_name());
				dataObj.put("user_point", dtoArr[i].getUser_point());
				dataObj.put("user_rank", dtoArr[i].getUser_rank());
				
				// array 에 추가
				dataArr.put(dataObj);
			}
			
			jsonOutput.put("data", dataArr);	
		}
		
		String jsonString = jsonOutput.toString();   // JSON 객체 --> String 변환
		//System.out.println(jsonString);
		response.setContentType("application/json; charset=utf-8");  // MIME 설정
		
		try {
			response.getWriter().write(jsonString);  // response 내보내기
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	} // end responseJSON()	

}
