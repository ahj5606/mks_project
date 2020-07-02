<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.google.gson.Gson"  %>  
<%@ page import="java.util.Map" %>  
<%@ page import="java.util.List" %>  
<%-- 스크립틀릿 - 자바코드를 쓸수 있는 땅 --%>        
<%
Object obj = request.getAttribute("calender");
Object obj1 = request.getAttribute("calender1");

List<Map<String,Object>> calender2 = new ArrayList<>();
Map<String,Object> map = null;

if(obj1!=null){
	List<Map<String,Object>> calender1 =  null;
	calender1 =(List<Map<String,Object>>)obj1;
	for(int i=0; i<calender1.size(); i++){
		map = new HashMap<>();
		map.put("start", calender1.get(i).get("SCH_DATE"));
		map.put("end", calender1.get(i).get("SCH_DATE"));
		map.put("rendering", "background");
		calender2.add(map);
	}
		Gson gson = new Gson();
		String imsi = gson.toJson(calender2);
		out.print(imsi);
}else{
	List<Map<String,Object>> calender =  null;
	if(obj!=null){
		calender =(List<Map<String,Object>>)obj;
	}
	Gson gson = new Gson();
	String imsi = gson.toJson(calender);
	out.print(imsi);

}


%>