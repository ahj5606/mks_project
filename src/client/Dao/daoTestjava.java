package client.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class daoTestjava {
	Logger logger = Logger.getLogger(crm_BoardDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public daoTestjava() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	
	/**********************************************************************************
	 * 아직 안끝난 것들 ......
	 */
	public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
		logger.info("[crm_BoardDao] boardList 호출성공");
		List<Map<String, Object>> boardList = null;
		boardList = sqlSes.selectList("boardList", pMap);
		return boardList;
	}
	
	public int boardIns(Map<String, Object> pMap) {
		logger.info("[crm_BoardDao] boardIns 호출성공");
		int result = 0;
		result = sqlSes.insert("boardIns", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
	
	public int boardUpd(Map<String, Object> pMap) {
		logger.info("[crm_boardDao] boardUpd 호출성공");
		int result = 0;
		result = sqlSes.update("boardUpd", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
	
	public int boardDel(Map<String, Object> pMap) {
		logger.info("[crm_BoardDao] boardDel 호출성공");
		int result = 0;
		result = sqlSes.delete("boardDel", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
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
	
	
	/************************************************************************************
	 * 처리된 것들 ~~~~~
	 */
	
}
