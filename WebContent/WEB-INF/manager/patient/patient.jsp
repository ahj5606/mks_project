<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> pList =(List<Map<String,Object>>)request.getAttribute("pList");
	Gson g = new Gson();
	String imsi = g.toJson(pList);
	out.print(imsi);
%>