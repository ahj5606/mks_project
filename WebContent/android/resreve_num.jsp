<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%
   String url = "jdbc:oracle:thin:@192.168.0.218:1521:orcl11";
   Connection con = null;
   Statement stmt = null;
   ResultSet rs = null;
   String mem_code = request.getParameter("mem_code");
   String sch_code="";
   StringBuffer sql = new StringBuffer();
   sql.append("SELECT sch_code FROM mks_reserve WHERE mem_memcode='"+mem_code+"'");
   try{
      //드라이버 클래스를 로딩한다.(안드로이드의 경우는 필요없다. 왜? :내장되어 있음.)
      //제품군의 이름을 알 수 있다.(서버에 대한 다른 정보도 알수 있음.)
      Class.forName("oracle.jdbc.driver.OracleDriver");
      //물리적으로 떨어져 있는 서버제품과 연결통로를 확보함.
      con = DriverManager.getConnection(url,"scott","tiger");
      //쿼리문을 전달할 전령객체 필요. 처리에 대한 요청(select문)
      stmt = con.createStatement();
      rs = stmt.executeQuery(sql.toString());
      rs.next();
      sch_code = rs.getString("sch_code");
	 System.out.print(sch_code);
      out.print(sch_code);
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