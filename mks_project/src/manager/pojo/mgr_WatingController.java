package manager.pojo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class mgr_WatingController implements mgr_Controller {
	Logger logger =Logger.getLogger(mgr_WatingController.class);
	String requestName= null;
	public mgr_WatingController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView();
		if("waitingNOW".equals(requestName)) {
			logger.info("waitingNOW 호출");
			
			
			
		}
		
		
		
		return mav;
	}

}
