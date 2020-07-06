<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%@ page import="com.google.gson.Gson"%>

<%

	Object obj = request.getAttribute("mList_size");
	if(obj!=null){
		int size = (int)obj;
		out.print(size);
	}else{
		Object obj2 = request.getAttribute("mList");
		if(obj2!=null){
			List<Map<String,Object>> list = (List<Map<String,Object>>)obj2;
			Gson gson = new Gson();
			String imsi = gson.toJson(list);
			out.print(imsi);
		}
	}


%>