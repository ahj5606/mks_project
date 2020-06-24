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
int recodeNum = 5;

fNum = (num-1)*recodeNum+1;
eNum = num*recodeNum;

for(int i=fNum; i<=eNum; i++){
map = new HashMap<>();
map.put("BOARD_TITLE","후기"+i);
map.put("MKS_ID","star"+i);
map.put("BOARD_DATE","2020/06/1"+i);
map.put("BOARD_NO",i);
list.add(map);
}

Gson gson = new Gson();
String imsi2 = gson.toJson(list);
out.print(imsi2);

%>