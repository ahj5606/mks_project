package client.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import client.Dao.crm_NoticeDao;

public class crm_NoticeLogic {
	
	Logger logger = Logger.getLogger(crm_NoticeLogic.class);
	crm_NoticeDao crm_noDao = new crm_NoticeDao();
	
	public List<Map<String, Object>> noticeList(Map<String, Object> pMap) {
		//공지사항 리스트, 조건하에 예약회면에서 최신 공시사항 2가지 제목 보여주기.
		logger.info("[crm_NoticeLogic] noticeList 호출성공");
		List<Map<String, Object>> noticeList = null;
		noticeList = crm_noDao.noticeList(pMap);
		return noticeList;
	}
	
	public List<Map<String, Object>> noticeDetail(Map<String, Object> pMap) {
		//공지사항 세부사항 보기.
		logger.info("[crm_NoticeLogic] noticeDetail 호출성공");
		List<Map<String, Object>> noticeDetail = null;
		noticeDetail = crm_noDao.noticeDetail(pMap);
		return noticeDetail;
	}	
}
