package manager.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String hp_code = null;
		String dept_code = null;
		Cookie[] cookies = req.getCookies();
		if(cookies!=null && cookies.length>0){
			for(int i =0;i<cookies.length;i++){
				String name = cookies[i].getName();
				if(name.equals("dept_code")){
					dept_code = cookies[i].getValue();
				}
			}
		}
		HttpSession sess = req.getSession();
		hp_code = (String)sess.getAttribute("hp_code");
		if(hp_code ==null || dept_code ==null) {
			//로그인 정보가 만료되었습니다.
		}
		if("patientList".equals(requestName)) {
			logger.info("hp_code :"+hp_code);
			
			Map<String,Object> pMap = new HashMap<>();
			pMap.put("hp_code", hp_code);
			List<Map<String,Object>> pList= null;
			pList=mgr_pLogic.patientList(pMap);
			
			mav.addObject("pList", pList);
			mav.IsForward(true);
			logger.info(pList);
			mav.setViewName("/patient/mgr_patient");
		}else if("patientSEL".equals(requestName)) {	
			
			
			String mem_name = req.getParameter("mem_name");
			String mem_socialnum = req.getParameter("mem_socialnum");
			
			
			
			List<Map<String,Object>> pList = null;
			Map<String, Object> pMap = new HashMap<>();
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
			if(req.getParameter("isJSON")!=null) {
				mav.setViewName("/patient/patient");
			}else {
				mav.setViewName("/patient/mgr_patient");	
			}
		}else if("patientDetail".equals(requestName)) {
			String mem_code = req.getParameter("mem_code");
			//멤버 테이블에서 조회
			List<Map<String,Object>> pList = null;
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("mem_code", mem_code);
			pMap.put("hp_code", hp_code);
			pList = mgr_pLogic.patientDetail(pMap);
			mav.addObject("pList", pList);
			mav.IsForward(true);
			mav.setViewName("/patient/mgr_patientDetail");
			
		}else if("patientINS".equals(requestName)) {
			String doc_name = req.getParameter("doc_name");
			String dept_name = req.getParameter("dept_name");
			dept_code = req.getParameter("dept_code");
			String doc_code = req.getParameter("doc_code");
			String hp_name = req.getParameter("hp_name");
			String his_date = req.getParameter("his_date");
			String mem_name = req.getParameter("mem_name");
			String mem_social = req.getParameter("mem_social");
			String mem_phone = req.getParameter("mem_phone");
			String mem_address = req.getParameter("mem_address");
			String his_content = req.getParameter("his_content");
			
			logger.info(doc_name);
			logger.info(dept_name);
			logger.info(dept_code);
			logger.info(doc_code);
			logger.info(hp_name);
			logger.info(his_date);
			logger.info(mem_name);
			logger.info(mem_social);
			logger.info(mem_phone);
			logger.info(mem_address);
			logger.info(his_content);
			
			Map<String, Object> pMap = new HashMap();
			pMap.put("hp_code", hp_code);
			pMap.put("doc_name", doc_name);
			pMap.put("dept_name", dept_name);
			pMap.put("dept_code", dept_code);
			pMap.put("doc_code", doc_code);
			pMap.put("hp_name", hp_name);
			pMap.put("his_date", his_date);
			pMap.put("mem_name", mem_name);
			pMap.put("mem_social", mem_social);
			pMap.put("mem_phone", mem_phone);
			pMap.put("mem_address", mem_address);
			pMap.put("his_content", his_content);
			int result =-1;
			
			result = mgr_pLogic.patientINS(pMap);
			mav.cudResult(result);
			
			
		}else if("patientUPD".equals(requestName)) {
			String mem_code = req.getParameter("mem_code");
			String mem_name = req.getParameter("mem_name");
			String mem_phone = req.getParameter("mem_phone");
			String mem_address = req.getParameter("mem_address");
			Map<String, Object> pMap = new HashMap();
			pMap.put("hp_code", hp_code);
			pMap.put("mem_code", mem_code);
			pMap.put("mem_name", mem_name);
			pMap.put("mem_phone", mem_phone);
			pMap.put("mem_address", mem_address);
			
			int result=-1;
			result = mgr_pLogic.patientUPD(pMap);
			String path = null;
			mav.cudResult(result);
		}else if("patientDEL".equals(requestName)) {
			String mem_code = req.getParameter("mem_code");
			Map<String, Object> pMap = new HashMap();
			pMap.put("hp_code", hp_code);
			pMap.put("mem_code", mem_code);
			
			int result=-1;
			result = mgr_pLogic.patientDEL(pMap);
			
			String path = null;
			mav.IsForward(false);
			if(result==1) {
				path = "/patient/patientList.mgr?";
			}else {
				path = "/patient/patientDetail.mgr?hp_code="+hp_code+"&mem_code="+mem_code+"&";
			}
			mav.setViewName(path);
		}else if("patientDoctor".equals(requestName)) {
			List<Map<String,Object>> pList = null;
			Map<String, Object> pMap = new HashMap();
			pMap.put("hp_code", hp_code);
			pMap.put("dept_code", dept_code);
			pList = mgr_pLogic.patientDoctor(pMap);
			mav.addObject("pList", pList);
			mav.IsForward(true);
			mav.setViewName("/patient/patient");
			
			
		}else if("patientHISINS".equals(requestName)) {
			String hp_name = req.getParameter("hp_name");
			String doc_name = req.getParameter("doc_name");
			String mem_code = req.getParameter("mem_code");
			String dept_name = req.getParameter("dept_name");
			dept_code = req.getParameter("dept_code");
			String doc_code = req.getParameter("doc_code");
			String his_content = req.getParameter("modal_content");
			String his_date = req.getParameter("his_date");
			Map<String, Object> pMap = new HashMap();
			pMap.put("hp_code", hp_code);
			pMap.put("doc_name", doc_name);
			pMap.put("mem_code", mem_code);
			pMap.put("dept_name", dept_name);
			pMap.put("dept_code", dept_code);
			pMap.put("doc_code", doc_code);
			pMap.put("his_content", his_content);
			pMap.put("his_date", his_date);
			pMap.put("hp_name", hp_name);
			int result=-1;
			result = mgr_pLogic.patientHISINS(pMap);
			mav.IsForward(false);
			String path = null;
			if(result==1) {
				path = "/patient/patientDetail.mgr?hp_code="+hp_code+"&mem_code="+mem_code+"&";
			}else {
				path = "/patient/patientList.mgr?";
			}
			mav.setViewName(path);
		}
		
		
		return mav;
	}

}
