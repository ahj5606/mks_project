<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/bootStrap4UI.jsp"%>
</head>
<body>
<script>
	$(document).ready(function(){
//		var dept_name = '내과';
		var dept_name = null;
		var sts = "치과 외과 내과".indexOf(dept_name);
		alert(sts);
	});
</script>
</body>
</html>