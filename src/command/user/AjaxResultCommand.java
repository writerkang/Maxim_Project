package command.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import beans.AjaxWriteResult;
import common.Command;

public class AjaxResultCommand implements Command {  // 여기는 결과 받아가주구 json형태로 response 해주는 곳

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// DML 에 해당되는 Command
		
		AjaxWriteResult result = new AjaxWriteResult(); // 이걸 json으로 변환해서 response 할 것 
		
		result.setStatus((String)request.getAttribute("status"));
		result.setMessage((String)request.getAttribute("message"));
		result.setCount((Integer)request.getAttribute("result"));		
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			String jsonString = mapper.writerWithDefaultPrettyPrinter()
								.writeValueAsString(result);
			
			response.setContentType("application/json; charset=utf-8"); 
			response.getWriter().write(jsonString);			
		} catch(JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		

	} // end execute

} // end AjaxResultCommand
