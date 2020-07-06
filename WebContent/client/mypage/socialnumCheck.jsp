<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object res = request.getAttribute("socialnumCheck");
	String socialnumCheck = null;
	if(res!=null){
	socialnumCheck = (String)res;
		out.print(socialnumCheck);
	}
%>