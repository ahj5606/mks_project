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

import client.Logic.crm_MyPageLogic;
import client.pojo.crm_ModelAndView;

public class crm_MypageController implements crm_Controller{
	Logger logger = Logger.getLogger(crm_HospitalController.class);
	crm_MyPageLogic crm_MyPageLogic=new crm_MyPageLogic();
	Map<String,Object> pMap = new HashMap();
	String requestName= null;
	public crm_MypageController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
					throws IOException, ServletException
			 {
		crm_ModelAndView mav = new crm_ModelAndView(req,res);
		if("mypageList".equals(requestName)) {
		
		}else if("mypagePassword".equals(requestName)) {
		
		} else if("mypageSel".equals(requestName)) {
		
		}else if("mypageUpd".equals(requestName)) {
		
		}else if("proc_mem_Add".equals(requestName)) {
			String u_id = req.getParameter("i_id");
			String u_pw = req.getParameter("i_pw");
			String u_soc = req.getParameter("reg");
			String u_addr = req.getParameter("addr");
			String u_phone = req.getParameter("i_tel");
			String u_name = req.getParameter("i_name");
			String u_email = req.getParameter("i_email");
			
			pMap.put("u_id",u_id);		
			pMap.put("u_pw",u_pw);		
			pMap.put("u_soc",u_soc);		
			pMap.put("u_addr",u_addr);		
			pMap.put("u_phone",u_phone);		
			pMap.put("u_name",u_name);		
			pMap.put("u_email",u_email);		
			String proc_mem_Add= null;
			proc_mem_Add=crm_MyPageLogic.proc_mem_Add(pMap);
			mav.addObject("proc_mem_Add", proc_mem_Add);
			mav.IsForward(true);
			logger.info("mypage proc_mem_Add"+ proc_mem_Add);	
			mav.setViewName("/mypage/proc_mem_Add");
			
		}else if("socialnumCheck".equals(requestName)) {
			String regcheck = req.getParameter("i_reg");
			pMap.put("mem_socialnum",regcheck);		
			String socialnumCheck= null;
			socialnumCheck=crm_MyPageLogic.socialnumCheck(pMap);
			mav.addObject("socialnumCheck", socialnumCheck);
			mav.IsForward(true);
			logger.info("mypage socialnumCheck"+ socialnumCheck);
			mav.setViewName("/mypage/socialnumCheck");
			
		}else if("idCheck".equals(requestName)) {
			String mks_id = req.getParameter("i_id");
			//String test = "test1";
			pMap.put("mks_id",mks_id);		
			String idCheck= null;
			idCheck=crm_MyPageLogic.idCheck(pMap);
			mav.addObject("idCheck", idCheck);
			mav.IsForward(true);
			logger.info("mypage idcheck"+ idCheck);
			mav.setViewName("/mypage/idCheck");
		}
						

		return mav;
	}
}
