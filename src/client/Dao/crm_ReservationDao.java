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
	//pMap.put("u_hp_code","647HP");
	//pMap.put("u_dept_name","소아과");
	//pMap.put("u_doc_name","조하윤");
	//pMap.put("fnum",1);
	//pMap.put("enum",5);
		
	//	if(pMap.get("u_dept_name")!=null) {
	//		String	name=pMap.get("u_dept_name").toString();
	//		logger.info("[crm_ReservationDao] dept_name"+name);
	//	}else {
	//		logger.info("[crm_ReservationDao] dept_name"+"nul이닷@@@@@@@@@@@@@@@@@@@@@@@@");
	//	}
		sqlSes.selectList("proc_reservelist", pMap);
		proc_reservelist = (List<Map<String, Object>>)pMap.get("res_list");
		return proc_reservelist;
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
		logger.info("[crm_ReservationDao] docSel 호출성공");
		List<Map<String, Object>> docSel = null;
		pMap.put("doc_name", "이서연");
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
	
	public int reservation(Map<String, Object> pMap) { //예약하기
		logger.info("[crm_ReservationDao] reservation 호출성공");
		int result = 0;
		result = sqlSes.delete("reservation", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
	
	public static void main(String[] args) {
		crm_ReservationDao res = new crm_ReservationDao();
		Map<String, Object> pMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = res.proc_reservelist(pMap);
//		res.waitCheck(pMap);
//		res.docSel(pMap);
		System.out.println(list);
		System.out.println(list.size());
		
	}
}