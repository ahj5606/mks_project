package client.Dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import mks.util.MyBatisConnction;

public class crm_LoginDao {

	Logger logger = Logger.getLogger(crm_LoginDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
   
   public crm_LoginDao() {
	   sqlMapper = MyBatisConnction.getSqlsessionFactory();
	   sqlSes = sqlMapper.openSession();
   }
   
   public List<Map<String, Object>> proc_mem_login(Map<String, Object> pMap) {
	   
	   logger.info("[crm_LoignDao] proc_mem_login호출 성공");
	   List<Map<String, Object>> login = new ArrayList<>();
       String name = null;
       String id = null;
       sqlSes.selectList("proc_mem_login", pMap);
       if(pMap.get("msg")!=null) {
     	  name = pMap.get("msg").toString();
       }
       logger.info("name: " + name);
       if(pMap.get("msg_id")!=null) {
     	  id = pMap.get("msg_id").toString();
       }
       logger.info("id: " + id);
       login.add(pMap);
       logger.info(login.size());
       sqlSes.commit(true);
       return login;
   }
}

