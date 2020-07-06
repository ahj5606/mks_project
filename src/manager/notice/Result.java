package manager.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;


public class Result extends HttpServlet {
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	public List<Map<String, Object>> mList(){
		List<Map<String, Object>> mList = new ArrayList<Map<String,Object>>();
		try {
			Connection con = dbMgr.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT mem_memcode, mem_name, mem_socialnum,mem_phone, mem_address,mem_online FROM mks_member");
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> mMap = new HashMap<String, Object>();
				mMap.put("mem_memcode", rs.getInt("mem_memcode"));
				mMap.put("mem_name", rs.getString("mem_name"));
				mMap.put("mem_socialnum", rs.getString("mem_socialnum"));
				mMap.put("mem_phone", rs.getString("mem_phone"));
				mMap.put("mem_address", rs.getString("mem_address"));
				mMap.put("mem_online", rs.getInt("mem_online"));
				mList.add(mMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mList;
	}
	public List<Map<String, Object>> search_title(Map<String,Object> pMap){
		List<Map<String, Object>> sList = new ArrayList<Map<String,Object>>();
		try {
			Connection con = dbMgr.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT mem_memcode, mem_name, mem_socialnum,mem_phone, mem_address,mem_online FROM mks_member");
			sql.append(" where mem_name=?");
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, pMap.get("mem_name").toString());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> mMap = new HashMap<String, Object>();
				mMap.put("mem_memcode", rs.getInt("mem_memcode"));
				mMap.put("mem_name", rs.getString("mem_name"));
				mMap.put("mem_socialnum", rs.getString("mem_socialnum"));
				mMap.put("mem_phone", rs.getString("mem_phone"));
				mMap.put("mem_address", rs.getString("mem_address"));
				mMap.put("mem_online", rs.getInt("mem_online"));
				sList.add(mMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sList;
	}
	
		public List<Map<String, Object>> search_writer(Map<String,Object> pMap){
			List<Map<String, Object>> sList = new ArrayList<Map<String,Object>>();
			try {
				Connection con = dbMgr.getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append("SELECT mem_memcode, mem_name, mem_socialnum,mem_phone, mem_address,mem_online FROM mks_member");
				sql.append(" where mem_address=?");
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, pMap.get("mem_address").toString());
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					Map<String, Object> mMap = new HashMap<String, Object>();
					mMap.put("mem_memcode", rs.getInt("mem_memcode"));
					mMap.put("mem_name", rs.getString("mem_name"));
					mMap.put("mem_socialnum", rs.getString("mem_socialnum"));
					mMap.put("mem_phone", rs.getString("mem_phone"));
					mMap.put("mem_address", rs.getString("mem_address"));
					mMap.put("mem_online", rs.getInt("mem_online"));
					sList.add(mMap);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return sList;
	}
}
