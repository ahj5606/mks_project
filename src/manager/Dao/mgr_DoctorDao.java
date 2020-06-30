package manager.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class mgr_DoctorDao {
	Logger logger =Logger.getLogger(mgr_DoctorDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	public mgr_DoctorDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	public List<Map<String,Object>> doctorList(Map<String, Object> pMap) {
		List<Map<String,Object>> dList = null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			logger.info("다오 docdorList 호출");
			dList=sqlSes.selectList("doctorList",pMap);
			logger.info("doctorList: "+dList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dList;
	}

	
	public List<Map<String, Object>> doctorSEL(Map<String, Object> pMap) {
	List<Map<String,Object>> dList = null; 
	try { 
		SqlSession sqlSes = sqlMapper.openSession(); 
		dList=sqlSes.selectList("doctorSEL",pMap); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return dList; 
	}
	
	public List<Map<String, Object>> doctorDEPT(Map<String, Object> pMap) {
		List<Map<String,Object>> deptList = null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			deptList=sqlSes.selectList("doctorDEPT",pMap);
			logger.info(deptList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deptList;
	}
	public List<Map<String, Object>> deptSearch(Map<String, Object> pMap) {
		List<Map<String,Object>> deptList = null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			deptList=sqlSes.selectList("deptSearch",pMap);
			logger.info(deptList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deptList;
	}
	public List<Map<String, Object>> doctorDetail(Map<String, Object> pMap) {
		List<Map<String,Object>> dList= null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			logger.info("다오 doctorDetail 호출");
			dList=sqlSes.selectList("doctorDetail",pMap);
			logger.info("doctorDetail: "+dList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dList;
	}
	public int doctorINS(Map<String, Object> pMap) {
		logger.info("doctorINS호출 성공");
		int result = 0;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("doctorINS",pMap);
			logger.info("result:"+result);
			sqlSes.commit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int doctorUPD(Map<String, Object> pMap) {
		logger.info("doctorUPD호출 성공");
		int result = 0;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			result = sqlSes.update("doctorUPD",pMap);
			sqlSes.commit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int doctorDEL(Map<String, Object> pMap) {
		logger.info("doctorDEL 호출 성공");
		int result = 0;
		result = sqlSes.delete("doctorDEL",pMap);
		logger.info("result:"+result);
		sqlSes.commit(true);
		return result;
	}
}
