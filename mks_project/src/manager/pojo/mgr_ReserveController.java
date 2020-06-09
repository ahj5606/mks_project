package manager.pojo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mgr_ReserveController implements mgr_Controller {
	String requestName= null;
	public mgr_ReserveController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView();
		if("reserveSEL".equals(requestName)){
			
			
			
		}else if("reserveDetail".equals(requestName)){


			
		}else if("reserveDEPT".equals(requestName)){
			
			
			
			
		}else if("reserveINS".equals(requestName)){
			
			
			
			
		}else if("reserveUPD".equals(requestName)){
			
			
			
			
		}else if("reserveDEL".equals(requestName)){
		
			
			
		
		}
		
		
		
		return mav;
	}

}
