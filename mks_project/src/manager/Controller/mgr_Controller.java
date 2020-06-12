package manager.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.pojo.mgr_ModelAndView;

public interface mgr_Controller {
	public mgr_ModelAndView mgrProcess(HttpServletRequest req, HttpServletResponse res) throws IOException , ServletException;
}
