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
			Map<String, Object> pMap = new HashMap<String, Object>();
			List<Map<String, Object>> mypageList = null;
			String mks_id = req.getParameter("mks_id");
			String num_str = req.getParameter("num");
			String doc_name = req.getParameter("doc_name");
			String sch_code = req.getParameter("sch_code");
			String mode = req.getParameter("mode");
			pMap.put("mks_id", mks_id);
			pMap.put("doc_name", doc_name);
			pMap.put("sch_code", sch_code);
			logger.info("mks_id: "+mks_id);
			logger.info("doc_name: "+doc_name);
			String now_str = req.getParameter("now");
			String pre_str = req.getParameter("pre");
			if(now_str!=null) {
				int now = Integer.parseInt(now_str);
				if(now%2==1) {//홀수일때 == 선택
					pMap.put("now", now);
				}
			}
			if(pre_str!=null) {
				int pre = Integer.parseInt(pre_str);
				if(pre%2==1) {//홀수일때 == 선택
					pMap.put("pre", pre);
				}
			}
			int first = 0;
			int end = 0;
			if(num_str!=null) {
				int num = Integer.parseInt(num_str);
				int recodeNum = 5;
				if(mode!=null) {
					recodeNum = 1;
				}
				if(num!=0){//페이지네이션 적용
					first = (num-1)*recodeNum+1;
					end = num*recodeNum;
					pMap.put("fnum", first);
					pMap.put("enum", end);
					logger.info("fnum: "+first+", enum: "+end);
					mypageList = crm_MyPageLogic.mypageList(pMap);
					mav.addObject("mList", mypageList);
				}else {// num==0 사이즈를 저장!!
					logger.info("num==0");
					mypageList = crm_MyPageLogic.mypageList(pMap);
					mav.addObject("mList_size", mypageList.size());
				}
			}
			mav.setViewName("/myPage/jsonMypageList");
			mav.IsForward(true);
	    } else if("mypageSel".equals(requestName)) {
			Map<String, Object> pMap = new HashMap<String, Object>();
			String mks_id = req.getParameter("mks_id");
			pMap.put("mks_id", mks_id);
			logger.info("mks_id: "+mks_id);
			//2) Logic 메소드 호출
			List<Map<String, Object>> mypageSel = null;
			mypageSel = crm_MyPageLogic.mypageSel(pMap);
			logger.info("mypageSel: "+mypageSel.size());
			//3) ModelAndView 셋팅
			mav.addObject("mypageSel", mypageSel);
			mav.setViewName("/myPage/jsonMypageSel");
			mav.IsForward(true);
		} else if("mypagePassword".equals(requestName)) {
			Map<String, Object> pMap = new HashMap<String, Object>();
			String mks_pw = req.getParameter("mks_pw");
			String mks_id = req.getParameter("mks_id");
			pMap.put("mks_pw", mks_pw);
			pMap.put("mks_id", mks_id);
			logger.info("mks_pw: "+mks_pw);
			logger.info("mks_id: "+mks_id);
			//2) Logic 메소드 호출
			int result = 0;
			result = crm_MyPageLogic.mypagePassword(pMap);
			logger.info("result: "+result);
			//3) ModelAndView 셋팅
			mav.addObject("result", result);
			mav.setViewName("/myPage/jsonMypageResult");
			mav.IsForward(true);	
		} else if("mypageUpd".equals(requestName)) {
			//1) pMap 셋팅
			Map<String, Object> pMap = new HashMap<String, Object>();
			String mem_address = req.getParameter("mem_address");
			String mem_phone = req.getParameter("mem_phone");
			String mks_pw = req.getParameter("mks_pw");
			String mks_id = req.getParameter("mks_id");
			String mks_email = req.getParameter("mks_email");
			pMap.put("mem_address", mem_address);
			pMap.put("mem_phone", mem_phone);
			pMap.put("mks_pw", mks_pw);
			pMap.put("mks_id", mks_id);
			pMap.put("mks_email", mks_email);
			logger.info("mem_address: "+mem_address);
			logger.info("mem_phone: "+mem_phone);
			logger.info("mks_pw: "+mks_pw);
			logger.info("mks_id: "+mks_id);
			logger.info("mks_email: "+mks_email);
			//2) Logic 메소드 호출
			int result = 0;
			result = crm_MyPageLogic.mypageUpd(pMap);
			logger.info("result: "+result);
			//3) ModelAndView 셋팅
			mav.addObject("result", result);
			mav.setViewName("/myPage/jsonMypageResult");
			mav.IsForward(true);			
		}else if("proc_mem_Add".equals(requestName)) {
			Map<String, Object> pMap = new HashMap<String, Object>();
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
			Map<String,Object> pMap = new HashMap();
			String regcheck = req.getParameter("i_reg");
			pMap.put("mem_socialnum",regcheck);		
			String socialnumCheck= null;
			socialnumCheck=crm_MyPageLogic.socialnumCheck(pMap);
			mav.addObject("socialnumCheck", socialnumCheck);
			mav.IsForward(true);
			logger.info("mypage socialnumCheck"+ socialnumCheck);
			mav.setViewName("/mypage/socialnumCheck");
			
		}else if("idCheck".equals(requestName)) {
			Map<String,Object> pMap = new HashMap();
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
