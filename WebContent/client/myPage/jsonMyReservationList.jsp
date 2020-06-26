<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%@ page import="com.google.gson.Gson"%>

<%

String imsi = request.getParameter("num");
int num = 0;
if(imsi!=null){
	num = Integer.parseInt(imsi);
}

List<Map<String,Object>> list = new ArrayList<>();
Map<String,Object> map = null;

int fNum = 0;
int eNum = 0;
int recodeNum = 5;// 한 페이지에 담길 행의 갯수!!

fNum = (num-1)*recodeNum+1;
eNum = num*recodeNum;

if(num==0){
	out.print(27);
}else{
	for(int i=fNum; i<=eNum; i++){
		if(i<=27){
			map = new HashMap<>();
			map.put("HOP_NAME","가산병원"+i);
			map.put("DEPT_NAME","내과"+i);
			map.put("DOC_NAME","고길동"+i);
			map.put("RES_DATE","2020/06/"+i);
			map.put("RES_TIME","10:1"+i);
			map.put("RES_CODE",i);
			list.add(map);
		}
	}
			Gson gson = new Gson();
			String imsi2 = gson.toJson(list);
			out.print(imsi2);
}

%>