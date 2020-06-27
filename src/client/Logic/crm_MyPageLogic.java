package client.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import client.Dao.crm_MypageDao;



public class crm_MyPageLogic {
		Logger logger = Logger.getLogger(crm_MyPageLogic.class);
		crm_MypageDao mgDao = new crm_MypageDao();
		
		public String idCheck(Map<String, Object> pMap) {
			logger.info("idCheck");
			String idCheck=null;
			idCheck = mgDao.idCheck(pMap);
			return idCheck;
		}
		
		public String socialnumCheck(Map<String, Object> pMap) {
			logger.info("socialnumCheck");
			String  socialnumCheck=null;
			socialnumCheck = mgDao.socialnumCheck(pMap);
			return socialnumCheck;
		}
		
		
		public String proc_mem_Add(Map<String, Object> pMap) {
			logger.info("proc_mem_Add");
			String proc_mem_Add=null;
			proc_mem_Add = mgDao.proc_mem_Add(pMap);
			return proc_mem_Add;
		}
	
}
