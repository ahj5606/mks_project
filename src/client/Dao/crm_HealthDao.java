package client.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class crm_HealthDao {
	Logger logger = Logger.getLogger(crm_HealthDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public crm_HealthDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public List<Map<String, Object>> healthList(Map<String, Object> pMap) {
		logger.info("[crm_HealthDao] healthList 호출성공");
		List<Map<String, Object>> healthList = null;
		healthList = sqlSes.selectList("healthList", pMap);
		return healthList;
	}
	
//	public List<Map<String, Object>> healthSel(Map<String, Object> pMap) {
//		logger.info("[crm_HealthDao] healthSel 호출성공");
//		return null;
//	}
	
	public int healthIns(Map<String, Object> pMap) {
		logger.info("[crm_HealthDao] healthIns 호출성공");
		int result = 0;
		result = sqlSes.insert("healthIns", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
	
	public int healthUpd(Map<String, Object> pMap) {
		logger.info("[crm_HealthDao] healthUpd 호출성공");
		int result = 0;
		result = sqlSes.update("healthUpd", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
	
	public int healthDel(Map<String, Object> pMap) {
		logger.info("[crm_HealthDao] healthDel 호출성공");
		int result = 0;
		result = sqlSes.delete("healthDel", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
}
