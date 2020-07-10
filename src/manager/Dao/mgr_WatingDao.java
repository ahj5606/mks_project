package manager.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class mgr_WatingDao {

	Logger logger = Logger.getLogger(mgr_LoginDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	public mgr_WatingDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public int rewait(Map<String, Object> pMap) {
		int result = -1;
		try {
			result = sqlSes.update("rewait",pMap);
			sqlSes.commit(true);
		} catch (Exception e) {
		}
		
		return result;
	}
	public int nextwait(Map<String, Object> pMap) {
		int result = -1;
		try {
			result = sqlSes.update("nextwait",pMap);
			sqlSes.commit(true);
		} catch (Exception e) {
		}
		
		
		return result;
	}

	public List<Map<String, Object>> prewait(Map<String, Object> pMap) {
		
		List<Map<String, Object>> wList = null;
		
		try {
			
			wList = sqlSes.selectList("prewait",pMap);
			
		} catch (Exception e) {
		}
		
		
		return wList;
	}


}
