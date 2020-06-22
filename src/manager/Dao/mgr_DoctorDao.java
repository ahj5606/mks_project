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
			dList=sqlSes.selectList("doctorList",pMap);
		} catch (Exception e) {
			
		}
		return dList;
	}
	public List<Map<String, Object>> doctorSEL(Map<String, Object> pMap) {
		List<Map<String,Object>> dList = null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			dList=sqlSes.selectList("doctorSEL",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dList;
	}
	public List<Map<String, Object>> doctorDEPT(Map<String, Object> pMap) {
		List<Map<String,Object>> dList = null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			dList=sqlSes.selectList("doctorDEPT",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dList;
	}
	public List<Map<String, Object>> doctorDetail(Map<String, Object> pMap) {
		List<Map<String,Object>> dList = null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			dList=sqlSes.selectList("doctorDetail",pMap);//sql
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dList;
	}
	public List<Map<String, Object>> doctorINS(Map<String, Object> pMap) {
		List<Map<String,Object>> dList = null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			dList=sqlSes.selectList("doctorINS",pMap);//sql
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dList;
	}
	public List<Map<String, Object>> doctorUPD(Map<String, Object> pMap) {
		List<Map<String,Object>> dList = null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			dList=sqlSes.selectList("doctorUPD",pMap);//sql
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dList;
	}
	public List<Map<String, Object>> doctorDEL(Map<String, Object> pMap) {
		List<Map<String,Object>> dList = null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			dList=sqlSes.selectList("doctorDEL",pMap);//sql
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dList;
	}
}
