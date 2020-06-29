<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object res = request.getAttribute("proc_mem_Add");
	String proc_mem_Add = null;
if(res!=null){
	proc_mem_Add = (String)res;
		out.print(proc_mem_Add);
	}
%>