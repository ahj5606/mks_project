package manager.Logic;

import java.util.Map;

import org.apache.log4j.Logger;

import manager.Dao.mgr_PatientDao;

public class mgr_PatientLogic {
	Logger logger = Logger.getLogger(mgr_PatientLogic.class);
	mgr_PatientDao mgr_pDao = new mgr_PatientDao();
	public void patientList(Map<String, Object> pMap) {
		logger.info("환자 리스트");
		mgr_pDao.patientList(pMap);
	}

}
