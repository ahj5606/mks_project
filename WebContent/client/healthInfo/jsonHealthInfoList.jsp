<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%@ page import="com.google.gson.Gson"%>
<%
	Object obj = request.getAttribute("hList_size");
	
	if(obj!=null){//사이즈를 넘겨야한다면!
		int bList_size = (int)obj;
		out.print(bList_size);
	}else{
		Object obj2 = request.getAttribute("hList");
		List<Map<String, Object>> boardList = null;
		if(obj2!=null){
			boardList = (List<Map<String, Object>>)obj2;
		}
		Gson gson = new Gson();
		String imsi = gson.toJson(boardList);
		out.print(imsi);
	}
%>