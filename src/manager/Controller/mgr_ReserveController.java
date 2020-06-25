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
			List<Map<String,Object>> rList = null;
			Map<String,Object> pMap = new HashMap<>();
			rList = rlogic.reserveList(pMap);
			
			mav.addObject("rList", rList);
			mav.IsForward(true);
			logger.info(rList);
			mav.setViewName("/reserve/mgr_reserve");
			return mav;
		}
		if("reserveSEL".equals(requestName)){
			String hp_code ="647HP";
			
			
			String mem_name = req.getParameter("mem_name");
			String doc_name = req.getParameter("doc_name");
			
			logger.info(mem_name+", "+doc_name);
			
			List<Map<String,Object>> rList = null;
			Map<String, Object> pMap = new HashMap<>();
			if("".equals(req.getParameter("mem_name"))) {
				mem_name=null;
			}
			if("".equals(req.getParameter("doc_name"))) {
				doc_name=null;
			}
				pMap.put("mem_name", mem_name);
				pMap.put("doc_name", doc_name);
				rList = rlogic.reserveSEL(pMap);
				
			
			
			
			mav.addObject("rList", rList);
			mav.IsForward(true);
			mav.setViewName("/reserve/mgr_reserve");
			return mav;
			
		}else if("reserveDetail".equals(requestName)){
			//셀을 더블클릭 했을때 -> 상세정보
			String sch_code = req.getParameter("sch_code");
			
			List<Map<String,Object>> rList = null;
			Map<String,Object> pMap = new HashMap<>();
			logger.info("sch_code:"+sch_code);
			if("".equals(req.getParameter("sch_code"))) {
				sch_code=null;
			}
			pMap.put("sch_code",sch_code);
			rList = rlogic.reserveDetail(pMap);
			
			mav.addObject("rList",rList);
			mav.IsForward(true);
			logger.info(rList);
			mav.setViewName("/reserve/mgr_reserveDetail");

			
		}else if("reserveDEPT".equals(requestName)){
			//진료과 선택
			List<Map<String,Object>> rList = null;
			Map<String,Object> pMap = new HashMap<>();
			rList = rlogic.reserveDEPT(pMap);
			
			
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
			//예약 추가할때
			List<Map<String,Object>> rList = null;
			Map<String,Object> pMap = new HashMap<>();
			rList = rlogic.reserveINS(pMap);
			
			
		}else if("updateView".equals(requestName)){
			//예약 추가할때->업데이트
			List<Map<String,Object>> rList = null;
			Map<String,Object> pMap = new HashMap<>();
			//예약번호 조회
			pMap.put("_no",req.getParameter("_no"));
			rList = rlogic.reserveList(pMap);
			req.setAttribute("updateView",rList);
			
			
			
		}else if("reserveUPD".equals(requestName)){
			//예약 추가할때
			int result = 0;
			Map<String,Object> pMap = new HashMap<>();
			result = rlogic.reserveUPD(pMap);
		
			
			
			
			
	
		}else if("reserveDEL".equals(requestName)){
			//예약 추가할때
			int result = 0;
			Map<String,Object> pMap = new HashMap<>();
			pMap.put("sch_code",req.getParameter("sch_code"));//삭제할때 비교조회할 PK키
			result = rlogic.reserveDEL(pMap);
		
			
		
		}

		return mav;
	}

}
