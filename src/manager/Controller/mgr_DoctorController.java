package manager.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		logger.info("1+++++++++++++++++++++++++");
		//////
			Map<String,Object> pMap = new HashMap<>(); 
			HashMapBinder hmb = new HashMapBinder(req); 
			hmb.binder(pMap);
		///////
		String path = null;
		
		String dept_code = null;
//		String hp_code = "280HP";
		String hp_code = null;
		/////
			Cookie[] cookies = req.getCookies();
			logger.info("cookies:"+cookies);
			if(cookies!=null && cookies.length>0){
			for(int i =0;i<cookies.length;i++){
				String name = cookies[i].getName();
				logger.info("name:"+name);
				if(name.equals("dept_code")){
//						Map<String,Object> pMap = new HashMap<>();
					dept_code = cookies[i].getValue();
					logger.info("dept_code:"+dept_code);
					}
				}
			}
	 
	 ////////
		   HttpSession sess = req.getSession(); 
		   hp_code = (String)sess.getAttribute("hp_code"); 
		   logger.info("hp_code:"+ hp_code);
		   
		   pMap.put("hp_code", hp_code);
			   List<Map<String,Object>> dList = null;
			  
		   if(hp_code ==null || dept_code ==null) { //로그인 정보가 만료되었습니다.
				  mav.IsForward(false); 
				  mav.setViewName("/fail"); 
				  return mav;
					  
		   }
	///////	 
		
		
		if("doctorList".equals(requestName)) {
			logger.info("requestName: "+requestName);
//			List<Map<String,Object>> dList = null;
			List<Map<String,Object>> deptList = null;//진료과
//			Map<String, Object> pMap = new HashMap<>();
			//pMap.put("hp_code", hp_code);
			dList = mgr_dLogic.doctorList(pMap);
			deptList = mgr_dLogic.doctorDEPT(pMap);//드롭다운
			logger.info("docList: "+dList.size());
			logger.info("deptList: "+deptList.size());
			mav.addObject("docList", dList);
			mav.addObject("deptList",deptList);
			
			logger.info("deptList: "+deptList);
			mav.IsForward(true);
			mav.setViewName("/doctor/mgr_doctor");	
			
		}else if("doctorSEL".equals(requestName)) { 
//			 List<Map<String,Object>> dList = null; 
			 List<Map<String,Object>> deptList = null;//진료과
//			 Map<String,Object> pMap = new HashMap<>(); 
//			 HashMapBinder hmb = new HashMapBinder(req);
			// hmb.binder(pMap);
			 
			 dList = mgr_dLogic.doctorSEL(pMap); 
			 deptList = mgr_dLogic.doctorDEPT(pMap);//드롭다운
			 mav.addObject("docList",dList);
			 mav.addObject("deptList",deptList);
			 mav.IsForward(true);
			 mav.setViewName("/doctor/mgr_doctor");
			
			 
		}
		else if("doctorDetail".equals(requestName)) {
			String doc_code = null;
//			List<Map<String,Object>> dList = null;
//			Map<String, Object> pMap = new HashMap<>();
			//doc_code=req.getParameter("doc_code");
			//pMap.put("doc_code", doc_code);
			logger.info(pMap.get("doc_code"));
			dList = mgr_dLogic.doctorDetail(pMap);
			logger.info("doctorDetail dList: "+dList.size());
			mav.addObject("docList", dList);
			mav.IsForward(true);
			mav.setViewName("/doctor/mgr_doctorDetail");
			
			
		} else if("doctorINS".equals(requestName)) {
			logger.info("의사 등록 호출 시작");
			int result = 0;//1이면 등록 성공, 0이면 실패
//			Map<String,Object> pMap = new HashMap<>();
//			HashMapBinder hmb = new HashMapBinder(req);
//			hmb.binder(pMap);
			logger.info(pMap.get("dept_name"));
			logger.info(pMap.get("doc_state"));
			logger.info(pMap.get("doc_education"));
			result = mgr_dLogic.doctorINS(pMap);
			mav.IsForward(false);
			if(result==1) {
				path="/doctor/doctorList.mgr?";
			}else {
				path="/doctor/mgr_doctorDetail";
			}
			mav.setViewName(path);//form 태그 이용할 때
			
			
		} else if("doctorUPD".equals(requestName)) {
			int result =0;
//			Map<String,Object> pMap = new HashMap<>();
//			HashMapBinder hmb = new HashMapBinder(req);
//			hmb.binder(pMap);
			result = mgr_dLogic.doctorUPD(pMap);
			logger.info(result);
			mav.cudResult(result);
			mav.IsForward(false);
			if(result==1) {
				path="/doctor/doctorList.mgr?";
			}else {
				path="/doctor/mgr_doctorDetail";
			}
			mav.setViewName(path);//form 태그 이용할 때
			
		}else if("deptSearch".equals(requestName)) {
			logger.info("deptSearch 호출");
			List<Map<String,Object>> deptList = null;//진료과
//			Map<String,Object> pMap = new HashMap<>(); 
			pMap.put("hp_code",hp_code);
//			HashMapBinder hmb = new HashMapBinder(req);
//			hmb.binder(pMap);
//			logger.info(pMap.get("hp_code"));
			deptList = mgr_dLogic.deptSearch(pMap);
			logger.info(deptList);
			mav.addObject("deptList", deptList);
			mav.IsForward(true);
			mav.setViewName("/doctor/deptJson");
			
		}else if("reserveDay".equals(requestName)) {
			logger.info("reserveDay 호출");
			List<Map<String,Object>> resDay = null;//진료과
//			Map<String,Object> pMap = new HashMap<>(); 
			//pMap.put("hp_code",hp_code);
//			HashMapBinder hmb = new HashMapBinder(req);
//			hmb.binder(pMap);
//			logger.info(pMap.get("hp_code"));
			resDay = mgr_dLogic.reserveDay(pMap);
			logger.info(resDay);
			mav.addObject("resDay", resDay);
			mav.IsForward(true);
			mav.setViewName("/doctor/resJson");
			
		} else if("doctorDEL".equals(requestName)) {
			int result =0;
//			Map<String,Object> pMap = new HashMap<>();
//			HashMapBinder hmb = new HashMapBinder(req);
//			hmb.binder(pMap);
			result = mgr_dLogic.doctorDEL(pMap);
			mav.IsForward(false);
			if(result==1) {
				path = "/doctor/doctorList.mgr?";
			}else {
				path = "/doctor/doctorDetail.mgr?hp_code="+hp_code+"&doc_code="+req.getParameter("doc_code")+"&"
																  +"&hp_name="+req.getParameter("doc_name")+"&"
																  +"&doc_name="+req.getParameter("doc_name")+"&"
																  +"&dept_code="+req.getParameter("dept_code")+"&"
																  +"&dept_name="+req.getParameter("dept_name")+"&"
																  +"&doc_position="+req.getParameter("doc_position")+"&"
																  +"&doc_education="+req.getParameter("doc_education")+"&"
																  +"&doc_phone="+req.getParameter("doc_phone")+"&"
																  +"&doc_offday="+req.getParameter("doc_offday")+"&"
																  +"&doc_state="+req.getParameter("doc_state")+"&";
			}
			mav.setViewName(path);
		}  
		
		return mav;
	}

}
