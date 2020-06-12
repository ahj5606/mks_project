package client.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.pojo.crm_ModelAndView;

public class crm_HospitalController implements crm_Controller{
	String requestName= null;
	public crm_HospitalController(String requestName){
		this.requestName=requestName;
	}
	
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
					throws IOException, ServletException
			 {
		crm_ModelAndView mav = new crm_ModelAndView();
		if("hospitalList".equals(requestName)) {
			
		}else if("hospitalSel".equals(requestName)) {
			
		} else if("hospitalIns".equals(requestName)) {
		
		} else if("hospitalUpd".equals(requestName)) {
			
		} else if("hospitalDel".equals(requestName)) {

		} else if("mapSel".equals(requestName)) {

		}

		return mav;
	}
}
