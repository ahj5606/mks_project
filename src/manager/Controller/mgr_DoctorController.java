package manager.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import manager.Logic.mgr_DoctorLogic;
import manager.pojo.mgr_ModelAndView;
import mks.util.HashMapBinder;

public class mgr_DoctorController implements mgr_Controller {
	
	Logger logger = Logger.getLogger(mgr_DoctorController.class);
	String requestName= null;
	mgr_DoctorLogic mgr_dLogic =new mgr_DoctorLogic();
	public mgr_DoctorController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView(req, res);
		String path = "";
		if("doctorList".equals(requestName)) {
			logger.info("requestName: "+requestName);
			
			List<Map<String,Object>> docList = null;
			Map<String, Object> pMap = new HashMap<>();
//			
//				
				docList = mgr_dLogic.doctorList(pMap);
				logger.info("docList: "+docList.size());
//				
			mav.addObject("docList", docList);
			mav.IsForward(true);
			mav.setViewName("/doctor/mgr_doctor");	
			
		}else if("doctorSEL".equals(requestName)) { 
			 String doc_name = req.getParameter("doc_name");
			 String doc_code = req.getParameter("doc_code");
			 String hp_code = "280HP";
			 
			 List<Map<String,Object>> docSEL = null; 
			 Map<String,Object> pMap = new HashMap<>(); 
			 
			 pMap.put("doc_name",doc_name);
			 pMap.put("doc_code",doc_code);
			 pMap.put("hp_code",hp_code);
			 docSEL = mgr_dLogic.doctorSEL(pMap); 
			 mav.addObject("docList",docSEL);
			 mav.IsForward(true);
			 mav.setViewName("/doctor/mgr_doctor");
			 
			 
		}
		else if("doctorDetail".equals(requestName)) {
			List<Map<String,Object>> docDetail = null;
			Map<String, Object> pMap = new HashMap<>();
			docDetail = mgr_dLogic.doctorDetail(pMap);
			logger.info("doctorDetail dList: "+docDetail.size());
			mav.addObject("docDetail", docDetail);
			mav.IsForward(true);
			mav.setViewName("/doctor/mgr_doctorDetail");
			
			
		} else if("doctorINS".equals(requestName)) {
			logger.info("의사 등록 호출 시작");
			int result = 0;//1이면 등록 성공, 0이면 실패
			Map<String,Object> pMap = new HashMap<>();
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.binder(pMap);
			/*
			pMap.put("dept_name",req.getParameter("dept_name"));
			pMap.put("doc_code",req.getParameter("doc_code"));
			pMap.put("doc_state",req.getParameter("doc_state"));
			pMap.put("doc_name",req.getParameter("doc_name"));
			pMap.put("doc_position",req.getParameter("doc_position"));
			pMap.put("doc_education",req.getParameter("doc_education"));
			pMap.put("doc_phone",req.getParameter("doc_phone"));
			pMap.put("doc_offday",req.getParameter("doc_offday"));
			*/
			logger.info(pMap.get("dept_name"));
			logger.info(pMap.get("doc_state"));
			logger.info(pMap.get("doc_education"));
			result = mgr_dLogic.doctorINS(pMap);
			path = "redirect:/manage/doctorList.mgr?crud=doctorList";
			
		} else if("doctorUPD".equals(requestName)) {
			int result =0;
			Map<String,Object> pMap = new HashMap<>();
			result = mgr_dLogic.doctorUPD(pMap);
			path = "redirect:/manage/doctorList.mgr?crud=doctorList";
		} else if("doctorDEL".equals(requestName)) {
			int result =0;
			Map<String,Object> pMap = new HashMap<>();
			result = mgr_dLogic.doctorDEL(pMap);
			path = "redirect:/manage/doctorList.mgr?crud=doctorList";
		}  
		
		return mav;
	}

}
