package client.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.pojo.crm_ModelAndView;



public class crm_BoardController implements crm_Controller{
	String requestName= null;
	public crm_BoardController(String requestName){
		this.requestName=requestName;
	}
	
	@Override
	public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res)
					throws IOException, ServletException
			 {
		crm_ModelAndView mav = new crm_ModelAndView();
		if("boardList".equals(requestName)) {
			
		}else if("boardSel".equals(requestName)) {
						
		} else if("boardIns".equals(requestName)) {
						
		} else if("boardUpd".equals(requestName)) {
						
		} else if("boardDel".equals(requestName)) {
						
		}

		return mav;
	}
}

