package client.Dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class crm_HospitalDao {
		Logger logger = Logger.getLogger(crm_HospitalDao.class);
		SqlSessionFactory sqlMapper = null;
		SqlSession sqlSes = null;
		public crm_HospitalDao() {
		sqlMapper = MyBatisConnction.getSqlsessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	public List<Map<String, Object>> hospialList(Map<String, Object> pMap) {
		List<Map<String, Object>> hpList = null;
		logger.info("sqlMapper: "+sqlMapper);
		logger.info("sqlSes: "+sqlSes);
		hpList =sqlSes.selectList("hospialList", pMap);
		logger.info("사이즈:  "+hpList.size());
		return hpList;
	}

}