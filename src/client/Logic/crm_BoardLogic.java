package client.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import client.Dao.crm_BoardDao;
import client.Dao.crm_HospitalDao;

public class crm_BoardLogic {
	
	Logger logger = Logger.getLogger(crm_HospitalLogic.class);
	
	crm_BoardDao crm_hpDao = new crm_BoardDao();
	
	public List<Map<String,Object>> boardList(Map<String, Object> pMap) {
		logger.info("[crm_BoardLogic] boardList 호출성공");
		List<Map<String,Object>> boardList=null;
		boardList = crm_hpDao.boardList(pMap);
		return boardList;
	}
	
	public List<Map<String, Object>> boardResList(Map<String, Object> pMap) {
		logger.info("[crm_BoardLogic] boardResList 호출성공");
		List<Map<String,Object>> boardResList=null;
		boardResList = crm_hpDao.boardResList(pMap);
		return boardResList;
	}
	
	public List<Map<String, Object>> boardReplyList(Map<String, Object> pMap) {
		logger.info("[crm_BoardLogic] boardReplyList 호출성공");
		List<Map<String,Object>> boardReplyList=null;
		boardReplyList = crm_hpDao.boardReplyList(pMap);
		return boardReplyList;
	}
	
	public int boardIns(Map<String, Object> pMap) {
		logger.info("[crm_BoardLogic] boardIns 호출성공");
		int result = 0;
		result = crm_hpDao.boardIns(pMap);
		return result;
	}
	
	public int boardUpd(Map<String, Object> pMap) {
		logger.info("[crm_BoardLogic] boardUpd 호출성공");
		int result = 0;
		result = crm_hpDao.boardUpd(pMap);
		return result;
	}
	
	public int boardHit(Map<String, Object> pMap) {
		logger.info("[crm_BoardLogic] boardHit 호출성공");
		int result = 0;
		result = crm_hpDao.boardHit(pMap);
		return result;
	}
	
	public int boardDel(Map<String, Object> pMap) {
		logger.info("[crm_BoardLogic] boardDel 호출성공");
		int result = 0;
		result = crm_hpDao.boardDel(pMap);
		return result;
	}

	public List<Map<String, Object>> boardPwCheck(Map<String, Object> pMap) {
		logger.info("[crm_BoardLogic] boardPwCheck 호출성공");
		List<Map<String,Object>> boardPwCheck=null;
		boardPwCheck = crm_hpDao.boardPwCheck(pMap);
		return boardPwCheck;
	}


}

