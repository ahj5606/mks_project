package manager.Controller;

public class mgr_ControllerMapper {

	public static mgr_Controller getController(String[] commands) {
		String work = commands[0];
		String requestName = commands[1];
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
