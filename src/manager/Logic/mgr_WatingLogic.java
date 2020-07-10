package manager.Logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import manager.Dao.mgr_WatingDao;

public class mgr_WatingLogic {

	mgr_WatingDao wDao = new mgr_WatingDao();
	public int rewait(Map<String, Object> pMap) {
		
		int result = -1;
		result=wDao.rewait(pMap);
		return result;
		
	}

	public int nextwait(Map<String, Object> pMap) {
		
		int result = -1;
		result=wDao.nextwait(pMap);
		return result;
	}

	public List<Map<String, Object>> prewait(Map<String, Object> pMap) {
		List<Map<String, Object>> wList = null;
		wList = wDao.prewait(pMap);
		return wList;
	}
	

}
