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
import mks.util.HashMapBinder;

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
		////////////////////// HashMapBinder
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.binder(pMap);
		////////////////////////////////
		
		String hp_code = null;
		String dept_code = null;
		Cookie[] cookies = req.getCookies();
		if(cookies!=null && cookies.length>0){
			for(int i =0;i<cookies.length;i++){
				String name = cookies[i].getName();
				if(name.equals("dept_code")){
					dept_code = cookies[i].getValue();
					pMap.put("dept_code", dept_code);
				}
			}
		}
		HttpSession sess = req.getSession();
		hp_code = (String)sess.getAttribute("hp_code");
		pMap.put("hp_code", hp_code);
		List<Map<String,Object>> pList = null;
		
		if(hp_code ==null || dept_code ==null) {
			//로그인 정보가 만료되었습니다.
			mav.IsForward(false);
			mav.setViewName("/fail");
			return mav;
		}
		
		if("patientList".equals(requestName)) {
			pList=mgr_pLogic.patientList(pMap);
			mav.addObject("pList", pList);
			mav.IsForward(true);
			logger.info(pList);
			mav.setViewName("/patient/mgr_patient");
		}else if("patientSEL".equals(requestName)) {	
			pList = mgr_pLogic.patientSEL(pMap);
			mav.addObject("pList", pList);
			mav.IsForward(true);
			if(req.getParameter("isJSON")!=null) {
				mav.setViewName("/patient/patient");
			}else {
				mav.setViewName("/patient/mgr_patient");	
			}
		}else if("patientDetail".equals(requestName)) {
			//멤버 테이블에서 조회
			pList = mgr_pLogic.patientDetail(pMap);
			mav.addObject("pList", pList);
			mav.IsForward(true);
			mav.setViewName("/patient/mgr_patientDetail");
			
		}else if("patientINS".equals(requestName)) {
			int result =-1;
			result = mgr_pLogic.patientINS(pMap);
			mav.cudResult(result);
		}else if("patientUPD".equals(requestName)) {
			int result=-1;
			result = mgr_pLogic.patientUPD(pMap);
			String path = null;
			mav.cudResult(result);
		}else if("patientDEL".equals(requestName)) {
			int result=-1;
			result = mgr_pLogic.patientDEL(pMap);
			String path = null;
			mav.IsForward(false);
			if(result==1) {
				path = "/patient/patientList.mgr?";
			}else {
				path = "/patient/patientDetail.mgr?hp_code="+hp_code+"&mem_code="+req.getParameter("mem_code")+"&";
			}
			mav.setViewName(path);
		}else if("patientDoctor".equals(requestName)) {
			pList = mgr_pLogic.patientDoctor(pMap);
			mav.addObject("pList", pList);
			mav.IsForward(true);
			mav.setViewName("/patient/patient");
			
			
		}else if("patientHISINS".equals(requestName)) {
			int result=-1;
			result = mgr_pLogic.patientHISINS(pMap);
			mav.IsForward(false);
			String path = null;
			if(result==1) {
				path = "/patient/patientDetail.mgr?mem_code="+req.getParameter("mem_code")+"&";
			}else {
				path = "/patient/patientList.mgr?";
			}
			mav.setViewName(path);
		}
		
		
		return mav;
	}

}
