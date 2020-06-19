package manager.Logic;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import manager.Dao.mgr_NoticeDao;

public class mgr_NoticeLogic {
	Logger logger = Logger.getLogger(mgr_NoticeDao.class);
	mgr_NoticeDao mnd = new mgr_NoticeDao();
	
	public List<Map<String, Object>> noticeSEL(Map<String, Object> nMap){
		List<Map<String, Object>> nList = new ArrayList<>();
		nList = mnd.noticeSEL(nMap);
		logger.info("mgr_NoticLogic=>noticeSEL=>nList=>"+nList);

		return nList;
	}
}
