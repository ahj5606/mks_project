package client.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.pojo.crm_ModelAndView;


public class crm_HealthController implements crm_Controller{
	String requestName= null;
	public crm_HealthController(String requestName){
		this.requestName=requestName;
	}
	
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
					throws IOException, ServletException
			 {
		crm_ModelAndView mav = new crm_ModelAndView();
		if("healthList".equals(requestName)) {
				mav.setViewName("healthList");;
		}else if("healthSel".equals(requestName)) {
						
		} else if("healthIns".equals(requestName)) {
						
		} else if("healthUpd".equals(requestName)) {
						
		} else if("healthDel".equals(requestName)) {
						
		}

		return mav;
	}
}
