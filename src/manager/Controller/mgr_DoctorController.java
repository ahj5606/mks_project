package manager.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.Logic.mgr_DoctorLogic;
import manager.pojo.mgr_ModelAndView;

public class mgr_DoctorController implements mgr_Controller {
	String requestName= null;
	mgr_DoctorLogic mgr_dLogic =new mgr_DoctorLogic();
	public mgr_DoctorController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView();
		if("doctorSEL".equals(requestName)) {
			String hp_code = req.getParameter("hp_code");
			String doc_name = req.getParameter("doc_name");
			String dept_name = req.getParameter("dept_name");
			String doc_position = req.getParameter("doc_position");
			String doc_education = req.getParameter("doc_education");
			String doc_phone = req.getParameter("doc_phone");
			String doc_offday = req.getParameter("doc_offday");
			String doc_state = req.getParameter("doc_state");
			
			List<Map<String,Object>> dList = null;
			Map<String, Object> pMap = new HashMap<>();
			
				pMap.put("hp_code", hp_code);
				pMap.put("doc_name", doc_name);
				pMap.put("dept_name", dept_name);
				pMap.put("doc_position", doc_position);
				pMap.put("doc_education", doc_education);
				pMap.put("doc_phone", doc_phone);
				pMap.put("doc_offday", doc_offday);
				pMap.put("doc_state", doc_state);
				
				dList = mgr_dLogic.doctorSEL(pMap);
				
			mav.addObject("dList", dList);
			mav.IsForward(true);
			mav.setViewName("/doctor/mgr_doctor");	
			
		}else if("doctorDEPT".equals(requestName)) {
			
			
		} else if("doctorDetail".equals(requestName)) {
			
			
		} else if("doctorINS".equals(requestName)) {
			
			
		} else if("doctorUPD".equals(requestName)) {
			
			
		} else if("doctorDEL".equals(requestName)) {
			
			
		}  
		
		return mav;
	}

}
