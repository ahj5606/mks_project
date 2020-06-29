<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s_file = request.getParameter("s_file");
	
	out.print(s_file);
%>