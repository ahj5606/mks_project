<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%@ page import="com.google.gson.Gson"%>

<%

List<Map<String, Object>> resList = new ArrayList<Map<String,Object>>();
Map<String,Object> map = null;
map = new HashMap<String, Object>();
map.put("res_date", "2020-06-19");
resList.add(map);
map = new HashMap<String, Object>();
map.put("res_date", "2020-06-20");
resList.add(map);
map = new HashMap<String, Object>();
map.put("res_date", "2020-06-26");
resList.add(map);
map = new HashMap<String, Object>();
map.put("res_date", "2020-06-27");
resList.add(map);
map = new HashMap<String, Object>();
map.put("res_date", "2020-06-28");
resList.add(map);
map = new HashMap<String, Object>();
map.put("res_date", "2020-07-05");
resList.add(map);
map = new HashMap<String, Object>();
map.put("res_date", "2020-07-06");
resList.add(map);

Gson gson = new Gson();
String imsi = gson.toJson(resList);
out.print(imsi);

%>