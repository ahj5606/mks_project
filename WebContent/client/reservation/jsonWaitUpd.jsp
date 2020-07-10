<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object obj = request.getAttribute("result");
	int result = 0;
	String imsi = null;
	if(obj != null) {
		result = (int)obj;
		if(result == 1) {
			imsi = "성공";
		}
		else if(result == 0) {
			imsi = "실패";
		}
		else {
			imsi = "불일치";
		}
	}
	out.print(imsi);
%>
