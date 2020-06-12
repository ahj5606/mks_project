package manager.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.pojo.mgr_ModelAndView;

public class mgr_DoctorController implements mgr_Controller {
	String requestName= null;
	public mgr_DoctorController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView();
		if("doctorSEL".equals(requestName)) {
			
			
		}else if("doctorDEPT".equals(requestName)) {
			
			
		} else if("doctorDetail".equals(requestName)) {
			
			
		} else if("doctorINS".equals(requestName)) {
			
			
		} else if("doctorUPD".equals(requestName)) {
			
			
		} else if("doctorDEL".equals(requestName)) {
			
			
		}  
		
		
		
		return mav;
	}

}
