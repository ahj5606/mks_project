package client.Dao;

import java.util.ArrayList;
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
	
	public  String idCheck(Map<String, Object> pMap) {
	     logger.info("[crm_MypageDao] idCheck호출 성공");
	      List<Map<String, Object>> idCheck = new ArrayList<>();
	      String msg=null;
	      msg=sqlSes.selectOne("idCheck", pMap);
	      if(!"통과".equals(msg)) {
	    	  msg="중복";
	      } 
	      //idCheck.add(msg);
	      logger.info(msg);
	      return msg;
	}
	
	public String socialnumCheck(Map<String, Object> pMap) {
	     logger.info("[crm_MypageDao] idCheck호출 성공");
	      List<Map<String, Object>> socialnumCheck = new ArrayList<>();
	      String msg=null;
	      msg=sqlSes.selectOne("socialnumCheck", pMap);
	      if(!"통과".equals(msg)) {
	    	  msg="중복";
	      } 
	      //idCheck.add(msg);
	      logger.info(msg);
	      sqlSes.commit();
	      return msg;
	}
	
	public String proc_mem_Add(Map<String, Object> pMap) {
		logger.info("[crm_MypageDao] proc_mem_Add 호출성공");
		 String msg=null;
		sqlSes.selectOne("proc_mem_Add", pMap);
		msg= (String)pMap.get("msg");
		logger.info(msg);
		sqlSes.commit(true);
		return msg;
	}
	/*public static void main(String[] args) {
		crm_MypageDao my = new crm_MypageDao();
		Map<String, Object> pMap = new HashMap<String, Object>();
		List<Map<String, Object>> result = new ArrayList<>();
		String msg;
		String s="961127-1111111";
		pMap.put("mem_socialnum",s);
		//msg=logDao.proc_mem_login(pMap.get("msg").toString());
		msg = my.socialnumCheck(pMap);
		logger.info("msg: "+msg);
	}*/
	/*public static void main(String[] args) {
		crm_MypageDao my = new crm_MypageDao();
		String msg;
		Map<String, Object> pMap = new HashMap<String, Object>();
		//pMap.put("mem_socialnum", "1211212-123123");
		//String result = "";
		pMap.put("u_id","test11");
		pMap.put("u_pw","123");
		pMap.put("u_soc","910685-1129566");
		pMap.put("u_addr","서울시 판교");
		pMap.put("u_phone","010-1111-1118");
		pMap.put("u_name","회원8");
		pMap.put("u_email","test8@naver.com");
		msg = my.proc_mem_Add(pMap);
		//result = my.idCheck(pMap);
		//result = my.socialnumCheck(pMap);
		logger.info("m: "+msg);
	}*/
    
}