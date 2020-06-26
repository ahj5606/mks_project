<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String a = request.getParameter("a");
	String b = request.getParameter("b");
	String c = request.getParameter("c");
	String d = request.getParameter("d");
	String e = request.getParameter("e");
	String f = request.getParameter("f");
	out.print(a+"\n");
	out.print(b+"\n");
	out.print(c+"\n");
	out.print(d+"\n");
	out.print(e+"\n");
	out.print(f+"\n");
%>