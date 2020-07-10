package client.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import client.Logic.crm_ReservationLogic;
import client.pojo.crm_ModelAndView;

public class crm_ReservationController implements crm_Controller {

	String requestName= null;
	Logger logger = Logger.getLogger(crm_HospitalController.class);
	crm_ReservationLogic crm_rsLogic =new crm_ReservationLogic();
	
	public crm_ReservationController(String requestName){
		this.requestName=requestName;
	}
	
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		crm_ModelAndView mav = new crm_ModelAndView(req,res);
		if("proc_reservelist".equals(requestName)) {
			List<Map<String,Object>> proc_reservelist= null;
			Map<String,Object> pMap = new HashMap<>();
			List<Map<String,Object>> nav= null;
			String hp_code = req.getParameter("hp_code");	//화면에서 넣은값		
			String dept_name = req.getParameter("dept_name");
			String imsi = req.getParameter("num");
			String doc_name = req.getParameter("doc_name");
			logger.info("hp_code: "+hp_code);
			logger.info("dept_name: "+dept_name);
			logger.info("imsi: "+imsi);
			logger.info("doc_name: "+doc_name);
			pMap.put("u_hp_code",hp_code);
			if(dept_name!=null&&dept_name.length()>0&&!"null".equals(dept_name)) {
				pMap.put("u_dept_name",dept_name);
			}
			if(doc_name!=null&&doc_name.length()>0) {
				pMap.put("u_doc_name",doc_name);
			}
			int first = 0;
			int end = 0;
			if(imsi!=null) {				
				int num = Integer.parseInt(imsi);
				if(num==0) {
					nav=crm_rsLogic.proc_reservelist(pMap);
					logger.info("nav"+nav.size());
					int size=nav.size();
					mav.addObject("size", size);
				}else {
					int recodeNum = 5;
					first = (num-1)*recodeNum+1;
					end = num*recodeNum;
					pMap.put("fnum", first);
					pMap.put("enum", end);
					logger.info("first: "+first+", end: "+end);
					proc_reservelist=crm_rsLogic.proc_reservelist(pMap);
					mav.addObject("proc_reservelist",proc_reservelist);
					logger.info("reservation controller"+proc_reservelist.size());
				}
			}
			mav.IsForward(true);
			logger.info("proc_reservelist...!!!!");
			logger.info(proc_reservelist);
			mav.setViewName("/reservation/proc_reservelist");
			
		}
		else if("deptCategory".equals(requestName)) {
			List<Map<String,Object>> deptCategory= null;
			Map<String,Object> pMap = new HashMap<>();
			String hp_code = req.getParameter("hp_code");
			pMap.put("hp_code", hp_code);
			deptCategory=crm_rsLogic.deptCategory(pMap);
			logger.info("hospitalcontroller"+deptCategory.size());
			mav.addObject("deptCategory", deptCategory);
			mav.IsForward(true);
			logger.info("deptCategory");
			mav.setViewName("/reservation/deptCategory");
			
		}
		else if("docCategory".equals(requestName)) {
			List<Map<String,Object>> docCategory= null;
			Map<String,Object> pMap = new HashMap<>();
			String hp_code = req.getParameter("hp_code");
			String dept_code = req.getParameter("dept_code");
			String doc_code = req.getParameter("doc_code");
			if("null".equals(dept_code)) {
				pMap.put("dept_code", null);
			}else {
				pMap.put("dept_code", dept_code);
			}
			if("null".equals(doc_code)) {
				pMap.put("doc_code", null);
			}else {
				pMap.put("doc_code", doc_code);
			}
			pMap.put("hp_code", hp_code);
			docCategory=crm_rsLogic.docCategory(pMap);
			logger.info("hospitalcontroller"+docCategory.size());
			mav.addObject("docCategory", docCategory);
			mav.IsForward(true);
			logger.info("docCategory");
			mav.setViewName("/reservation/docCategory");
		}
		else if("pro_reservation".equals(requestName)) {
			Map<String,Object> pMap = new HashMap<>();
			HttpSession session = req.getSession();
			String mks_id = (String)session.getAttribute("mks_id");//?	
			String res_memo = req.getParameter("res_memo");
			String sch_code = req.getParameter("sch_code");
			String res_time = req.getParameter("res_time");
			pMap.put("res_memo",res_memo);		
			pMap.put("mks_id",mks_id);				
			pMap.put("sch_code",sch_code);		
			pMap.put("res_time",res_time);	
			logger.info("res_memo: "+res_memo);	
			logger.info("mks_id: "+mks_id);	
			logger.info("sch_code: "+sch_code);	
			logger.info("res_time: "+res_time);	
			int pro_reservation= 0;
			pro_reservation=crm_rsLogic.pro_reservation(pMap);
			mav.addObject("pro_reservation", pro_reservation);
			mav.IsForward(true);
			logger.info("pro_reservation"+ pro_reservation);	
			mav.setViewName("/reservation/pro_reservation");
		}
		else if("calender".equals(requestName)) {
			List<Map<String,Object>> calender= null;
			Map<String,Object> pMap = new HashMap<>();
		    String hp_code = req.getParameter("hp_code");
			String dept_code = req.getParameter("dept_code");
			String sch_date = req.getParameter("sch_date");
			String doc_code = req.getParameter("doc_code");
			String mode = req.getParameter("mode");
			String sch_code = req.getParameter("sch_code");
			logger.info("hp_code: "+hp_code);
			logger.info("dept_code: "+dept_code);
			logger.info("doc_code: "+doc_code);
			logger.info("sch_date: "+sch_date);
				if("null".equals(dept_code)) {
					dept_code = "";
				}
				if("null".equals(doc_code)) {
					doc_code = "";
				}
				if("null".equals(sch_date)) {
					sch_date = "";
				}
				pMap.put("hp_code",hp_code);
				pMap.put("dept_code",dept_code);
				pMap.put("doc_code",doc_code);
				pMap.put("sch_date", sch_date);
				
			calender=crm_rsLogic.calender(pMap);
			logger.info("reservationcontroller"+calender.size());
			if(mode!=null) {
				mav.addObject("calender1", calender);
			}else {
				mav.addObject("calender", calender);
			}
			mav.IsForward(true);
			logger.info("calender");
			mav.setViewName("/reservation/calender");
			
		}
		else if("docSel".equals(requestName)) {
			Map<String,Object> pMap = new HashMap<>();
			List<Map<String,Object>> docSel= null;
			String doc_code = req.getParameter("doc_code");
			pMap.put("doc_code", doc_code);
			docSel=crm_rsLogic.docSel(pMap);
			logger.info("reservationcontroller"+docSel.size());
			mav.addObject("docSel", docSel);
			mav.IsForward(true);
			logger.info("docSel");
			mav.setViewName("/reservation/docSel");
		}
		else if("waitCheck".equals(requestName)) {
			Map<String,Object> pMap = new HashMap<>();
	         List<Map<String,Object>> waitCheck= null;
	         String hp_code = req.getParameter("hp_code");
	         pMap.put("hp_code", hp_code);
	         pMap.put("dept_name", "원무과");
	         waitCheck=crm_rsLogic.waitCheck(pMap);
	         logger.info("reservationcontroller"+waitCheck.size());
	         mav.addObject("waitCheck", waitCheck);
	         mav.IsForward(true);
	         logger.info("waitCheck");
	         mav.setViewName("/reservation/waitCheck");
		}      
		else if("waitReset".equals(requestName)) {
	         Map<String, Object> pMap = new HashMap<>();
	         String hp_code = req.getParameter("hp_code");
	         pMap.put("hp_code", hp_code);
	         pMap.put("dept_name", "원무과");
	         int result = 0;
	         result = crm_rsLogic.waitReset(pMap);
	         logger.info("result: " + result);
	         mav.addObject("result", result);
	         mav.IsForward(true);
	         mav.setViewName("/reservation/jsonWaitReset");
	      }
	      else if("waitUpd".equals(requestName)) {
	         Map<String, Object> pMap = new HashMap<>();
	         String hp_code = req.getParameter("hp_code");
	         pMap.put("hp_code", hp_code);
	         pMap.put("dept_name", "원무과");
	         int result = 0;
	         result = crm_rsLogic.waitUpd(pMap);
	         logger.info("result: " + result);
	         mav.addObject("result", result);
	         mav.IsForward(true);
	         mav.setViewName("/reservation/jsonWaitUpd");
	      }
		return mav;
	}
}

