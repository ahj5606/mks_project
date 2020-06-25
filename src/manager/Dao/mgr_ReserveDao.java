package manager.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;
public class mgr_ReserveDao {
	Logger logger = Logger.getLogger(mgr_ReserveDao.class);
	SqlSessionFactory sqlMapper=null;
	SqlSession sqlSes = null;
	public  mgr_ReserveDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes	= sqlMapper.openSession();//crud할 준비 완료!
	}
	public int getResTotal(Map<String, Object> pMap) {
		//페이지네이션
		logger.info("RDao getTotal 호출 성공");
		int tot = 0;
		tot= sqlSes.selectOne("getResTotal",pMap);
		logger.info("tot  : "+tot);
		return tot;
	}
	public List<Map<String, Object>> reserveList(Map<String, Object> pMap) {
		logger.info("reserveList 호출 성공");
		List<Map<String,Object>> rList = null;
		rList=sqlSes.selectList("reserveList",pMap);
		logger.info("rList:"+rList.size());
		return rList;
	}
	public List<Map<String, Object>> reserveSEL(Map<String, Object> pMap) {
		List<Map<String,Object>> rList = null;
		rList=sqlSes.selectList("reserveSEL",pMap);
		return rList;
	}
	public List<Map<String, Object>> reserveDetail(Map<String, Object> pMap) {
		List<Map<String,Object>> rList = null;
		rList=sqlSes.selectList("reserveDetail",pMap);
		return rList;
	}
	public int reserveUPD(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<Map<String, Object>> reserveDoctor(Map<String, Object> pMap) {
		List<Map<String,Object>> rList = null;
		rList=sqlSes.selectList("reserveDoctor",pMap);
		return rList;
	}
	public List<Map<String, Object>> reserveSchedule(Map<String, Object> pMap) {
		List<Map<String,Object>> rList = null;
		rList=sqlSes.selectList("reserveSchedule",pMap);
		return rList;
	}


}
