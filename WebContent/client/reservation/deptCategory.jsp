<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.google.gson.Gson"  %>  
<%@ page import="java.util.Map" %>  
<%@ page import="java.util.List" %>  
<%-- 스크립틀릿 - 자바코드를 쓸수 있는 땅 --%>        
<%
	List<Map<String,Object>> deptCategory =(List<Map<String,Object>>)request.getAttribute("deptCategory");
	
	Gson gson = new Gson();
	String imsi = gson.toJson(deptCategory);
	out.print(imsi);
%>