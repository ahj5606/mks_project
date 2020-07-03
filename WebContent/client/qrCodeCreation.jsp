<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<% 
	String sch_code = request.getParameter("sch_code");
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
	<div id="qrcode"></div>
<script type="text/javascript">
    var qrcode = new QRCode(document.getElementById("qrcode"), {
        text: "<%=sch_code%>",
        width: 120,
        height: 120,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H
    });
</script>
</body>
</html>