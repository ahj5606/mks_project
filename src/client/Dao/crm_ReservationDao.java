package client.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class crm_ReservationDao {
	Logger logger = Logger.getLogger(crm_ReservationDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public crm_ReservationDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public List<Map<String, Object>> reservationList(Map<String, Object> pMap) {
		logger.info("[crm_ReservationDao] reservationList 호출성공");
		List<Map<String, Object>> reservationList = null;
		reservationList = sqlSes.selectList("reservationList", pMap);
		return reservationList;
	}
	
	public List<Map<String, Object>> noticeList(Map<String, Object> pMap) {
		logger.info("[crm_ReservationDao] noticeList 호출성공");
		List<Map<String, Object>> noticeList = null;
		noticeList = sqlSes.selectList("noticeList", pMap);
		return noticeList;
	}
	
//	public List<Map<String, Object>> noticeSel(Map<String, Object> pMap) {
//		logger.info("[crm_ReservationDao] noticeSel 호출성공");
//		return null;
//	}

	public List<Map<String, Object>> watiCheck(Map<String, Object> pMap) {
		logger.info("[crm_ReservationDao] watiCheck 호출성공");
		List<Map<String, Object>> watiCheck = null;
		watiCheck = sqlSes.selectList("watiCheck", pMap);
		return watiCheck;
	}
	
	public List<Map<String, Object>> docSel(Map<String, Object> pMap) {
		logger.info("[crm_ReservationDao] docSel 호출성공");
		List<Map<String, Object>> docSel = null;
//		pMap.put("hp_code", "647HP");
		docSel = sqlSes.selectList("docSel", pMap);
		return docSel;
	}
	
	public List<Map<String, Object>> calender(Map<String, Object> pMap) {
		logger.info("[crm_ReservationDao] calender 호출성공");
		List<Map<String, Object>> calender = null;
		calender = sqlSes.selectList("calender", pMap);
		return calender;
	}
	
	public List<Map<String, Object>> time(Map<String, Object> pMap) {
		logger.info("[crm_ReservationDao] time 호출성공");
		List<Map<String, Object>> time = null;
		time = sqlSes.selectList("time", pMap);
		return time;
	}
	
	public int reservation(Map<String, Object> pMap) {
		logger.info("[crm_ReservationDao] reservation 호출성공");
		int result = 0;
		result = sqlSes.delete("reservation", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
	
//	public static void main(String[] args) {
//		crm_ReservationDao res = new crm_ReservationDao();
//		Map<String, Object> pMap = new HashMap<String, Object>();
//		res.docSel(pMap);
//		System.out.println(pMap);
//	}
}
