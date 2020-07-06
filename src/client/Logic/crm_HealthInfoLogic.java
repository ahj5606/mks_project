package client.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import client.Dao.crm_HealthDao;
import client.Dao.crm_HospitalDao;

public class crm_HealthInfoLogic {
	
	Logger logger = Logger.getLogger(crm_HealthInfoLogic.class);
	crm_HealthDao crm_hDao = new crm_HealthDao();
	
	public List<Map<String, Object>> healthList(Map<String, Object> pMap) {
		logger.info("[crm_HealthInfoLogic] healthList 호출성공");
		List<Map<String, Object>> healthList = null;
		healthList = crm_hDao.healthList(pMap);
		return healthList;
	}
	
	public int healthIns(Map<String, Object> pMap) {
		logger.info("[crm_HealthInfoLogic] healthIns 호출성공");
		int result = 0;
		result = crm_hDao.healthIns(pMap);
		return result;
	}
	
	public int healthUpd(Map<String, Object> pMap) {
		logger.info("[crm_HealthInfoLogic] healthUpd 호출성공");
		int result = 0;
		result = crm_hDao.healthUpd(pMap);
		return result;
	}
	
	public int healthHit(Map<String, Object> pMap) {
		logger.info("[crm_HealthInfoLogic] healthHit 호출성공");
		int result = 0;
		result = crm_hDao.healthHit(pMap);
		return result;
	}
	
	public int healthLike(Map<String, Object> pMap) {
		logger.info("[crm_HealthInfoLogic] healthLike 호출성공");
		int result = 0;
		result = crm_hDao.healthLike(pMap);
		return result;
	}
	
	public int healthDel(Map<String, Object> pMap) {
		logger.info("[crm_HealthInfoLogic] healthDel 호출성공");
		int result = 0;
		result = crm_hDao.healthDel(pMap);
		return result;
	}

}

