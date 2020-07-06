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
	public List<Map<String, Object>> patientDoctor(Map<String, Object> pMap) {
		List<Map<String,Object>> pList = null;
		pList=sqlSes.selectList("patientDoctor",pMap);
		return pList;
	}
	public int patientHISINS(Map<String, Object> pMap) {
		int result =-1;
		result=sqlSes.insert("patientHIS",pMap);
		sqlSes.commit();
		return result;
	}
	public int patientDEL(Map<String, Object> pMap) {
		int result =-1;
		result=sqlSes.insert("patientDEL",pMap);
		sqlSes.commit();
		return result;
	}
	public int patientUPD(Map<String, Object> pMap) {
		int result =-1;
		result=sqlSes.insert("patientUPD",pMap);
		sqlSes.commit();
		return result;
	}
	public int getMemNo(Map<String, Object> pMap) {
		int mem_code=-1;
		mem_code=sqlSes.selectOne("getMemCode");
		return mem_code;
	}
	public int patientINS(Map<String, Object> pMap) {
		int result =-1;
		result=sqlSes.insert("patientINS",pMap);
		return result;
	}
	public int memberSearch(Map<String, Object> pMap) {
		int result =-1;
		result=sqlSes.selectOne("memberSearch",pMap);
		return result;
	}

}