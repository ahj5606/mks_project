package client.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.google.gson.Gson;

import mks.util.MyBatisConnction;

public class crm_ReservationDao {

	Logger logger = Logger.getLogger(crm_ReservationDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public crm_ReservationDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}

	public List<Map<String, Object>> proc_reservelist(Map<String, Object> pMap) {
		//병원만 선택후  모든과, 의사T, 대기시간 찾기 or 진료과목 및 의사T 조건검색 으로 목록 확인
		logger.info("[crm_ReservationDao] proc_reservelist 호출성공");
		List<Map<String, Object>> proc_reservelist = null;
		sqlSes.selectList("proc_reservelist", pMap);
		proc_reservelist = (List<Map<String, Object>>)pMap.get("res_list");
		return proc_reservelist;
	}
	
	public List<Map<String, Object>> deptCategory(Map<String, Object> pMap) {
		//과 카테고리 중복제거. 
		logger.info("[crm_ReservationDao] deptCategory 호출성공");
		List<Map<String, Object>> deptCategory = null;
		deptCategory = sqlSes.selectList("deptCategory", pMap);
		return deptCategory;
	}
	public List<Map<String, Object>> noticeNew(Map<String, Object> pMap) {
		//공지사항 최신순 2가지 보여주기.
		logger.info("[crm_ReservationDao] noticeNew 호출성공");
		List<Map<String, Object>> noticeNew = null;
		noticeNew = sqlSes.selectList("noticeNew", pMap);
		return noticeNew;
	}
	public List<Map<String, Object>> noticeDetail(Map<String, Object> pMap) {
		//공지사항 세부사항 보기.
		logger.info("[crm_ReservationDao] noticeDetail 호출성공");
		List<Map<String, Object>> noticeDetail = null;
		noticeDetail = sqlSes.selectList("noticeDetail", pMap);
		return noticeDetail;
	}

	public List<Map<String, Object>> waitCheck(Map<String, Object> pMap) {
		//대기표 발급화면 - 대기인원 현황
		logger.info("[crm_ReservationDao] waitCheck 호출성공");
		List<Map<String, Object>> waitCheck = null;
		waitCheck = sqlSes.selectList("waitCheck", pMap);
		return waitCheck;
	}
	
	public List<Map<String, Object>> docSel(Map<String, Object> pMap) {
		//의사선생님을 클릭하면 보이는 의사선생님 상세정보.
		logger.info("[crm_ReservationDao] docSel 호출성공");
		List<Map<String, Object>> docSel = null;
		docSel = sqlSes.selectList("docSel", pMap);
		return docSel;
	}
	
	public List<Map<String, Object>> calender(Map<String, Object> pMap) {
		//예약 가능한 시간표 Select
		logger.info("[crm_ReservationDao] calender 호출성공");
		List<Map<String, Object>> calender = null;
		logger.info("sch_date" + pMap.get("sch_date"));
		calender = sqlSes.selectList("calender", pMap);
		return calender;
	}
	public int pro_reservation(Map<String, Object> pMap) { //예약하기
		logger.info("[crm_ReservationDao] pro_reservation 호출성공");
		int result = 0;
		result = sqlSes.insert("pro_reservation", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
	
	public List<Map<String, Object>> res_qrcode(Map<String, Object> pMap) {
		//진료 예약화면 - 의사 선생님 카테고리
		logger.info("[crm_ReservationDao] res_qrcode 호출성공");
		List<Map<String, Object>> res_qrcode = null;
		res_qrcode = sqlSes.selectList("res_qrcode", pMap);
		return res_qrcode;
	}
	
	public List<Map<String, Object>> docCategory(Map<String, Object> pMap) {
		//진료 예약화면 - 의사 선생님 카테고리
		logger.info("[crm_ReservationDao] docCategory 호출성공");
		List<Map<String, Object>> docCategory = null;
		docCategory = sqlSes.selectList("docCategory", pMap);
		return docCategory;
	}
	
}