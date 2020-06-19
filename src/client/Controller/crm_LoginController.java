package client.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import client.Logic.crm_HospitalLogic;
import client.pojo.crm_ModelAndView;

public class crm_LoginController implements crm_Controller {
		Logger logger = Logger.getLogger(crm_LoginController.class);
		crm_HospitalLogic crm_hpLogic =new crm_HospitalLogic();
		String requestName= null;
		public crm_LoginController(String requestName){
			this.requestName=requestName;
		}
		@Override
		public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
				throws IOException, ServletException {
			crm_ModelAndView mav = new crm_ModelAndView(req,res);
			if("hospitalList".equals(requestName)) { //로그인 요청을 보냇을때 처리 쿠키와 세션도 저장해 주세요 ~~
				String hp_name = req.getParameter("hp_name");
				Map<String,Object> pMap = new HashMap();
				pMap.put("hp_name", hp_name);
				List<Map<String,Object>> hpList= null;
				hpList=crm_hpLogic.hospitalList(pMap);
				logger.info("controller: hpList: "+hpList);
				logger.info(hpList.size());
				mav.addObject("hpList", hpList);
				mav.IsForward(true);
				logger.info("hpList...!!!!");
				mav.setViewName("/login/hospitalList");
			}
			return mav;
		}

	}

