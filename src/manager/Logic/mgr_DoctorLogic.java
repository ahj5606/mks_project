package manager.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import manager.Dao.mgr_DoctorDao;


public class mgr_DoctorLogic {
	Logger logger = Logger.getLogger(mgr_DoctorLogic.class);
	mgr_DoctorDao mgr_dDao = new mgr_DoctorDao();
	public List<Map<String,Object>> doctorList(Map<String, Object> pMap) {
		logger.info("의사 리스트");
		List<Map<String,Object>> dList=null;
		dList=mgr_dDao.doctorList(pMap);
		return dList;
	}
	public List<Map<String, Object>> doctorSEL(Map<String, Object> pMap) {
		List<Map<String,Object>> dList=null;
		dList=mgr_dDao.doctorSEL(pMap);
		return dList;
	}
	public List<Map<String, Object>> doctorDEPT(Map<String, Object> pMap) {
		List<Map<String,Object>> deptList=null;
		deptList=mgr_dDao.doctorDEPT(pMap);
		return deptList;
	}
	public List<Map<String, Object>> deptSearch(Map<String, Object> pMap) {
		List<Map<String,Object>> deptList=null;
		deptList=mgr_dDao.deptSearch(pMap);
		return deptList;
	}
	public List<Map<String, Object>> reserveDay(Map<String, Object> pMap) {
		List<Map<String,Object>> resDay=null;
		resDay=mgr_dDao.reserveDay(pMap);
		return resDay;
	}
	
	public List<Map<String, Object>> doctorDetail(Map<String, Object> pMap) {
		List<Map<String,Object>> dList=null;
		dList=mgr_dDao.doctorDetail(pMap);
		return dList;
	}
	public int doctorINS(Map<String, Object> pMap) {
		logger.info("Logic doctorINS");
		int result = 0;
		return result;
	}
	
	
	public int doctorUPD(Map<String, Object> pMap) {
		logger.info("Logic doctorUPD");
		int result =0;
		result=mgr_dDao.doctorUPD(pMap);
		if(result==1 && pMap.get("sch_code")!=null) {
			result=mgr_dDao.resUPD(pMap);
			if(result==1) {
				return result;
			}else {
				return -1;
			}
		}else if(result!=1&&pMap.get("sch_code")==null) {
			return -1;
		}
		return result;
		
	}
	public int doctorDEL(Map<String, Object> pMap) {
		logger.info("Logic doctorDEL 호출성공");
		int result =0;
		result=mgr_dDao.doctorDEL(pMap);
		return result;
	}
	
}
