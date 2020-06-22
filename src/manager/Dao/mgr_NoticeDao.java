package manager.Dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class mgr_NoticeDao {
	
	List<Map<String, Object>> nList = new ArrayList<Map<String,Object>>();
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	Logger logger = Logger.getLogger(mgr_NoticeDao.class);
	int result = 0;
	int board_no = 0;
	
	public mgr_NoticeDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public List<Map<String, Object>> noticeSEL(Map<String, Object> nMap){
		try {
			
			nList = sqlSes.selectList("noticeSEL",nMap);
			logger.info("mgr_NoticDao=>noticeSEL=>nList=>"+nList);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return nList;
	}
	
	public int getBoardNO(Map<String,Object> nMap) {
		logger.info("Dao=>getBoardNO 호출 성공");
		
		board_no = sqlSes.selectOne("getBoardNO",nMap);
		
		return board_no;
	}
	
	public int noticeINS(Map<String,Object> nMap) {
		logger.info("dao=>ins호출 성공");

		nMap.put("board_no", board_no);
		try {
			
			result = sqlSes.insert("noticeINS",nMap);
			logger.info("mgr_NoticDao=>noticeINS=>result=>"+result);
			sqlSes.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public int noticeUPD(Map<String,Object> nMap) {
		try {
			logger.info("dao=>upd호출 성공");
			result = sqlSes.update("noticeUPD",nMap);
			logger.info("mgr_NoticDao=>noticeUPD=>result=>"+result);
			sqlSes.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public int noticeDEL(Map<String,Object> nMap) {
		try {
			logger.info("dao=>del호출 성공");
			result = sqlSes.delete("noticeDEL",nMap);
			logger.info("mgr_NoticDao=>noticeDEL=>result=>"+result);
			sqlSes.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
