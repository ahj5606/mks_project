package manager.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import manager.Dao.mgr_PatientDao;

public class mgr_PatientLogic {
	Logger logger = Logger.getLogger(mgr_PatientLogic.class);
	mgr_PatientDao mgr_pDao = new mgr_PatientDao();
	public List<Map<String,Object>> patientList(Map<String, Object> pMap) {
		logger.info("환자 리스트");
		List<Map<String,Object>> pList=null;
		pList=mgr_pDao.patientList(pMap);
		return pList;
	}

}
