<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<% 
	String qr_code = request.getParameter("qr_code");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="/js/qrcode.js">
	</script>
	<style type="text/css">
	</style>
</head>
<body>
	<div id="qrcode" style="margin:auto;text-align:center;"></div>
	<script type="text/javascript">
	    var qrcode = new QRCode(document.getElementById("qrcode"), {
	        text: "<%=qr_code%>",
	        width: 500,
	        height: 500,
	        colorDark : "#000000",
	        colorLight : "#ffffff",
	        correctLevel : QRCode.CorrectLevel.H
	    });
	</script>
</body>
</html>