package mks.util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnction {
	public static SqlSessionFactory sqlSessionFactory = null;
	public static void init() {
		try {
			String resource ="/mks/mybatis/Configuration.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader, "development");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getSqlsessionFactory() {
		init();
		System.out.println(sqlSessionFactory==null);
		return sqlSessionFactory;
	}
}
