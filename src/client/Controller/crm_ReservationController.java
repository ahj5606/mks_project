package client.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import client.Logic.crm_ReservationLogic;
import client.pojo.crm_ModelAndView;

public class crm_ReservationController implements crm_Controller {
	String requestName= null;
	Logger logger = Logger.getLogger(crm_HospitalController.class);
	 crm_ReservationLogic crm_rsLogic =new crm_ReservationLogic();
	Map<String,Object> pMap = new HashMap();
	public crm_ReservationController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
					throws IOException, ServletException
			 {
		crm_ModelAndView mav = new crm_ModelAndView(req,res);
		if("proc_reservelist".equals(requestName)) {
			String hp_code = req.getParameter("hp_code");	//화면에서 넣은값		
			String dept_name = req.getParameter("dept_name");
			//String imsi = req.getParameter("num");
			//String imsi = req.getParameter("num");
			//String imsi = req.getParameter("num");
			pMap.put("u_hp_code","647HP");
			pMap.put("u_dept_name","dept_name");
			pMap.put("u_doc_name","조하윤");
			pMap.put("fnum",1);
			pMap.put("enum",5);
			int first = 0;
			int end = 0;
		//	if(imsi!=null) {
		//		int num = Integer.parseInt(imsi);
		//		int recodeNum = 5;
		//		first = (num-1)*recodeNum+1;
		//		end = num*recodeNum;
		//		pMap.put("first", first);
		//		pMap.put("end", end);
		//		logger.info("first: "+first+", end: "+end);
		//	}
			List<Map<String,Object>> proc_reservelist= null;
			proc_reservelist=crm_rsLogic.proc_reservelist(pMap);
			logger.info("reservation controller"+proc_reservelist.size());
			mav.addObject("proc_reservelist",proc_reservelist);
			mav.IsForward(true);
			logger.info("proc_reservelist...!!!!");
			logger.info(proc_reservelist);
			mav.setViewName("/reservation/proc_reservelist");
		}else if("noticeSel".equals(requestName)) {
				
		} else if("noticeList".equals(requestName)) {
					
		}else if("watiCheck".equals(requestName)) {
			
		}else if("reservation".equals(requestName)) {
			
		}else if("time".equals(requestName)) {
			
		}else if("check".equals(requestName)) {
			
		}else if("docSel".equals(requestName)) {
			
		}
		return mav;
	}
}
