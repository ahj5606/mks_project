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

import client.Dao.crm_HospitalDao;
import client.Logic.crm_LoginLogic;
import client.Logic.crm_HospitalLogic;
import client.pojo.crm_ModelAndView;

public class crm_LoginController implements crm_Controller {
	
		Logger logger = Logger.getLogger(crm_LoginController.class);
		crm_HospitalLogic crm_hpLogic =new crm_HospitalLogic();
		crm_LoginLogic crm_LoginLogic =new crm_LoginLogic();
		String requestName= null;
	
		public crm_LoginController(String requestName){
			this.requestName=requestName;
		}
		
		@Override
		public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
			crm_ModelAndView mav = new crm_ModelAndView(req,res);
			if("hospitalList".equals(requestName)) { 
				Map<String,Object> pMap = new HashMap();
				String hp_name = req.getParameter("hp_name");				
				String imsi = req.getParameter("num");
				int first = 0;
				int end = 0;
				if(imsi!=null) {
					int num = Integer.parseInt(imsi);
					int recodeNum = 5;
					first = (num-1)*recodeNum+1;
					end = num*recodeNum;
					pMap.put("first", first);
					pMap.put("end", end);
					logger.info("first: "+first+", end: "+end);
				}
				pMap.put("hp_name", hp_name);
				List<Map<String,Object>> hpList= null;
				hpList=crm_hpLogic.hospitalList(pMap);
				logger.info("logincontroller"+hpList.size());
				mav.addObject("hpList", hpList);
				mav.IsForward(true);
				logger.info("hpList...!!!!");
				mav.setViewName("/login/hospitalList");
			}else if("login".equals(requestName)) {
				HttpSession session = req.getSession();
				String u_id = req.getParameter("u_id");
				String u_pw = req.getParameter("u_pw");	
				Map<String, Object> pMap = new HashMap<String, Object>();
				pMap.put("u_id", u_id);
				pMap.put("u_pw", u_pw);
				List<Map<String, Object>> list = crm_LoginLogic.login(pMap);
				String mem_name = null;
			    mem_name = list.get(0).get("msg").toString();
			    if(mem_name!=null&&"아이디 또는 비밀번호가 틀립니다.".equals(mem_name)) {
			    	session.setAttribute("msg", mem_name);
			    }else {
			    	session.setAttribute("mem_name", mem_name);
			    }
				String mks_id = list.get(0).get("u_id").toString();
				session.setAttribute("mks_id", mks_id);
				mav.IsForward(true);
				logger.info("login...!!!!");
				mav.setViewName("/login/loginpro");
			}
			return mav;
		}
	}

