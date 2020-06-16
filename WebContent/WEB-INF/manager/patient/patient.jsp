<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

		List<Map<String, Object>> pList = (List<Map<String, Object>>)request.getAttribute("pList");
	//	int total=pList.size();
	
		Gson g = new Gson();
		String temp = g.toJson(pList);
		//out.print("{ \"total\": "+total+",\"rows\":");
		out.print(temp);		
		//out.print("}");
%>