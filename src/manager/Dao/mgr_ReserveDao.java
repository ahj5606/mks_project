package manager.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;
public class mgr_ReserveDao {
	Logger logger = Logger.getLogger(mgr_ReserveDao.class);
	SqlSessionFactory sqlMapper=null;
	SqlSession sqlSes = null;
	public  mgr_ReserveDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes	= sqlMapper.openSession();//crud할 준비 완료!
	}
	public int getResTotal(Map<String, Object> pMap) {
		//페이지네이션
		logger.info("RDao getTotal 호출 성공");
		int tot = 0;
		try {
			
			tot= sqlSes.selectOne("getResTotal",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		logger.info("tot  : "+tot);
		return tot;
	}
	public List<Map<String, Object>> reserveList(Map<String, Object> pMap) {
		logger.info("reserveList 호출 성공");
		List<Map<String,Object>> rList = null;
		try {
			
			rList=sqlSes.selectList("reserveList",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		logger.info("rList:"+rList.size());
		return rList;
	}
	public List<Map<String, Object>> reserveSEL(Map<String, Object> pMap) {
		List<Map<String,Object>> rList = null;
		try {
			
			rList=sqlSes.selectList("reserveSEL",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return rList;
	}
	public List<Map<String, Object>> reserveDetail(Map<String, Object> pMap) {
		List<Map<String,Object>> rList = null;
		try {
			
			rList=sqlSes.selectList("reserveDetail",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return rList;
	}
	public int reserveUPD(Map<String, Object> pMap) {
		logger.info("reserveUPD 호출 성공");
		int result =-1;
		try {
			result=sqlSes.update("reserveUPD",pMap);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		sqlSes.commit();
		return result;
	}
	public List<Map<String, Object>> reserveDoctor(Map<String, Object> pMap) {
		List<Map<String,Object>> rList = null;
		try {
			
			rList=sqlSes.selectList("reserveDoctor",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return rList;
	}
	public List<Map<String, Object>> reserveSchedule(Map<String, Object> pMap) {
		List<Map<String,Object>> rList = null;
		try {
			
			rList=sqlSes.selectList("reserveSchedule",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return rList;
	}
	public int reserveINS(Map<String, Object> pMap) {
		logger.info("reserveINS 호출 성공");
		int result =-1;
		try {
			
			result=sqlSes.insert("reserveINS",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		sqlSes.commit();
		return result;
	}
	public List<Map<String, Object>> reservePatient(Map<String, Object> pMap) {
		List<Map<String,Object>> rList = null;
		try {
			
			rList=sqlSes.selectList("reservePatient",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return rList;
	}
	public int reserveDEL(Map<String, Object> pMap) {
		logger.info("reserveINS 호출 성공");
		int result =-1;
		try {
			
			result=sqlSes.delete("reserveDEL",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		sqlSes.commit();
		return result;
	}
	public List<Map<String, Object>> reserveDEPT(Map<String, Object> pMap) {
		logger.info("reserveDEPT 호출 성공");
		List<Map<String,Object>> dList = null;
		try {
			dList=sqlSes.selectList("reserveDEPT",pMap);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		logger.info("dList:"+dList.size());
		return dList;
	}
	public List<Map<String, Object>> transDate(Map<String, Object> pMap) {
		logger.info("달력용 변환날짜 호출 성공");
		List<Map<String,Object>> transList = null;
		try {
			transList=sqlSes.selectList("transDate",pMap);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		logger.info("transList:"+transList.size());
		return transList;
	}


}
