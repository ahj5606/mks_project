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
		List<Map<String,Object>> dList=null;
		dList=mgr_dDao.doctorDEPT(pMap);
		return dList;
	}
	public List<Map<String, Object>> doctorDetail(Map<String, Object> pMap) {
		List<Map<String,Object>> dList=null;
		dList=mgr_dDao.doctorDetail(pMap);
		return dList;
	}
	public List<Map<String, Object>> doctorINS(Map<String, Object> pMap) {
		List<Map<String,Object>> dList=null;
		dList=mgr_dDao.doctorINS(pMap);
		return dList;
	}
	public List<Map<String, Object>> doctorUPD(Map<String, Object> pMap) {
		List<Map<String,Object>> dList=null;
		dList=mgr_dDao.doctorUPD(pMap);
		return dList;
	}
	public List<Map<String, Object>> doctorDEL(Map<String, Object> pMap) {
		List<Map<String,Object>> dList=null;
		dList=mgr_dDao.doctorDEL(pMap);
		return dList;
	}
}
