package client.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import client.Logic.crm_HospitalLogic;
import client.pojo.crm_ModelAndView;


public class crm_HospitalController implements crm_Controller{
	Logger logger = Logger.getLogger(crm_HospitalController.class);
	String requestName= null;
	crm_HospitalLogic crm_hpLogic =new crm_HospitalLogic();
	Map<String,Object> pMap = new HashMap();
	public crm_HospitalController(String requestName){
		this.requestName=requestName;
	}
	
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
					throws IOException, ServletException
			 {
		crm_ModelAndView mav = new crm_ModelAndView(req,res);
		if("hospitalList".equals(requestName)) { //로그인 요청을 보냇을때 처리 쿠키와 세션도 저장해 주세요 ~~
			String hp_name = req.getParameter("hp_name");				
			/* sql ************************************
			 * where rownum between fNum and eNum 
			 */
			List<Map<String,Object>> hpList= null;
			List<Map<String,Object>> nav= null;
			String imsi = req.getParameter("num");
			int end = 0;
			int first = 0;
			pMap.put("hp_name", hp_name);
			if(imsi!=null) {
				int num = Integer.parseInt(imsi);
				if(num==0) {
					nav=crm_hpLogic.hospitalList(pMap);
					logger.info("nav"+nav.size());
					int size=nav.size();
					mav.addObject("size", size);
				}
				else {
					int recodeNum = 5;
					first = (num-1)*recodeNum+1;
					end = num*recodeNum;
					pMap.put("first", first);
					pMap.put("end", end);
					logger.info("first: "+first+", end: "+end);
					hpList=crm_hpLogic.hospitalList(pMap);
					mav.addObject("hpList", hpList);
					logger.info("hospitalcontroller"+hpList.size());
				}
			}
			mav.IsForward(true);
			logger.info("hpList...!!!!");
			mav.setViewName("/hospital/hospitalList");
		}
		else if("categori".equals(requestName)) {
			List<Map<String,Object>> categori= null;
			categori=crm_hpLogic.categori(pMap);
			logger.info("hospitalcontroller"+categori.size());
			mav.addObject("categori", categori);
			mav.IsForward(true);
			logger.info("categori");
			mav.setViewName("/hospital/categori");
		} 
		else if("favoriteIns".equals(requestName)) {
			Map<String, Object> pMap = new HashMap<>();
			String mks_id = req.getParameter("u_mks_id");
			String hp_code = req.getParameter("u_hp_code");
			String hp_name = req.getParameter("u_hp_name");
			logger.info("mks_id: "+mks_id);
			logger.info("hp_code: "+hp_code);
			logger.info("hp_name: "+hp_name);
			pMap.put("u_mks_id", mks_id);
			pMap.put("u_hp_code", hp_code);
			pMap.put("u_hp_name", hp_name);
			String proc_favoriteIns = null;
			proc_favoriteIns = crm_hpLogic.proc_favoriteIns(pMap);
			logger.info("proc_favoriteIns: " + proc_favoriteIns);
			mav.addObject("proc_favoriteIns", proc_favoriteIns);
			mav.IsForward(true);
			mav.setViewName("/hospital/jsonFavoriteIns");
		}
		else if("favoriteList".equals(requestName)) {
			List<Map<String, Object>> favoriteList = null;
			Map<String, Object> pMap = new HashMap<>();
			String mks_id = req.getParameter("mks_id");
			pMap.put("mks_id",mks_id);
			logger.info("mks_id: " + mks_id);
			favoriteList = crm_hpLogic.favoriteList(pMap);
			mav.addObject("favoriteList", favoriteList);
			logger.info("favoriteList 사이즈: " + favoriteList.size());
			mav.IsForward(true);
			mav.setViewName("/hospital/jsonFavoriteList");
		}
		return mav;
		
	}
}
