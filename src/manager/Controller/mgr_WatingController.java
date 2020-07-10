package manager.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import manager.Logic.mgr_WatingLogic;
import manager.pojo.mgr_ModelAndView;

public class mgr_WatingController implements mgr_Controller {
	Logger logger =Logger.getLogger(mgr_WatingController.class);
	String requestName= null;
	mgr_WatingLogic wlogic = new mgr_WatingLogic();
	public mgr_WatingController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView(req,res);
		if("rewait".equals(requestName)) {
			logger.info("rewait 호출");
			int result =-1;
			Map<String,Object> pMap = new HashMap<String, Object>();
			pMap.put("hp_code", req.getParameter("hp_code"));
			result=wlogic.rewait(pMap);
				mav.IsForward(false);
				mav.setViewName("/success");
		}else if("nextwait".equals(requestName)) {
			logger.info("nextwait 호출");
			int result =-1;
			Map<String,Object> pMap = new HashMap<String, Object>();
			pMap.put("hp_code", req.getParameter("hp_code"));
			result=wlogic.nextwait(pMap);
				mav.IsForward(false);
				mav.setViewName("/success");
			
		}
		else if("prewait".equals(requestName)) {
			logger.info("prewait 호출");
			List<Map<String, Object>> wList = null;
			Map<String,Object> pMap = new HashMap<String, Object>();
			pMap.put("hp_code", req.getParameter("hp_code"));
			wList=wlogic.prewait(pMap);
			mav.IsForward(true);
			mav.addObject("wList", wList);
			logger.info(wList);
			mav.setViewName("/wait");
			
		}
		return mav;
	}

}
