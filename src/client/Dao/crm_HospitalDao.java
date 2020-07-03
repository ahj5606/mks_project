package client.Dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import mks.util.MyBatisConnction;

public class crm_HospitalDao {
		Logger logger = Logger.getLogger(crm_HospitalDao.class);
		SqlSessionFactory sqlMapper = null;
		SqlSession sqlSes = null;
	public crm_HospitalDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	public List<Map<String, Object>> hospitalList(Map<String, Object> pMap) {

		//제휴병원 리스트
		logger.info("[crm_HospitalDao] hospitalList호출 성공");

		List<Map<String, Object>> hpList = null;
		//logger.info("sqlMapper: "+sqlMapper);
		//logger.info("sqlSes: "+sqlSes);
		hpList =sqlSes.selectList("hospitalList", pMap);
		logger.info("hospitaldao 사이즈:  "+hpList.size());
		return hpList;
	}
	
	public List<Map<String, Object>> categori(Map<String, Object> pMap) {
		List<Map<String, Object>> categori = null;
		categori =sqlSes.selectList("categori", pMap);
		logger.info("categori 사이즈:  "+categori.size());
		return categori;
	}
	
	public String proc_favoriteIns(Map<String, Object> pMap) {
		logger.info("[crm_HospitalDao] proc_favoriteIns 호출성공.");
		String msg = null;
		sqlSes.selectOne("proc_favoriteIns", pMap);
		msg = (String)pMap.get("msg");
		logger.info("msg: " + msg);
		sqlSes.commit(true);
		return msg;
	}
	public List<Map<String, Object>> favoriteList(Map<String, Object> pMap) {
		logger.info("[crm_HospitalDao] favoriteList 호출성공.");
		List<Map<String, Object>> favoriteList = null;
		favoriteList = sqlSes.selectList("favoriteList", pMap);
		logger.info("favoriteList: " + favoriteList.size());
		return favoriteList;
	}
	
	public static void main(String[] args) {
		crm_HospitalDao hos = new crm_HospitalDao();
		Map<String, Object> pMap = new HashMap<>();
//		pMap.put("u_mks_id", "baboo");
//		pMap.put("u_hp_code", "280HP");
//		pMap.put("u_hp_name", "새움병원");
//		hos.proc_favoriteIns(pMap);
//		hos.favoriteList(pMap);
	}
	public int favoriteDel(Map<String, Object> pMap) {
		logger.info("[crm_HospitalDao] favoriteDel 호출성공.");
		int result = 0;
		result = sqlSes.delete("favoriteDel", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}

}