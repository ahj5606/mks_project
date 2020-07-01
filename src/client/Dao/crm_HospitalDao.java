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
	
	public List<Map<String, Object>> deptList(Map<String, Object> pMap) {
		List<Map<String, Object>> deptList = null;
		//logger.info("sqlMapper: "+sqlMapper);
		//logger.info("sqlSes: "+sqlSes);
		deptList =sqlSes.selectList("deptList", pMap);
		logger.info("deptList 사이즈:  "+deptList.size());
		return deptList;
	}
	public List<Map<String, Object>> categori(Map<String, Object> pMap) {
		List<Map<String, Object>> categori = null;
		categori =sqlSes.selectList("categori", pMap);
		logger.info("categori 사이즈:  "+categori.size());
		return categori;
	}

}