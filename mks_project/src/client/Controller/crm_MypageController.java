package client.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.pojo.crm_ModelAndView;

public class crm_MypageController implements crm_Controller{
	String requestName= null;
	public crm_MypageController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
					throws IOException, ServletException
			 {
		crm_ModelAndView mav = new crm_ModelAndView();
		if("mypageList".equals(requestName)) {
		
		}else if("mypagePassword".equals(requestName)) {
		
		} else if("mypageSel".equals(requestName)) {
		
		}else if("mypageUpd".equals(requestName)) {
		
		}else if("createAccount".equals(requestName)) {
		
		}
						

		return mav;
	}
}
