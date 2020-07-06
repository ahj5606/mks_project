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
	public List<Map<String, Object>> patientSEL(Map<String, Object> pMap) {
		List<Map<String,Object>> pList=null;
		pList=mgr_pDao.patientSEL(pMap);
		return pList;
	}
	public List<Map<String, Object>> patientDetail(Map<String, Object> pMap) {
		List<Map<String,Object>> pList=null;
		pList=mgr_pDao.patientDetail(pMap);
		return pList;
	}
	public List<Map<String, Object>> patientDoctor(Map<String, Object> pMap) {
		List<Map<String,Object>> pList=null;
		pList=mgr_pDao.patientDoctor(pMap);
		return pList;
	}
	public int patientHISINS(Map<String, Object> pMap) {
		int result =-1;
		result = mgr_pDao.patientHISINS(pMap);
		
		return result;
	}
	public int patientDEL(Map<String, Object> pMap) {
		int result =-1;
		result = mgr_pDao.patientDEL(pMap);
		return result;
	}
	public int patientUPD(Map<String, Object> pMap) {
		int result =-1;
		result = mgr_pDao.patientUPD(pMap);
		return result;
	}
	public int patientINS(Map<String, Object> pMap) {
		int result =-1;
		int mem_code =-1;
		mem_code = mgr_pDao.memberSearch(pMap);
		if(mem_code>0) {
			pMap.put("mem_code", mem_code);
			result=mgr_pDao.patientHISINS(pMap);
		}else {
			mem_code = mgr_pDao.getMemNo(pMap);
			if(mem_code>0) {
				pMap.put("mem_code", mem_code);
				int mem_ins = mgr_pDao.patientINS(pMap);
				if(mem_ins==1) {
					result=mgr_pDao.patientHISINS(pMap);
				}
			}
		}
		
		return result;
		
	}

}
