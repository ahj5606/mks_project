package client.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.pojo.crm_ModelAndView;

public class crm_ReservationController implements crm_Controller {
	String requestName= null;
	public crm_ReservationController(String requestName){
		this.requestName=requestName;
	}
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
					throws IOException, ServletException
			 {
		crm_ModelAndView mav = new crm_ModelAndView();
		if("reservationList".equals(requestName)) {
			
		}else if("noticeSel".equals(requestName)) {
				
		} else if("noticeList".equals(requestName)) {
					
		}else if("watiCheck".equals(requestName)) {
			
		}else if("reservation".equals(requestName)) {
			
		}else if("time.jsp".equals(requestName)) {
			
		}else if("check.jsp".equals(requestName)) {
			
		}
		return mav;
	}
}
