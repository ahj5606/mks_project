package client.Controller;



public class crm_ControllerMapper {
	public static crm_Controller getController(String[] commands) {
		String work = commands[0];
		String requestName = commands[1];
		crm_Controller controller  =null;
		if("login".equals(work)) {
			controller = new crm_LoginController(requestName);
		}else if("hospital".equals(work)) {
			controller = new crm_HospitalController(requestName);
		}else if("info".equals(work)) {
			controller = new crm_InfoController(requestName);
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
