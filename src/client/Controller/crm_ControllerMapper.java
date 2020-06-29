package client.Controller;

import org.apache.log4j.Logger;

public class crm_ControllerMapper {
	
	static Logger logger = Logger.getLogger(crm_ControllerMapper.class);
	
	public static crm_Controller getController(String[] commands) {
		String work = commands[0];
		String requestName = commands[1];
		logger.info("requestName: "+requestName);
		logger.info("work: "+work);
		crm_Controller controller  =null;
		if("login".equals(work)) {
			controller = new crm_LoginController(requestName);
		}else if("hospital".equals(work)) {
			logger.info("hospital");
			controller = new crm_HospitalController(requestName);
		}else if("mypage".equals(work)) {
			controller = new crm_MypageController(requestName);
		}else if("reservation".equals(work)) {
			controller = new crm_ReservationController(requestName);
		}else if("board".equals(work)) {
			controller = new crm_BoardController(requestName);
		}else if("health".equals(work)) {
			controller = new crm_HealthController(requestName);
		}
		return controller;
	}
}
