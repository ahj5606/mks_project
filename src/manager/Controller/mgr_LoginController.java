package manager.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import manager.Dao.mgr_LoginDao;
import manager.Logic.mgr_LoginLogic;
import manager.pojo.mgr_ModelAndView;

public class mgr_LoginController implements mgr_Controller {
	String requestName= null;
	Logger logger = Logger.getLogger(mgr_Controller.class);
	public mgr_LoginController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		mgr_ModelAndView mav = new mgr_ModelAndView(req,res);
		
		mgr_LoginLogic mll = new mgr_LoginLogic();
		if("login".equals(requestName)) { //로그인 요청을 보냇을때 처리 쿠키와 세션도 저장해 주세요 ~~
		Map<String, Object> lMap = new HashMap<String, Object>();
		lMap.put("mks_id", id);
		lMap.put("mks_pw", pw);
		
		List<Map<String, Object>> lList = mll.login(lMap);
		logger.info("login=>lList"+lList);
		
		if(lList.size()==0) {
			mav.IsForward(false);
			mav.setViewName("/login/s_login.jsp?msg=1&");
			
		}else if(lList!=null) {
			Cookie hp_name = new Cookie("hp_name", lList.get(0).get("HP_NAME").toString());
			Cookie dept_code = new Cookie("dept_code", lList.get(0).get("DEPT_CODE").toString());
			Cookie dept_name = new Cookie("dept_name", lList.get(0).get("DEPT_NAME").toString());
			hp_name.setPath("/manager");
			dept_code.setPath("/manager");
			dept_name.setPath("/manager");
			res.addCookie(dept_name);
			res.addCookie(dept_code);
			res.addCookie(hp_name);
			HttpSession hp_code = req.getSession();
			hp_code.setAttribute("hp_code", lList.get(0).get("HP_CODE").toString());
			
			mav.IsForward(false);
			mav.setViewName("/notice/s_sidebar");
		}
		
		}
		return mav;
	}

}
