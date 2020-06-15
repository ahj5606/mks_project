<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Information</title>
</head>
<body>
    <%
        //post방식 - 전송데이터를 한글처리해야된다.
        request.setCharacterEncoding("utf-8");
        
        // 파라미터값 가져오기 
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String loginChk =request.getParameter("loginChk");
        System.out.println(loginChk);
        
        
        // 기존 데이터베이스의 사용자아이디, 패스워드
        String dbId = "박보검";
        String dbPasswd = "1234";
        // 기존정보와 사용자입력정보를 비교
        // 정보가 일치할 경우 로그인 == 세션값 생성 "id" id / 이동 ssesionMain.jsp
        if(id.equals(dbId)){
            
        }else {
            out.println("아이디가 일치하지않음.\n");
            %>
            <script>
            alert('아이디가 일치하지않음');
            location.href='main.jsp';    
            </script>
            <%
        }
        
        
        if(pw.equals(dbPasswd)){
            // 로그인작업 - 세션생성
             session.setAttribute("id", id);
            
            // 사용자의 로그인 유지여부를 체크박스null확인으로 한다.-> checkbox는 체크되지않으면 null값이 리턴된다.
            if(loginChk != null){
                // null값이 아니라면 id값을 쿠키로 저장
                Cookie cookie = new Cookie("id",id);
                cookie.setMaxAge(60*2);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
                %>
                <script>
                alert('로그인이 인증됨\n 메인페이지로 이동');
                location.href='main.jsp';    
                </script>
                <%
        
        }
        else{
            out.println("비밀번호가 일치하지않음.");
            %>
            <script>
            alert('비번호가 일치하지않음');
            location.href='main.jsp';    
            </script>
            <%
        }
        %>
</body>
</html>
