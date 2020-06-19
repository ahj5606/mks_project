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
	
//	public List<Map<String, Object>> boardSel(Map<String, Object> pMap) {
//		logger.info("[crm_BoardDao] boardSel 호출성공");
//		return null;
//	}
	
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
}
