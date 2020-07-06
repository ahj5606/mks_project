<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> dList =(List<Map<String,Object>>)request.getAttribute("deptList");
	Gson g = new Gson();
	String imsi = g.toJson(dList);
	out.print(imsi);
%>