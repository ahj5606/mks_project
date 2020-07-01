package client.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class crm_NoticeDao {

	Logger logger = Logger.getLogger(crm_NoticeDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public crm_NoticeDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public List<Map<String, Object>> noticeList(Map<String, Object> pMap) {
		//공지사항 리스트, 조건하에 예약회면에서 최신 공시사항 2가지 제목 보여주기.
		logger.info("[crm_NoticeDao] noticeList 호출성공");
		List<Map<String, Object>> noticeList = null;
		noticeList = sqlSes.selectList("noticeList", pMap);
		return noticeList;
	}
	
	public List<Map<String, Object>> noticeDetail(Map<String, Object> pMap) {
		//공지사항 세부사항 보기.
		logger.info("[crm_ReservationDao] noticeDetail 호출성공");
		List<Map<String, Object>> noticeDetail = null;
		pMap.put("board_no", 1);
		noticeDetail = sqlSes.selectList("noticeDetail", pMap);
		return noticeDetail;
	}
	
	public static void main(String[] args) {
		crm_NoticeDao no = new crm_NoticeDao();
		Map<String, Object> pMap = new HashMap<String, Object>();
//		pMap.put("mode", "1");
//		pMap.put("fnum", "1");
//		pMap.put("enum", "5");
//		no.noticeList(pMap);
		no.noticeDetail(pMap);
	}
}
