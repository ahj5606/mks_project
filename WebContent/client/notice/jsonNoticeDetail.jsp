<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object obj = request.getAttribute("noticeDetail");
	List<Map<String, Object>> noticeDetail = null;
	if(obj != null) {
		noticeDetail = (List<Map<String, Object>>)obj;
	}
	Gson g = new Gson();
	String imsi = g.toJson(noticeDetail);
	out.print(imsi);
%>