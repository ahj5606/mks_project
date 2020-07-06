package client.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import client.Dao.crm_LoginDao;

public class crm_LoginLogic {

	Logger logger = Logger.getLogger(crm_LoginLogic.class);
	crm_LoginDao lgDao = new crm_LoginDao();
	
	public List<Map<String, Object>> login(Map<String, Object> pMap) {
		logger.info("loginlogic");
		List<Map<String,Object>> login=null;
		login = lgDao.proc_mem_login(pMap);
		return login;
	}
}

