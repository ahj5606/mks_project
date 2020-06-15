package manager.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import manager.Logic.mgr_PatientLogic;
import manager.pojo.mgr_ModelAndView;

public class mgr_PatientController implements mgr_Controller {
	Logger logger = Logger.getLogger(mgr_PatientController.class);
	String requestName= null;
	mgr_PatientLogic mgr_pLogic =new mgr_PatientLogic();
	public mgr_PatientController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView(req,res);
		if("patientList".equals(requestName)) {
			String hp_code = req.getParameter("hp_code");
			logger.info("hp_code :"+hp_code);
			Map<String,Object> pMap = new HashMap();
			pMap.put("hp_code", hp_code);
			List<Map<String,Object>> pList= null;
			pList=mgr_pLogic.patientList(pMap);
			mav.addObject("pList", pList);
			mav.IsForward(true);
			mav.setViewName("/patient/patient");
		}else if("patientSEL".equals(requestName)) {
			
			
			
		}else if("patientDetail".equals(requestName)) {
			
			
			
			
		}else if("patientINS".equals(requestName)) {
			
			
			
			
		}else if("patientUPD".equals(requestName)) {
			
			
			
			
			
		}else if("patientDEL".equals(requestName)) {
			
			
			
			
			
		}
		
		
		return mav;
	}

}
