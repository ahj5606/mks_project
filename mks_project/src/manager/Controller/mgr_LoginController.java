package manager.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.Dao.mgr_LoginDao;
import manager.pojo.mgr_ModelAndView;

public class mgr_LoginController implements mgr_Controller {
	String requestName= null;
	public mgr_LoginController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		mgr_ModelAndView mav = new mgr_ModelAndView();
		if("login".equals(requestName)) { //로그인 요청을 보냇을때 처리 쿠키와 세션도 저장해 주세요 ~~
		 new mgr_LoginDao().login();
			
			
		}
		return mav;
	}

}
