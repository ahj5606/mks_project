<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
 
    <% 
        //세션값 가져오기
        String id = (String)session.getAttribute("id");
    %>
    <%
        // 이미 로그인된 사용자가 Main.jsp로 넘어오면 쿠키로 사용자를 찾아 세션으로 주입
        // 쿠키값을 세션으로 주입해 , 대신하여 로그인과정을 진행한다.
  
    %>
 
    <h1>메인페이지</h1>
    <%=id %>님이 로그인 하였습니다
      <h1>로 그 인</h1>
    <form action="loginpro.jsp" method="post">
            아  이  디: <input type="text" name="id"><br>
            패스 워드: <input type="password" name="pw"><br>
        <input type ="submit" value ="login">
    </form>
    <br>
 
    <input type="button" value="로그아웃"
        onclick="location.href='logout.jsp'">
 
</body>
</html>