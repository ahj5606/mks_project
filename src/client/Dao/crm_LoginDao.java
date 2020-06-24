package client.Dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class crm_LoginDao {
	static Logger logger = Logger.getLogger(crm_LoginDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public crm_LoginDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public List<Map<String, Object>> proc_mem_login(Map<String, Object> pMap) {
		logger.info("[crm_LoignDao] proc_mem_login호출 성공");
		List<Map<String, Object>> login = new ArrayList<>();
		String name = "";
		String id = "";
		sqlSes.selectList("proc_mem_login", pMap);
		name = pMap.get("msg").toString();
		logger.info("name: " + name);
		id = pMap.get("msg_id").toString();
		logger.info("id: " + id);
		login.add(pMap);
		logger.info(login.size());
		sqlSes.commit();
		return login;
	}
	
	public static void main(String[] args) {
		crm_LoginDao logDao = new crm_LoginDao();
		List<Map<String, Object>> login = null;
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("u_id", "test");
		pMap.put("u_pw", "123");
		login = logDao.proc_mem_login(pMap);
		logger.info("result: " + login);
	}
	
}
