<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> pList = (List<Map<String, Object>>)request.getAttribute("bList");
	if(pList!=null){
		Gson g = new Gson();
		String temp = g.toJson(pList);
		out.print(temp);		
	}
	
%>