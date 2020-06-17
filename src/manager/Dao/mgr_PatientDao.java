package manager.Dao;

import java.util.HashMap;
import java.util.List;
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
		List<Map<String, Object>> list = null;
		list =sqlSes.selectList("patientList",pMap);
		logger.info(list);
	}
	public static void main(String[] args) {
		mgr_PatientDao P = new mgr_PatientDao();
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("hp_code", "280HP");
		P.patientList(pMap);
	}
}
