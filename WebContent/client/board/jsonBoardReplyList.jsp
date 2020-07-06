<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%@ page import="com.google.gson.Gson"%>
<%
	Object obj = request.getAttribute("bReplyList");
	List<Map<String, Object>> boardReplyList = null;
	if(obj!=null){
		boardReplyList = (List<Map<String, Object>>)obj;
	}
	Gson gson = new Gson();
	String imsi = gson.toJson(boardReplyList);
	out.print(imsi);
%>