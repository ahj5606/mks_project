package client.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class crm_LoginDao {
	Logger logger = Logger.getLogger(crm_LoginDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public crm_LoginDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public List<Map<String, Object>> login(Map<String, Object> pMap) {
		logger.info("[crm_LoignDao] login호출 성공");
		List<Map<String, Object>> login = null;
//		pMap.put("hp_open", "09:00");
//		pMap.put("hp_close", "18:00");
		login = sqlSes.selectList("login", pMap);
		logger.info("login: " + login.size()); //널포인트 인셉션 터지는 위치.
		return login;
	}
}
