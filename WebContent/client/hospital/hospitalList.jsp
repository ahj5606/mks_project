<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.google.gson.Gson"  %>  
<%@ page import="java.util.Map" %>  
<%@ page import="java.util.List" %>  
<%-- 스크립틀릿 - 자바코드를 쓸수 있는 땅 --%>        
<%
	Object obj = request.getAttribute("size");
	if(obj==null){
	List<Map<String,Object>> hpList =(List<Map<String,Object>>)request.getAttribute("hpList");
	
	Gson gson = new Gson();
	String imsi = gson.toJson(hpList);
	out.print(imsi);
	}else{
		int imsi = (int)obj;
		out.print(imsi);
	}
%>
