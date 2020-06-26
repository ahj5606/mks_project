<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%@ page import="com.google.gson.Gson"%>

<%

String imsi = request.getParameter("num");
int num = Integer.parseInt(imsi);

List<Map<String,Object>> list = new ArrayList<>();
Map<String,Object> map = null;

int fNum = 0;
int eNum = 0;
int recodeNum = 1;// 한 페이지에 담길 행의 갯수!!

fNum = (num-1)*recodeNum+1;
eNum = num*recodeNum;

for(int i=fNum; i<=eNum; i++){
map = new HashMap<>();
map.put("GAW","내과"+i);
map.put("DOC","고길동"+i);
map.put("DATE","2020/06/"+i);
map.put("TIME","13:1"+i);
list.add(map);
}

Gson gson = new Gson();
String imsi2 = gson.toJson(list);
out.print(imsi2);

%>