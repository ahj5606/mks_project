package client.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.pojo.crm_ModelAndView;

public interface crm_Controller {
		public crm_ModelAndView process(HttpServletRequest req, HttpServletResponse res) throws IOException , ServletException;
	
}
