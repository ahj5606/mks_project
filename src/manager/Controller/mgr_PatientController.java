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
			logger.info(pList);
			mav.setViewName("/patient/mgr_patient");
		}else if("patientSEL".equals(requestName)) {	
			String hp_code = req.getParameter("hp_code");
			String mem_name = req.getParameter("mem_name");
			String mem_socialnum = req.getParameter("mem_socialnum");
			List<Map<String,Object>> pList = null;
			Map<String, Object> pMap = new HashMap();
			if("".equals(req.getParameter("mem_name"))) {
				mem_name=null;
			}
			if("".equals(req.getParameter("mem_socialnum"))) {
				mem_socialnum=null;
			}
				pMap.put("hp_code", hp_code);
				pMap.put("mem_name", mem_name);
				pMap.put("mem_socialnum", mem_socialnum);
				pList = mgr_pLogic.patientSEL(pMap);
				
			
			
			
			mav.addObject("pList", pList);
			mav.IsForward(true);
			mav.setViewName("/patient/mgr_patient");			
		}else if("patientDetail".equals(requestName)) {
			String mem_code = req.getParameter("mem_code");
			String hp_code = req.getParameter("hp_code");
			//멤버 테이블에서 조회
			List<Map<String,Object>> pList = null;
			Map<String, Object> pMap = new HashMap();
			pMap.put("mem_code", mem_code);
			pMap.put("hp_code", hp_code);
			pList = mgr_pLogic.patientDetail(pMap);
			mav.addObject("pList", pList);
			mav.IsForward(true);
			mav.setViewName("/patient/mgr_patientDetail");
			
		}else if("patientINS".equals(requestName)) {
			//
			
			
			
		}else if("patientUPD".equals(requestName)) {
			
			
			
			
			
		}else if("patientDEL".equals(requestName)) {
			
			
			
			
			
		}
		
		
		return mav;
	}

}
