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
		pMap.put("u_hp_code","647HP");
		pMap.put("u_dept_name","소아과");
		pMap.put("u_doc_name","조하윤");
		pMap.put("fnum",1);
		pMap.put("enum",5);
		sqlSes.selectList("proc_reservelist", pMap);
		proc_reservelist = (List<Map<String, Object>>)pMap.get("res_list");
		return proc_reservelist;
	}
	
	public List<Map<String, Object>> noticeNew(Map<String, Object> pMap) {
		//공지사항 최신순 2가지 보여주기.
		logger.info("[crm_ReservationDao] noticeNew 호출성공");
		List<Map<String, Object>> noticeNew = null;
		noticeNew = sqlSes.selectList("noticeNew", pMap);
		return noticeNew;
	}
	
	public List<Map<String, Object>> noticeList(Map<String, Object> pMap) {
		//공지사항 리스트 보기.
		logger.info("[crm_ReservationDao] noticeList 호출성공");
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
	
	public List<Map<String, Object>> deptCategory(Map<String, Object> pMap) {
		//과 카테고리 중복제거. 
		logger.info("[crm_ReservationDao] deptCategory 호출성공");
		List<Map<String, Object>> deptCategory = null;
		pMap.put("hp_code", "647HP");
		deptCategory = sqlSes.selectList("deptCategory", pMap);
		return deptCategory;
	}

	public List<Map<String, Object>> waitCheck(Map<String, Object> pMap) {
		//대기표 발급화면 - 대기인원 현황
		logger.info("[crm_ReservationDao] waitCheck 호출성공");
		List<Map<String, Object>> waitCheck = null;
		pMap.put("hp_code", "647HP");
		pMap.put("dept_name", "원무과");
		waitCheck = sqlSes.selectList("waitCheck", pMap);
		return waitCheck;
	}
	
	public List<Map<String, Object>> docSel(Map<String, Object> pMap) {
		//의사선생님을 클릭하면 보이는 의사선생님 상세정보.
		logger.info("[crm_ReservationDao] docSel 호출성공");
		List<Map<String, Object>> docSel = null;
		pMap.put("doc_name", "이서연");
		docSel = sqlSes.selectList("docSel", pMap);
		return docSel;
	}
	
	public List<Map<String, Object>> calender(Map<String, Object> pMap) {
		//예약 가능한 시간표 Select
		logger.info("[crm_ReservationDao] calender 호출성공");
		List<Map<String, Object>> calender = null;
		pMap.put("hp_code", "647HP");
		pMap.put("dept_code", "39");
		pMap.put("doc_code", "10-6830-6829");
		pMap.put("sch_date", "2020/07/23");
		pMap.put("sch_time", "1200");
		calender = sqlSes.selectList("calender", pMap);
		return calender;
	}
	
	public List<Map<String, Object>> docCategory(Map<String, Object> pMap) {
		//진료 예약화면 - 의사 선생님 카테고리
		logger.info("[crm_ReservationDao] docCategory 호출성공");
		List<Map<String, Object>> docCategory = null;
		pMap.put("dept_code", "39");
		pMap.put("hp_code", "647HP");
		docCategory = sqlSes.selectList("docCategory", pMap);
		return docCategory;
	}
	
	public int reservation(Map<String, Object> pMap) { 
		//예약하기
		logger.info("[crm_ReservationDao] reservation 호출성공");
		int result = 0;
//		pMap.put("mem_memcode", 95);
//		pMap.put("res_memo", "오니");
//		pMap.put("sch_code", 22);
//		pMap.put("res_qrcode", "");
//		pMap.put("doc_name", "이시현");
//		pMap.put("res_time", "1200");
//		pMap.put("doc_code", "10-6830-6829");
//		pMap.put("hp_code", "647HP");
//		pMap.put("dept_name", "신경과");
//		pMap.put("dept_code", "39");
//		pMap.put("sch_date", "2020/07/23");
//		pMap.put("hp_name", "위대항병원");
		result = sqlSes.insert("reservation", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
	
	public static void main(String[] args) {
		crm_ReservationDao res = new crm_ReservationDao();
		Map<String, Object> pMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = res.proc_reservelist(pMap);
//		res.noticeNew(pMap);
//		res.noticeList(pMap);
//		res.noticeDetail(pMap);
		res.deptCategory(pMap);
//		res.waitCheck(pMap);
//		res.docSel(pMap);
//		res.calender(pMap);
//		res.docCategory(pMap);
//		res.reservation(pMap);
		System.out.println(list);
		System.out.println(list.size());
		
	}
}
