package manager.Dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class mgr_PatientDao {
	Logger logger =Logger.getLogger(mgr_PatientDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	public mgr_PatientDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	public void patientList(Map<String, Object> pMap) {
		
	}

}
