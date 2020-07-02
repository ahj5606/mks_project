package client.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import client.Dao.crm_HospitalDao;

public class crm_HospitalLogic {
	Logger logger = Logger.getLogger(crm_HospitalLogic.class);
	crm_HospitalDao crm_hpDao = new crm_HospitalDao();
	
	public List<Map<String,Object>> hospitalList(Map<String, Object> pMap) {
		logger.info("병원리스트");
		List<Map<String,Object>> hpList=null;
		hpList=crm_hpDao.hospitalList(pMap);
		//logger.info(hpList.size());
		return hpList;
	}
	
	public List<Map<String,Object>> categori(Map<String, Object> pMap) {
		logger.info("카테고리");
		List<Map<String,Object>> categori=null;
		categori=crm_hpDao.categori(pMap);
		//logger.info(hpList.size());
		return categori;
	}
	
	public String proc_favoriteIns(Map<String, Object> pMap) {
		logger.info("[crm_HospitalLogic] favoriteIns 호출 성공.");
		String proc_favoriteIns = null;
		proc_favoriteIns = crm_hpDao.proc_favoriteIns(pMap);
		return proc_favoriteIns;
	}

	public List<Map<String, Object>> favoriteList(Map<String, Object> pMap) {
		logger.info("[crm_HospitalLogic] favoriteList 호출 성공.");
		List<Map<String, Object>> favoriteList = null;
		favoriteList = crm_hpDao.favoriteList(pMap);
		return favoriteList;
	}
	
	/*public static void main(String[] args) {
		crm_HospitalLogic cl=new crm_HospitalLogic();
		List<Map<String,Object>> hplist=cl.hospialList(pMap);
		System.out.println(hplist);
	}*/
}

