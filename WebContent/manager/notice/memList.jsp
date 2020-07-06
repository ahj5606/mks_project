<%@page import="manager.notice.Result"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String param = request.getParameter("param");
	Result r = new Result();
	Gson g = new Gson();
	if(param==null){
		List<Map<String,Object>> mList = r.mList();
		String mem_list = g.toJson(mList);
		out.print(mem_list);
	}else if(param.equals("title")){
		Map<String,Object> pMap = new HashMap<>();
		pMap.put("mem_name", param);
		List<Map<String,Object>> rList = r.search_title(pMap);
		String title = g.toJson(rList);
		out.print(title);
	}else if(param.equals("writer")){
		Map<String,Object> pMap = new HashMap<>();
		pMap.put("mem_address", param);
		List<Map<String,Object>> rList = r.search_writer(pMap);
		String writer = g.toJson(rList);
		out.print(writer);
	}
	
	
	
%>