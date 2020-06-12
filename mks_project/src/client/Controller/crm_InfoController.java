package client.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.pojo.crm_ModelAndView;

public class crm_InfoController implements crm_Controller{
	String requestName= null;
	public crm_InfoController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
					throws IOException, ServletException
			 {
		crm_ModelAndView mav = new crm_ModelAndView();
		if("introduce".equals(requestName)) {
			
		}else if("memService".equals(requestName)) {
						
		} else if("nonmemService".equals(requestName)) {
						
		}
						

		return mav;
	}
}
