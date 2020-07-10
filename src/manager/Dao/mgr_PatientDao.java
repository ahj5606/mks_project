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
		try {
			pList=sqlSes.selectList("patientList",pMap);
			
		} catch (Exception e) {
			e.toString();
		}
		return pList;
	}
	public List<Map<String, Object>> patientSEL(Map<String, Object> pMap) {
		List<Map<String,Object>> pList = null;
		try {
			
			pList=sqlSes.selectList("patientSEL",pMap);
		} catch (Exception e) {
			e.toString();
		}
		return pList;
	}
	public List<Map<String, Object>> patientDetail(Map<String, Object> pMap) {
		List<Map<String,Object>> pList = null;
		try {
			
			pList=sqlSes.selectList("patientDetail",pMap);
		} catch (Exception e) {
			e.toString();
		}
		return pList;
	}
	public List<Map<String, Object>> patientDoctor(Map<String, Object> pMap) {
		List<Map<String,Object>> pList = null;
		try {
			
			pList=sqlSes.selectList("patientDoctor",pMap);
		} catch (Exception e) {
			e.toString();
		}
		return pList;
	}
	public int patientHISINS(Map<String, Object> pMap) {
		int result =-1;
		try {
			
			result=sqlSes.insert("patientHIS",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}
	public int patientDEL(Map<String, Object> pMap) {
		int result =-1;
		try {
			result=sqlSes.insert("patientDEL",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			e.toString();
		}
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
		try {
			
			mem_code=sqlSes.selectOne("getMemCode");
		} catch (Exception e) {
			e.toString();
		}
		return mem_code;
	}
	public int patientINS(Map<String, Object> pMap) {
		int result =-1;
		try {
			
			result=sqlSes.insert("patientINS",pMap);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}
	public int memberSearch(Map<String, Object> pMap) {
		int result =-1;
		String strResult = null;
		try {
			strResult=sqlSes.selectOne("memberSearch",pMap);
			if(null==strResult) {
				
			}else {
				result = Integer.parseInt(strResult);
			}
			logger.info(result);
			
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

}