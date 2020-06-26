package client.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import client.Dao.crm_ReservationDao;



public class crm_ReservationLogic {
	Logger logger = Logger.getLogger(crm_HospitalLogic.class);
	crm_ReservationDao crm_rsDao=new crm_ReservationDao();
	
	public List<Map<String,Object>> proc_reservelist(Map<String, Object> pMap) {
		logger.info("proc_reservelist logic");
		List<Map<String,Object>> proc_reservelist=null;
		proc_reservelist=crm_rsDao.proc_reservelist(pMap);
		//logger.info(hpList.size());
		return proc_reservelist;
	}
}
