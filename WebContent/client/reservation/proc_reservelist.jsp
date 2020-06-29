<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.google.gson.Gson"  %>  
<%@ page import="java.util.Map" %>  
<%@ page import="java.util.List" %>  
<%-- 스크립틀릿 - 자바코드를 쓸수 있는 땅 --%>        
<%
Object obj = request.getAttribute("size");
if(obj!=null){
	int size = (int)obj;
	out.print(size);
}else{
	List<Map<String,Object>> proc_reservelist =(List<Map<String,Object>>)request.getAttribute("proc_reservelist");
	
	Gson gson = new Gson();
	String imsi = gson.toJson(proc_reservelist);
	out.print(imsi);
}
%>