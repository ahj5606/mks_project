<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 스크립틀릿 - 자바코드를 쓸수 있는 땅 --%>    
<%
	Object obj = request.getAttribute("size");
	if(obj!=null) {
		int size = (int)obj;
		out.print(size);
	}
	else {
		List<Map<String, Object>> noticeList = (List<Map<String, Object>>)request.getAttribute("noticeList");
		Gson g = new Gson();
		String imsi = g.toJson(noticeList);
		out.print(imsi);
	}
%>