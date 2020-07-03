<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object res = request.getAttribute("idCheck");
	String idCheck = null;
if(res!=null){
	idCheck = (String)res;
		out.print(idCheck);
	}
%>