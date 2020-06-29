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
		//예약목록 확인 리스트.
		logger.info("[crm_MypageDao] mypageList 호출성공");
		List<Map<String, Object>> mypageList = null;
		pMap.put("mem_memcode", 95);
		mypageList = sqlSes.selectList("mypageList", pMap);
		return mypageList;
	}
		
	public List<Map<String, Object>> mypagePassword(Map<String, Object> pMap) {
		//비밀번호 입력 화면 - 비밀번호 일치. 불일치. - 미완성.
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
		//회원가입.
		logger.info("[crm_MypageDao] proc_mem_Add 호출성공");
		 String msg=null;
		sqlSes.selectOne("proc_mem_Add", pMap);
		msg= (String)pMap.get("msg");
		logger.info(msg);
		sqlSes.commit(true);
		return msg;
	}
	public static void main(String[] args) {
		crm_MypageDao my = new crm_MypageDao();
		Map<String, Object> pMap = new HashMap<String, Object>();
		my.mypageList(pMap);
//		pMap.put("mem_socialnum", "1211212-123123");
//		String result = "";
//		pMap.put("u_id","test1");
//		pMap.put("u_pw","123");
//		pMap.put("u_soc","910685-1129561");
//		pMap.put("u_addr","경기도 부천");
//		pMap.put("u_phone","010-1111-1111");
//		pMap.put("u_name","회원1");
//		pMap.put("u_email","test8@naver.com");
//		result = my.proc_mem_Add(pMap);
//		result = my.idCheck(pMap);
//		result = my.socialnumCheck(pMap);
//		logger.info("result: "+result);
	}
    
}