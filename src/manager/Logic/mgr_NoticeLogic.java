package manager.Logic;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import manager.Dao.mgr_NoticeDao;

public class mgr_NoticeLogic {
	Logger logger = Logger.getLogger(mgr_NoticeDao.class);
	mgr_NoticeDao mnd = null;
	int result = 0;
	
	public mgr_NoticeLogic() {
		mnd = new mgr_NoticeDao();
	}
	
	public List<Map<String, Object>> noticeSEL(Map<String, Object> nMap){
		List<Map<String, Object>> nList = new ArrayList<>();
		nList = mnd.noticeSEL(nMap);
		logger.info("mgr_NoticLogic=>noticeSEL=>nList=>"+nList);

		return nList;
	}
	
	public int noticeINS(Map<String,Object> nMap) {
		logger.info("logic=>ins호출 성공");
		result = mnd.noticeINS(nMap);
		return result;
	}
	public int noticeUPD(Map<String,Object> nMap) {
		logger.info("logic=>upd호출 성공");

		result = mnd.noticeUPD(nMap);
		return result;
	}
	public int noticeDEL(Map<String,Object> nMap) {
		logger.info("logic=>del호출 성공");

		result = mnd.noticeDEL(nMap);
		return result;
	}
}
