package client.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class crm_MypageDao {
	static Logger logger = Logger.getLogger(crm_MypageDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public crm_MypageDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public List<Map<String, Object>> mypageList(Map<String, Object> pMap) {
		logger.info("[crm_MypageDao] mypageList 호출성공");
		List<Map<String, Object>> mypageList = null;
		mypageList = sqlSes.selectList("mypageList", pMap);
		return mypageList;
	}
		
	public List<Map<String, Object>> mypagePassword(Map<String, Object> pMap) {
		logger.info("[crm_MypageDao] mypagePassword 호출성공");
		List<Map<String, Object>> mypagePassword = null;
		mypagePassword = sqlSes.selectList("mypagePassword", pMap);
		return mypagePassword;
	}
	
//	public List<Map<String, Object>> boardSel(Map<String, Object> pMap) {
//		logger.info("[crm_BoardDao] boardSel 호출성공");
//		return null;
//	}
	
	public int mypageUpd(Map<String, Object> pMap) {
		logger.info("[crm_MypageDao] mypageUpd 호출성공");
		int result = 0;
		result = sqlSes.update("mypageUpd", pMap);
		logger.info("result: " + result);
		sqlSes.commit(true);
		return result;
	}
	
	public String proc_mem_Add(Map<String, Object> pMap) {
		logger.info("[crm_MypageDao] proc_mem_Add 호출성공");
		String result = "";
		sqlSes.selectOne("proc_mem_Add", pMap);
		result = pMap.get("msg").toString();
		sqlSes.commit(true);
		return result;
	}
	
	public static void main(String[] args) {
		crm_MypageDao my = new crm_MypageDao();
		String result = "";
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("u_id","test4");
		pMap.put("u_pw","123");
		pMap.put("u_soc","910685-1129562");
		pMap.put("u_addr","부산광역시");
		pMap.put("u_phone","010-1111-1114");
		pMap.put("u_name","회원4");
		result = my.proc_mem_Add(pMap);
		logger.info("result: "+result);
	}
    
}
