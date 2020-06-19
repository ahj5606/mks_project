package manager.Controller;

import java.io.IOException;
import java.util.ArrayList;
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
		String path = "";
		if("doctorSEL".equals(requestName)) {
			String doc_code = req.getParameter("doc_code");
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
			if("".equals(req.getParameter("doc_code"))) {
				doc_code=null;
			}
			if("".equals(req.getParameter("hp_code"))) {
				hp_code=null;
			}
			if("".equals(req.getParameter("doc_name"))) {
				doc_name=null;
			}
			if("".equals(req.getParameter("doc_position"))) {
				doc_position=null;
			}	
			if("".equals(req.getParameter("doc_education"))) {
				doc_education=null;
			}
			if("".equals(req.getParameter("doc_phone"))) {
				doc_phone=null;
			}	
			if("".equals(req.getParameter("doc_offday"))) {
				doc_offday=null;
			}
			if("".equals(req.getParameter("doc_state"))) {
				doc_state=null;
			}	
				pMap.put("doc_code", doc_code);
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
			
			
		}else if("doctorList".equals(requestName)) { 
			List<Map<String,Object>> docList = null;
			Map<String,Object> pMap = new HashMap<>();
			docList = mgr_dLogic.doctorList(pMap);
			if(docList==null) {
				docList = new ArrayList<>();//memList.size()=0
			}
			req.setAttribute("docList", docList);
			path = "forward:/doctor/doctorList.jsp";
		}
		else if("doctorDetail".equals(requestName)) {
			String doc_code = req.getParameter("doc_code");
			String hp_code = req.getParameter("hp_code");
			String doc_name = req.getParameter("doc_name");
			String dept_name = req.getParameter("dept_name");
			String doc_position = req.getParameter("doc_position");
			String doc_education = req.getParameter("doc_education");
			String doc_phone = req.getParameter("doc_phone");
			String doc_offday = req.getParameter("doc_offday");
			String doc_state = req.getParameter("doc_state");
			//멤버 테이블에서 조회
			List<Map<String,Object>> dList = null;
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("doc_code", doc_code);
			pMap.put("hp_code", hp_code);
			pMap.put("doc_name", doc_name);
			pMap.put("dept_name", dept_name);
			pMap.put("doc_position", doc_position);
			pMap.put("doc_education", doc_education);
			pMap.put("doc_phone", doc_phone);
			pMap.put("doc_offday", doc_offday);
			pMap.put("doc_state", doc_state);
			dList = mgr_dLogic.doctorDetail(pMap);
			mav.addObject("dList", dList);
			mav.IsForward(true);
			mav.setViewName("/doctor/mgr_doctorDetail");
			
		} else if("doctorINS".equals(requestName)) {
			
			
		} else if("doctorUPD".equals(requestName)) {
			
			
		} else if("doctorDEL".equals(requestName)) {
			
			
		}  
		
		return mav;
	}

}
