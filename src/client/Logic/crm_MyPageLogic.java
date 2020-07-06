package client.Logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import client.Dao.crm_MypageDao;

public class crm_MyPageLogic {
	
	Logger logger = Logger.getLogger(crm_MyPageLogic.class);
	crm_MypageDao crm_mgDao = new crm_MypageDao();
		
	public String idCheck(Map<String, Object> pMap) {
		logger.info("[crm_MyPageLogic] idCheck 호출성공");
		String idCheck=null;
		idCheck = crm_mgDao.idCheck(pMap);
		return idCheck;
	}
	
	public String socialnumCheck(Map<String, Object> pMap) {
		logger.info("[crm_MyPageLogic] socialnumCheck 호출성공");
		String  socialnumCheck=null;
		socialnumCheck = crm_mgDao.socialnumCheck(pMap);
		return socialnumCheck;
	}
	
	public String proc_mem_Add(Map<String, Object> pMap) {
		logger.info("[crm_MyPageLogic] proc_mem_Add 호출성공");
		String proc_mem_Add=null;
		proc_mem_Add = crm_mgDao.proc_mem_Add(pMap);
		return proc_mem_Add;
	}
	
	public int mypageUpd (Map<String, Object> pMap) {
		logger.info("[crm_MyPageLogic] mypageUpd 호출성공");
		int result = 0;
		result = crm_mgDao.mypageUpd_Member(pMap);
		if(result == 0) {
			result = -1;
		}else {
			result = crm_mgDao.mypageUpd_Online(pMap);
		}
		return result;
	}
	
	public int mypagePassword (Map<String, Object> pMap) {
		logger.info("[crm_MyPageLogic] mypagePassword 호출성공");
		int result = 0;
		List<Map<String, Object>> mypagePassword = null;
		mypagePassword = crm_mgDao.mypagePassword(pMap);
		String pw = mypagePassword.get(0).get("MKS_PW").toString();
		logger.info("pw: "+pw);
		if(pw.length()>0) {
			result = 1;
		}
		logger.info("result: "+result);
		return result;
	}
	
	public List<Map<String, Object>> mypageSel (Map<String, Object> pMap) {
		logger.info("[crm_MyPageLogic] mypageSel 호출성공");
		List<Map<String, Object>> mypageSel = null;
		mypageSel = crm_mgDao.mypageSel(pMap);
		logger.info("mypageSel 사이즈: "+mypageSel.size());
		return mypageSel;
	}

	public List<Map<String, Object>> mypageList(Map<String, Object> pMap) {
		logger.info("[crm_MyPageLogic] mypageList 호출성공");
		List<Map<String, Object>> mypageList = null;
		mypageList = crm_mgDao.mypageList(pMap);
		logger.info("mypageList 사이즈: "+mypageList.size());
		return mypageList;
	}
	
}
