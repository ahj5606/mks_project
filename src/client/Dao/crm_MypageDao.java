package client.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class crm_MypageDao {
	Logger logger = Logger.getLogger(crm_MypageDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public crm_MypageDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public List<Map<String, Object>> mypageList(Map<String, Object> pMap) {
		logger.info("[crm_MypageDao] mypageList 호출성공");
		List<Map<String, Object>> mypageList = null;
		mypageList = sqlSes.selectList("mypageList", pMap);
		return mypageList;
	}
		
	public List<Map<String, Object>> mypagePassword(Map<String, Object> pMap) {
		logger.info("[crm_MypageDao] mypagePassword 호출성공");
		List<Map<String, Object>> mypagePassword = null;
		mypagePassword = sqlSes.selectList("mypagePassword", pMap);
		return mypagePassword;
	}
	
//	public List<Map<String, Object>> boardSel(Map<String, Object> pMap) {
//		logger.info("[crm_BoardDao] boardSel 호출성공");
//		return null;
//	}
	
	public int mypageUpd(Map<String, Object> pMap) {
		logger.info("[crm_MypageDao] mypageUpd 호출성공");
		int result = 0;
		result = sqlSes.update("mypageUpd", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
	
	public int createAccount(Map<String, Object> pMap) {
		logger.info("[crm_MypageDao] createAccount 호출성공");
		int result = 0;
		result = sqlSes.delete("createAccount", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
}