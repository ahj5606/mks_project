package manager.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.Logic.mgr_PatientLogic;
import manager.pojo.mgr_ModelAndView;

public class mgr_PatientController implements mgr_Controller {
	String requestName= null;
	mgr_PatientLogic mgr_pLogic =new mgr_PatientLogic();
	public mgr_PatientController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView();
		if("patientList".equals(requestName)) {
			String hp_code = req.getParameter("hp_code");
			Map<String,Object> pMap = new HashMap();
			pMap.put("hp_code", hp_code);
			mgr_pLogic.patientList(pMap);
		}else if("patientSEL".equals(requestName)) {
			
			
			
		}else if("patientDetail".equals(requestName)) {
			
			
			
			
		}else if("patientINS".equals(requestName)) {
			
			
			
			
		}else if("patientUPD".equals(requestName)) {
			
			
			
			
			
		}else if("patientDEL".equals(requestName)) {
			
			
			
			
			
		}
		
		
		return mav;
	}

}
