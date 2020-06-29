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
			List<Map<String,Object>> proc_reservelist= null;
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
		}else if("deptCategory".equals(requestName)) {
			List<Map<String,Object>> deptCategory= null;
			String hp_code = req.getParameter("hp_code");
			pMap.put("hp_code", hp_code);
			deptCategory=crm_rsLogic.deptCategory(pMap);
			logger.info("hospitalcontroller"+deptCategory.size());
			mav.addObject("deptCategory", deptCategory);
			mav.IsForward(true);
			logger.info("deptCategory");
			mav.setViewName("/reservation/deptCategory");
		}else if("docCategory".equals(requestName)) {
			List<Map<String,Object>> docCategory= null;
			String hp_code = req.getParameter("hp_code");
			String dept_code = req.getParameter("dept_code");
			pMap.put("hp_code", hp_code);
			pMap.put("dept_code", dept_code);
			docCategory=crm_rsLogic.docCategory(pMap);
			logger.info("hospitalcontroller"+docCategory.size());
			mav.addObject("docCategory", docCategory);
			mav.IsForward(true);
			logger.info("docCategory");
			mav.setViewName("/reservation/docCategory");
		}else if("noticeSel".equals(requestName)) {
				
		} else if("noticeList".equals(requestName)) {
					
		}else if("watiCheck".equals(requestName)) {
			
		}else if("reservation".equals(requestName)) {
			
		}else if("time".equals(requestName)) {
			
		}else if("check".equals(requestName)) {
			
		}else if("docSel".equals(requestName)) {
			List<Map<String,Object>> docSel= null;
			String doc_code = req.getParameter("doc_code");
			pMap.put("doc_code", doc_code);
			docSel=crm_rsLogic.docCategory(pMap);
			logger.info("hospitalcontroller"+docSel.size());
			mav.addObject("docSel", docSel);
			mav.IsForward(true);
			logger.info("docSel");
			mav.setViewName("/reservation/docSel");
		}
		return mav;
	}
}
