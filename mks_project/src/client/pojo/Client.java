package client.pojo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import client.Controller.crm_Controller;
import client.Controller.crm_ControllerMapper;
public class Client extends HttpServlet {
		Logger logger = Logger.getLogger(Client.class);
		//단위테스트를 위해 GET과 POST방식으로 들어오는 것을 Service메소드로 실행할꺼임.
		public void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
			logger.info("doService호출 성공");
			String requestURI = req.getRequestURI();
			String contextPath = req.getContextPath();
			String command = requestURI.substring(contextPath.length()+1);
			int end = command.lastIndexOf(".");
			String imsi = null;
			imsi = command.substring(0,end);
			String commands[] = imsi.split("/");
			crm_Controller controller = null;
			
			if(commands.length==2) {
				controller = crm_ControllerMapper.getController(commands);
				logger.info(controller);
				
			}
			
			if(controller!=null) {
				crm_ModelAndView crm_Mav= null;
				crm_Mav=controller.process(req, res);
				
				if(crm_Mav.getIsForward()) {
					String path = "/WEB-INF/Client"+crm_Mav.getViewName()+".jsp";
					RequestDispatcher view = req.getRequestDispatcher(path);
					view.forward(req, res);
				}else if(!crm_Mav.getIsForward()) {
					String path = contextPath+"/Client"+crm_Mav.getViewName()+".jsp";
					res.sendRedirect(path);
				}			
			}
		}
		@Override
		public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			doService(req,res);
		}
		@Override
		public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			doService(req,res);
		}
		
	}

