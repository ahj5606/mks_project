package client.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import client.Dao.crm_LoginDao;



public class crm_LoginLogic {
		Logger logger = Logger.getLogger(crm_LoginLogic.class);
		crm_LoginDao lgDao = new crm_LoginDao();
		public String login(Map<String, Object> pMap) {
			String s_name = lgDao.login(pMap);
			return s_name;
		}
	}
}
