<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%@ page import="com.google.gson.Gson"%>

<%
	Object obj = request.getAttribute("mypageSel");
	List<Map<String,Object>> list = null;
	if(obj!=null){
		list = (List<Map<String,Object>>)obj;
		Gson gson = new Gson();
		String imsi = gson.toJson(list);
		out.print(imsi);
	}
%>