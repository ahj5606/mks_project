package manager.Dao;

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
	public List<Map<String,Object>> patientList(Map<String, Object> pMap) {
		List<Map<String,Object>> pList = null;
		pList=sqlSes.selectList("patientList",pMap);
		return pList;
	}
	public List<Map<String, Object>> patientSEL(Map<String, Object> pMap) {
		List<Map<String,Object>> pList = null;
		pList=sqlSes.selectList("patientSEL",pMap);
		return pList;
	}
	public List<Map<String, Object>> patientDetail(Map<String, Object> pMap) {
		List<Map<String,Object>> pList = null;
		pList=sqlSes.selectList("patientDetail",pMap);
		return pList;
	}

}
