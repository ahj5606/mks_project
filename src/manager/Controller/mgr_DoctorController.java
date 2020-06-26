package manager.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.Spring;

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
			
			List<Map<String,Object>> dList = null;
			Map<String, Object> pMap = new HashMap<>();
//			
//				
			dList = mgr_dLogic.doctorList(pMap);
			logger.info("docList: "+dList.size());
//				
			mav.addObject("docList", dList);
			mav.IsForward(true);
			mav.setViewName("/doctor/mgr_doctor");	
			
		}else if("doctorSEL".equals(requestName)) { 
			 String doc_name = req.getParameter("doc_name");
			 String doc_code = req.getParameter("doc_code");
			 String hp_code = "280HP";
			 
			 List<Map<String,Object>> dList = null; 
			 Map<String,Object> pMap = new HashMap<>(); 
			 
			 pMap.put("doc_name",doc_name);
			 pMap.put("doc_code",doc_code);
			 pMap.put("hp_code",hp_code);
			 dList = mgr_dLogic.doctorSEL(pMap); 
			 mav.addObject("docList",dList);
			 mav.IsForward(true);
			 mav.setViewName("/doctor/mgr_doctor");
			
			 
		}
		else if("doctorDetail".equals(requestName)) {
			String doc_code = null;
			List<Map<String,Object>> dList = null;
			Map<String, Object> pMap = new HashMap<>();
			doc_code=req.getParameter("doc_code");
			pMap.put("doc_code", doc_code);
			logger.info(pMap.get("doc_code"));
			dList = mgr_dLogic.doctorDetail(pMap);
			logger.info("doctorDetail dList: "+dList.size());
			mav.addObject("docList", dList);
			mav.IsForward(true);
			mav.setViewName("/doctor/mgr_doctorDetail");
			
			
		} else if("doctorINS".equals(requestName)) {
			logger.info("의사 등록 호출 시작");
			int result = 0;//1이면 등록 성공, 0이면 실패
			Map<String,Object> pMap = new HashMap<>();
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.binder(pMap);
			
			logger.info(pMap.get("dept_name"));
			logger.info(pMap.get("doc_state"));
			logger.info(pMap.get("doc_education"));
			result = mgr_dLogic.doctorINS(pMap);
			
			
		} else if("doctorUPD".equals(requestName)) {
			int result =0;
			Map<String,Object> pMap = new HashMap<>();
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.binder(pMap);
			result = mgr_dLogic.doctorUPD(pMap);
			
			
		} else if("doctorDEL".equals(requestName)) {
			int result =0;
			Map<String,Object> pMap = new HashMap<>();
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.binder(pMap);
			result = mgr_dLogic.doctorDEL(pMap);
			
		}  
		
		return mav;
	}

}
