package client.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import client.Dao.crm_HospitalDao;

public class crm_HospitalLogic {
	Logger logger = Logger.getLogger(crm_HospitalLogic.class);
	crm_HospitalDao crm_hpDao = new crm_HospitalDao();
	
	public List<Map<String,Object>> hospialList(Map<String, Object> pMap) {
		logger.info("병원리스트");
		List<Map<String,Object>> hpList=null;
		hpList=crm_hpDao.hospialList(pMap);
		return hpList;
	}
	/*public static void main(String[] args) {
		crm_HospitalLogic cl=new crm_HospitalLogic();
		List<Map<String,Object>> hplist=cl.hospialList(pMap);
		System.out.println(hplist);
	}*/
}

