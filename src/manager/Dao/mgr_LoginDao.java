package manager.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class mgr_LoginDao {
	Logger logger = Logger.getLogger(mgr_LoginDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	public mgr_LoginDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	public List<Map<String, Object>> login(Map<String, Object> lMap) {
		List<Map<String, Object>> lList = null;
		lList = sqlSes.selectList("login",lMap);
		logger.info(lList);
		return lList;
	}
}
