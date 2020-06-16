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

	public List<Map<String, Object>> noticeSEL(Map<String, Object> nMap){
		try {
			sqlMapper = MyBatisConnction.getSqlsessionFactory();
			sqlSes = sqlMapper.openSession();
			nList = sqlSes.selectList("noticeSEL",nMap);
			logger.info("mgr_NoticDao=>noticeSEL=>nList=>"+nList);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return nList;
	}
}
