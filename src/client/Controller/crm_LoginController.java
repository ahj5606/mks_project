package client.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.pojo.crm_ModelAndView;

public class crm_LoginController implements crm_Controller {
		String requestName= null;
		public crm_LoginController(String requestName){
			this.requestName=requestName;
		}
		@Override
		public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
				throws IOException, ServletException {
			crm_ModelAndView mav = new crm_ModelAndView();
			if("login".equals(requestName)) { //로그인 요청을 보냇을때 처리 쿠키와 세션도 저장해 주세요 ~~
				int result=0;//받아온값			
				mav.cudResult(1);	
			}
			return mav;
		}

	}

