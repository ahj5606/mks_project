<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.google.gson.Gson"  %>  
<%@ page import="java.util.Map" %>  
<%@ page import="java.util.List" %>  
<%-- 스크립틀릿 - 자바코드를 쓸수 있는 땅 --%>        
<%

List<Map<String,Object>> calender = new ArrayList<>();
Map<String,Object> map = null;
List<Map<String,Object>> transList =(List<Map<String,Object>>)request.getAttribute("transList");

   for(int i=0; i<transList.size(); i++){
      map = new HashMap<>();
      map.put("start", transList.get(i).get("TRANS_DATE"));
      map.put("end", transList.get(i).get("TRANS_DATE"));
      map.put("rendering", "background");
      calender.add(map);
  }
      
      Gson g = new Gson();
      String imsi = g.toJson(calender);
      out.print(imsi);


%>