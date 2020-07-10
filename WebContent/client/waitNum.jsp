<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<% 
   String wait = request.getParameter("wait");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style type="text/css">
         #wait{
            font-size: 500px;
         }
         #text{
            font-size: 250px;
         }
   </style>
</head>
<body>
   <div style="margin:auto;text-align:center;"><span id="text" >대기번호  </span><br><span id="wait" ><%= wait%></span></div>
</body>
</html>