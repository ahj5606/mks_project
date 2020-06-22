package manager.Controller;

import org.apache.log4j.Logger;

public class mgr_ControllerMapper {
	public static mgr_Controller getController(String[] commands) {
		Logger logger = Logger.getLogger(mgr_ControllerMapper.class);
		String work = commands[1];
		String requestName = commands[2];
		for(String str:commands) {
			logger.info(str);
		}
		mgr_Controller controller  =null;
		if("login".equals(work)) {
			controller = new mgr_LoginController(requestName);
		}else if("patient".equals(work)) {
			controller = new mgr_PatientController(requestName);
		}else if("doctor".equals(work)) {
			controller = new mgr_DoctorController(requestName);
		}else if("wating".equals(work)) {
			controller = new mgr_WatingController(requestName);
		}else if("notice".equals(work)) {
			controller = new mgr_NoticeController(requestName);
		}else if("reserve".equals(work)) {
			controller = new mgr_ReserveController(requestName);
		}
		
		
		
		
		return controller;
	}

}
