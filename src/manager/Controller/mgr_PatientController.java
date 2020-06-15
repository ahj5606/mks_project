package manager.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.pojo.mgr_ModelAndView;

public class mgr_PatientController implements mgr_Controller {
	String requestName= null;
	public mgr_PatientController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView();
		if("patientSEL".equals(requestName)) {
			
			
			
		}else if("patientDetail".equals(requestName)) {
			
			
			
			
		}else if("patientINS".equals(requestName)) {
			
			
			
			
		}else if("patientUPD".equals(requestName)) {
			
			
			
			
			
		}else if("patientDEL".equals(requestName)) {
			
			
			
			
			
		}
		
		
		return mav;
	}

}
