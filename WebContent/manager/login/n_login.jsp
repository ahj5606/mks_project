<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String msg = request.getParameter("msg");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script type="text/javascript">
 
	function login(){
		//alert("로그인 버튼 호출 성공");
		var id = $("#inputid").val();
		var pw = $("#inputpw").val();
		//alert(id+"/"+pw);
		if(id==""){
			//alert("id를 입력해주세요");
			$("#confirm").modal();
		}else if(pw==""){
			//alert("pw를 입력해주세요");
			$("#confirm").modal();
		}else{
			
			location.href="/manager/login/login.mgr?id="+id+"&pw="+pw;
		}
		
	}
	
</script>
</head>
<body>

 <div class="container">
	<div class="col-md-8" >
        <h2 class="form-signin-heading"style="margin-bottom:40px;margin-left:10px;margin-top:50px;">로그인</h2>
        <label class="sr-only" style="margin:10px;">아이디</label>
        <input type="text" id="inputid" style="margin-left:10px;margin-bottom:20px;" class="form-control" placeholder="아이디" required autofocus>
        <label for="inputPassword" style="margin-left:10px;margin-bottom:20px;" class="sr-only">비밀번호</label>
        <input type="password" id="inputpw" style="margin-left:10px;margin-bottom:20px;" class="form-control" placeholder="비밀번호" required>
        <button class="btn btn-lg btn-primary btn-block" style="margin-left:10px;margin-bottom:20px;" onclick="login()">로그인</button>
		<%if(msg!=null){ %>
		<span class="text-danger" style="margin:10px;font-weight: bold;font-size: 1em;">아이디 또는 비밀번호가 맞지 않습니다.</span>
		<%} %>
	</div>
	
	<!-- 로그인모달 시작 -->
	<div id="confirm" class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">확인창</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      
	        <p>&nbsp;아이디 또는 비밀번호를 입력해주세요.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 로그인 모달 끝 -->
		
	
</div>

</body>
</html>