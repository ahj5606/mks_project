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
	public List<Map<String,Object>> deptCategory(Map<String, Object> pMap) {
		logger.info("부서카테고리");
		List<Map<String,Object>> deptCategory=null;
		deptCategory=crm_rsDao.deptCategory(pMap);
		//logger.info(hpList.size());
		return deptCategory;
	}
	public List<Map<String,Object>> docCategory(Map<String, Object> pMap) {
		logger.info("의사카테고리");
		List<Map<String,Object>> docCategory=null;
		docCategory=crm_rsDao.docCategory(pMap);
		//logger.info(hpList.size());
		return docCategory;
	}
	public List<Map<String,Object>> docSel(Map<String, Object> pMap) {
		logger.info("의사상세정보");
		List<Map<String,Object>> docSel=null;
		docSel=crm_rsDao.docSel(pMap);
		//logger.info(hpList.size());
		return docSel;
	}
	public List<Map<String,Object>> calender(Map<String, Object> pMap) {
		logger.info("달력로직");
		List<Map<String,Object>> calender=null;
		calender=crm_rsDao.calender(pMap);
		pMap.remove("doc_code");
		if(calender.size()==0) {
			calender=crm_rsDao.calender(pMap);
		}
		//logger.info(hpList.size());
		return calender;
	}
	public int pro_reservation(Map<String, Object> pMap) {
		logger.info("예약로직");
		int pro_reservation=0;
		pro_reservation=crm_rsDao.pro_reservation(pMap);
		if(pro_reservation==1) {
			String res_qrcode=(String)crm_rsDao.res_qrcode(pMap).get(0).get("RES_QRCODE");
			logger.info("res_qrcode: "+res_qrcode+"############################################");
			pro_reservation=Integer.parseInt(res_qrcode);
			logger.info("pro_reservation: "+pro_reservation+"############################################");
		}
		return pro_reservation;
	}
}
