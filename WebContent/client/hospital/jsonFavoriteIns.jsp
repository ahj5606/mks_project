<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object obj = request.getAttribute("proc_favoriteIns");
	String proc_favoriteIns = null;
	if(obj != null) {
		proc_favoriteIns = (String)obj;
		out.print(proc_favoriteIns);
	}
%>
