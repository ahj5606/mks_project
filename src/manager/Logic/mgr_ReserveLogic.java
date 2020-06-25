package manager.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import manager.Dao.mgr_ReserveDao;

public class mgr_ReserveLogic {
	Logger logger = Logger.getLogger(mgr_ReserveLogic.class);
	mgr_ReserveDao rDao = new mgr_ReserveDao();
	
	public List<Map<String, Object>> reserveList(Map<String, Object> pMap) {
		logger.info("예약 리스트");
		List<Map<String,Object>> rList=null;
		rList=rDao.reserveList(pMap);
		logger.info(rList);
		return rList;
	}
	public List<Map<String, Object>> reserveSEL(Map<String, Object> pMap) {
		logger.info("예약 검색");
		List<Map<String,Object>> rList=null;
		rList=rDao.reserveSEL(pMap);
		return rList;
	}

	

	public List<Map<String, Object>> reserveDetail(Map<String, Object> pMap) {
		logger.info("예약 상세");
		List<Map<String,Object>> rList=null;
		rList=rDao.reserveDetail(pMap);
		return rList;
	}



	public List<Map<String, Object>> reserveDEPT(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return null;
	}



	public List<Map<String, Object>> reserveINS(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return null;
	}



	public int reserveUPD(Map<String, Object> pMap) {
		int result =-1;
		result = rDao.reserveUPD(pMap);
		return result;
	}



	public int reserveDEL(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<Map<String, Object>> reserveDoctor(Map<String, Object> pMap) {
		List<Map<String,Object>> rList=null;
		rList=rDao.reserveDoctor(pMap);
		return rList;
	}
	public List<Map<String, Object>> reserveSchedule(Map<String, Object> pMap) {
		List<Map<String,Object>> rList=null;
		rList=rDao.reserveSchedule(pMap);
		return rList;
	}







}
