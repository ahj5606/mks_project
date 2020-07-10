<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="com.google.gson.Gson" %>    
<%@ page trimDirectiveWhitespaces="true" %>
<%
   String url = "jdbc:oracle:thin:@192.168.0.234:1521:orcl11";
   //String mem_code = (String)request.getAttribute("mem_code");
   String mem_code = request.getParameter("mem_code");
   System.out.print(mem_code);

   Connection con = null;
   Statement stmt = null;
   ResultSet rs = null;
   StringBuffer sql = new StringBuffer();
   sql.append("SELECT hp_name, dept_name, sch_date, res_time, res_qrcode FROM mks_reserve");
   sql.append(" WHERE mem_memcode='"+mem_code+"'");
   try{
      //드라이버 클래스를 로딩한다.(안드로이드의 경우는 필요없다. 왜? :내장되어 있음.)
      //제품군의 이름을 알 수 있다.(서버에 대한 다른 정보도 알수 있음.)
      Class.forName("oracle.jdbc.driver.OracleDriver");
      //물리적으로 떨어져 있는 서버제품과 연결통로를 확보함.
      con = DriverManager.getConnection(url,"scott","tiger");
      //쿼리문을 전달할 전령객체 필요. 처리에 대한 요청(select문)
      stmt = con.createStatement();
      rs = stmt.executeQuery(sql.toString());
      List<Map<String,Object>> ptList = new ArrayList<>();
      Map<String,Object> rMap = null;
     while(rs.next()){
        rMap = new HashMap<>();
        rMap.put("hp_name",rs.getString("hp_name"));
        rMap.put("dept_name",rs.getString("dept_name"));
        rMap.put("sch_date",rs.getString("sch_date"));
        rMap.put("res_time",rs.getString("res_time"));
        rMap.put("res_qrcode",rs.getString("res_qrcode"));
        ptList.add(rMap);
     }
     Gson g = new Gson();
     System.out.print(ptList);
     String imsi = g.toJson(ptList);
     out.print(imsi);
     
     
   
   }catch(SQLException se){
      out.print(se.toString());
   }catch(Exception e){
      out.print(e.toString());      
   }finally{
      //사용한 자원에 대한 반납을 명시적으로 처리
      //만일 생략하면 당장은 에러가 발생하지 않지만 자원회수가 늦어지고 
      //쓰레기 정보가 남게되어서 서버에 부담을 줄 수 있다.
      try{
         if(rs!=null) rs.close();
         if(stmt !=null) stmt.close();
         if(con !=null) con.close();
      }catch(Exception e2){
         
      }
   }

%>    