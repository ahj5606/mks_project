package client.Dao;

import java.util.HashMap;
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
		logger.info("[crm_HospitalDao] hospitalList호출 성공");
		List<Map<String, Object>> hospitalList = null;
		pMap.put("hp_open", "09:00");
		pMap.put("hp_close", "18:00");
		hospitalList = sqlSes.selectList("hospitalList", pMap);
		logger.info("hospitalList: " + hospitalList.size()); //널포인트 인셉션 터지는 위치.
		return hospitalList;
	}
	
	public static void main(String[] args) {
		crm_HospitalDao hos = new crm_HospitalDao();
		Map<String, Object> pMap = new HashMap<>();
		hos.hospitalList(pMap);
		System.out.println(pMap);
	}
}
