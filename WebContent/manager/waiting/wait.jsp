<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String hp_code = "";
String hp_name = "";
String dept_name = "";
String dept_code="";
String mks_id="";

Cookie[] cookies = request.getCookies();
if(cookies!=null && cookies.length>0){
	for(int i =0;i<cookies.length;i++){
		String name = cookies[i].getName();
		if(name.equals("hp_name")){
			hp_name = cookies[i].getValue();
		}
		if(name.equals("dept_name")){
			dept_name = cookies[i].getValue();
		}
		if(name.equals("dept_code")){
			dept_code = cookies[i].getValue();
		}
		if(name.equals("mks_id")){
			mks_id = cookies[i].getValue();
		}
		
	}
}

HttpSession sess = request.getSession();
hp_code = (String)sess.getAttribute("hp_code");
%>
<%@include file="/common/ManagerCommon.jsp" %>
<html>
<head>
<script type="text/javascript">
	function btn_re(){
		$.ajax({
			url:'/manager/wating/rewait.mgr?hp_code='+'<%=hp_code%>'
			,success:function(data){
				alert("이전번호");
				btn_pre();
			}
			
		})
		
		
	}
	function btn_pre(){
		$.ajax({
      		url:'/manager/wating/prewait.mgr?hp_code='+'<%=hp_code%>' 
     		,success: function (data){
     			var str = JSON.stringify(data);
     			var res = JSON.parse(str);  
     			wait_number=res[0].DEPT_PREWAIT;
     			document.getElementById("dept_lastwait").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+wait_number+" 번";
           	}
      		,error:function(data){
      		}
      		
  		}); 
		
		
	}
	function btn_next(){
		$.ajax({
			url:'/manager/wating/nextwait.mgr?hp_code=<%=hp_code%>'
			,success:function(data){
				alert("다음번호");
				btn_pre();
			}
			
		})
		
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	   .container{
	      padding:5px;
	   }
	   a.navbar-brand{/*네비바 글자 가운데 정렬*/
	      margin: auto;
	   }
	   .navbar .navbar-brand {
	        color: #F6F6F6;
	       font-size: x-large;
	   }
	   .navbar .navbar-brand:hover,
	   .navbar .navbar-brand:focus {
	       color: #FFFFFF;
	   }
	   #qr, #qr:hover{
	      border-color:#EAEAEA; 
	   }
	   body{
	       font-size: large;
	        font-family: 'Do Hyeon', sans-serif;
	   }
	   div.modal-header{
	      text-align:center;
	   }
	</style>
</head>
<body>
  <!-- 네이게이션 -->
   <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#007bff;">
       <a class="navbar-brand" href="#"><%= hp_name%> 대기 정보<input type="hidden" value="12345"></a><!-- 병원코드 숨겨두기 -->
    </nav>
   <!-- 본문 -->
   <div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:30px;">
        <div class="row mb-3 mt-5" style="justify-content: center">
            <table id="t_waiting">
               <tr><th style='padding:2px;text-align:right;'>현재 번호</th><td style='padding:2px;' id="dept_lastwait">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0 번</td></tr>
         </table>
        </div>
        <div class="row mb-3 mt-5" style="justify-content: center">
           <button type="button" class="btn btn-success" id="qr" onClick="btn_re()">이전번호 호출</button>
           <button type="button" class="btn btn-success" id="qr" onClick="btn_next()">다음번호 호출</button>
        </div>
   </div>
<script type="text/javascript">
 $(document).ready(function(){
	 btn_pre();
	 
 })
</script>
</body>
</html>