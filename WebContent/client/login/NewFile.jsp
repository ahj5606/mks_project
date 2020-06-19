<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../../common/bootStrap4UI.jsp"%>
	<script type="text/javascript">
	function gogo(){
		cmm_window_popup('https://naver.com','400','400','병원');
	}
	</script>
</head>
<body>
	<input type="button" onClick="gogo()"/>
</body>
</html>