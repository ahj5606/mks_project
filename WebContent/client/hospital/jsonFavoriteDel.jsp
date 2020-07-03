<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object obj = request.getAttribute("result");
	int result = 0;
	if(obj != null) {
		result = (int)obj;
		out.print(result);
	}
%>
