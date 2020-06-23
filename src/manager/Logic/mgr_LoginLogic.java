package manager.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import manager.Dao.mgr_LoginDao;

public class mgr_LoginLogic {
	Logger logger = Logger.getLogger(mgr_LoginLogic.class);
	mgr_LoginDao mld = new mgr_LoginDao();
	public List<Map<String, Object>> login(Map<String, Object> lMap) {
		List<Map<String, Object>> lList = null;
		lList = mld.login(lMap);
		logger.info(lList); 
		return lList;
	}
}
