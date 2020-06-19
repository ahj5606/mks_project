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
	public crm_HospitalController(String requestName){
		this.requestName=requestName;
	}
	
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
					throws IOException, ServletException
			 {
		crm_ModelAndView mav = new crm_ModelAndView(req,res);
		if("hospitalList".equals(requestName)) {
			logger.info("hospitalList");
			String hp_name = req.getParameter("hp_name");
			Map<String,Object> pMap = new HashMap();
			pMap.put("hp_name", hp_name);
			List<Map<String,Object>> hpList= null;
			hpList=crm_hpLogic.hospialList(pMap);
			logger.info("controller: hpList: "+hpList);
			logger.info(hpList.size());
			mav.addObject("hpList", hpList);
			mav.IsForward(true);
			logger.info("hpList...!!!!");
			mav.setViewName("/login/hospitalList");
		}else if("hospitalSel".equals(requestName)) {
			
		} else if("hospitalIns".equals(requestName)) {
		
		} else if("hospitalUpd".equals(requestName)) {
			
		} else if("hospitalDel".equals(requestName)) {

		} else if("mapSel".equals(requestName)) {

		}

		return mav;
	}
}
