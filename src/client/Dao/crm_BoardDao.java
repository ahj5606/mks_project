package client.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class crm_BoardDao {
	
	Logger logger = Logger.getLogger(crm_BoardDao.class);
	
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public crm_BoardDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
		logger.info("[crm_BoardDao] boardList 호출성공");
		List<Map<String, Object>> boardList = null;
		boardList = sqlSes.selectList("boardList", pMap);
		return boardList;
	}
	
	public List<Map<String, Object>> boardResList(Map<String, Object> pMap) {
		logger.info("[crm_BoardDao] boardResList 호출성공");
		List<Map<String, Object>> boardResList = null;
		boardResList = sqlSes.selectList("boardResList", pMap);
		return boardResList;
	}
	
	public List<Map<String, Object>> boardReplyList(Map<String, Object> pMap) {
		logger.info("[crm_BoardDao] boardReplyList 호출성공");
		List<Map<String, Object>> boardReplyList = null;
		boardReplyList = sqlSes.selectList("boardReplyList", pMap);
		return boardReplyList;
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
	
	public int boardHit(Map<String, Object> pMap) {
		logger.info("[crm_boardDao] boardHit 호출성공");
		int result = 0;
		result = sqlSes.update("boardHit", pMap);
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

	public List<Map<String, Object>> boardPwCheck(Map<String, Object> pMap) {
		logger.info("[crm_BoardDao] boardPwCheck 호출성공");
		List<Map<String, Object>> boardPwCheck = null;
		boardPwCheck = sqlSes.selectList("boardPwCheck", pMap);
		return boardPwCheck;
	}
	

}
