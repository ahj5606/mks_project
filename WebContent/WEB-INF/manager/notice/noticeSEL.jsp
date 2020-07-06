<%@page import="manager.Dao.mgr_NoticeDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> nList = (List<Map<String,Object>>)request.getAttribute("nList");

	Gson g = new Gson();
	String result = g.toJson(nList);
	out.print(result);
%>