package manager.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import manager.Dao.mgr_ReserveDao;
import manager.Logic.mgr_ReserveLogic;
import manager.pojo.mgr_ModelAndView;
import mks.util.HashMapBinder;

public class mgr_ReserveController implements mgr_Controller {
	Logger logger = Logger.getLogger(mgr_ReserveController.class);
	String requestName= null;
	mgr_ReserveLogic rlogic = null;
	int tot =0;//페이지네이션
	public mgr_ReserveController(String requestName){
		this.requestName=requestName;
		
		
		//페이지네이션
		rlogic = new mgr_ReserveLogic();
		mgr_ReserveDao mrDao = new mgr_ReserveDao();
		Map<String,Object> pMap = new HashMap<>();
		tot = mrDao.getResTotal(pMap);
		logger.info("tot:"+tot);
	}
	
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView(req, res);
		logger.info("mgrProcess호출 : "+requestName);
		HttpSession session = req.getSession();
		session.setAttribute("s_tot", tot);
		
		if("reserveList".equals(requestName)){		
			logger.info("mgrProcess reserveList호출");
			//예약 메인
			String hp_code = req.getParameter("hp_code");
			logger.info("hp_code :"+hp_code);
			List<Map<String,Object>> dList = null;
			List<Map<String,Object>> rList = null;
			Map<String,Object> pMap = new HashMap<>();
			rList = rlogic.reserveList(pMap);
			dList = rlogic.reserveDEPT(pMap);//진료과 드롭다운에 넣을 것
			mav.addObject("rList", rList);
			mav.addObject("dList", dList);
			mav.IsForward(true);
			logger.info(rList);
			logger.info(dList);
			mav.setViewName("/reserve/mgr_reserve");
			return mav;
		}
		if("reserveSEL".equals(requestName)){
			logger.info("reserveSEL 호출");
			
			Map<String,Object> pMap = new HashMap<>();
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.binder(pMap);
			String dept = null;
			logger.info(dept);
			if(pMap.get("dept_name")!=null) {
				dept=pMap.get("dept_name").toString();
				if(dept.equals("진료과 전체")) {
					pMap.put("dept_name", null);
				}
			}
			logger.info("담당의사 :"+pMap.get("doc_name"));
			logger.info(pMap);
			
			List<Map<String,Object>> rList = null;
			List<Map<String,Object>> dList = null;
			rList = rlogic.reserveSEL(pMap);
			dList = rlogic.reserveDEPT(pMap);//진료과 드롭다운에 넣을 것
				
			
			mav.addObject("rList", rList);
			mav.addObject("dList", dList);
			mav.IsForward(true);
			mav.setViewName("/reserve/mgr_reserve");
			return mav;
			
		}else if("reserveDetail".equals(requestName)){
			//셀을 더블클릭 했을때 -> 상세정보
			String sch_code = req.getParameter("sch_code");
			String mem_memcode = req.getParameter("mem_memcode");
			
			List<Map<String,Object>> rList = null;
			Map<String,Object> pMap = new HashMap<>();
			logger.info("sch_code:"+sch_code);
			if("".equals(req.getParameter("sch_code"))) {
				sch_code=null;
			}
			pMap.put("sch_code",sch_code);
			pMap.put("mem_memcode",mem_memcode);
			rList = rlogic.reserveDetail(pMap);
			
			mav.addObject("rList",rList);
			mav.IsForward(true);
			logger.info(rList);
			mav.setViewName("/reserve/mgr_reserveDetail");

			
			
		}else if("reservePatient".equals(requestName)) {
			String hp_code ="280HP";			
			/* hp_code = req.getParameter("hp_code"); */
			List<Map<String,Object>> rList = null;
			Map<String, Object> pMap = new HashMap();
			pMap.put("hp_code", hp_code);
			rList = rlogic.reservePatient(pMap);
			mav.addObject("rList", rList);
			mav.IsForward(true);
			mav.setViewName("/reserve/reserveJSON");
			
			//위아래 연계됨
		}else if("reserveDoctor".equals(requestName)) {
			String hp_code ="280HP";			
			/* hp_code = req.getParameter("hp_code"); */
			List<Map<String,Object>> rList = null;
			Map<String, Object> pMap = new HashMap();
			pMap.put("hp_code", hp_code);
			rList = rlogic.reserveDoctor(pMap);
			mav.addObject("rList", rList);
			mav.IsForward(true);
			mav.setViewName("/reserve/reserveJSON");
			
			//위아래 연계됨
		}else if("reserveSchedule".equals(requestName)) {
			String hp_code ="280HP";	
			String doc_code =null;
			/* hp_code = req.getParameter("hp_code"); */
			doc_code = req.getParameter("doc_code");
			
			List<Map<String,Object>> rList = null;
			Map<String, Object> pMap = new HashMap();
			pMap.put("hp_code", hp_code);
			pMap.put("doc_code", doc_code);
			rList = rlogic.reserveSchedule(pMap);
			mav.addObject("rList", rList);
			mav.IsForward(true);
			mav.setViewName("/reserve/reserveJSON");
			
			
		}else if("reserveINS".equals(requestName)){
			logger.info("예약 등록 호출 성공");
			//예약 추가할때
			int result = 0;
			Map<String,Object> pMap = new HashMap<>();
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.binder(pMap);
			logger.info("담당의사 :"+pMap.get("doc_name"));
			String res_qrcode="0";
			pMap.put("res_qrcode", res_qrcode);
			result = rlogic.reserveINS(pMap);
			logger.info("result="+result);
			mav.cudResult(result);
			
		}else if("reserveUPD".equals(requestName)){
			//예약 수정
			int result = 0;
			Map<String,Object> pMap = new HashMap<>();
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.binder(pMap);
			logger.info("환자번호 :"+pMap.get("mem_memcode"));
			logger.info("예약번호 :"+pMap.get("sch_code"));
			result = rlogic.reserveUPD(pMap);
			logger.info("result : "+result);
			mav.cudResult(result);			
			
			
	
		}else if("reserveDEL".equals(requestName)){
			//예약 삭제
			int result = 0;
			Map<String,Object> pMap = new HashMap<>();
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.binder(pMap);
			logger.info("환자번호 :"+pMap.get("mem_memcode"));
			logger.info("예약번호 :"+pMap.get("sch_code"));
			result = rlogic.reserveDEL(pMap);
			mav.cudResult(result);
			
		
		}

		return mav;
	}

}
