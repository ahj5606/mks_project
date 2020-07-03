<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap"
      rel="stylesheet"
    />
    
    <link rel="stylesheet" href="./client/css/member.css" />
<title>회원확인</title>
	<script
      src="https://kit.fontawesome.com/2d323a629b.js"
      crossorigin="anonymous"
    ></script>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	  $("#pass").focus();
	});
</script>
<script>

function check_onclick() {
	theForm = document.checkform
	if(theForm.pass.value==""){
		alert("비밀번호가 비어있습니다. 확인해주세요.");
		theForm.pass.focus();
		return false;
	}
	theForm.submit();
}
</script>
</head>
<body>
    <div class="wrap vcenter">
    <div class="container">
    <div class="row">
    <section class="col-md-3"></section>
    <section class="col-md-6">
    	<h3 class="checking marg-bott top-pad">비밀번호 재확인</h3>
    	<h4 class="checking">회원 탈퇴를 원하신다면 비밀번호 재확인을 해주세요.</h4>
    	<br/>
<form role="form" class="form-horizontal" name="checkform" action="./MemberLeaveView.me" method="post" onsubmit="return check_onclick()">
	<div class="form-group">
	<div class="col-sm-12">
		<input class="form-control login" type="text" name="id" placeholder="아이디" title="아이디" alt="아이디 입력란" value="<%= id %>"
		disabled />
	</div></div>
	<div class="form-group">
			<div class="col-sm-12">
			<input class="form-control login" type="password" id="pass" name="pass" placeholder="비밀번호" title="비밀번호" alt="비밀번호 입력란"
			/>
	</div></div>
	
	<div class="form-group">
		<div class="col-sm-12">
			<input type="submit" id="submit" name="submit" class="submit" value="확인" title="확인" alt="확인 버튼"/>
	</div></div>
	<div class="form-group">
		<div class="col-sm-12">
			<input type="button" class="join" onclick="location.href='MemberViewAction.me'" value="취소" title="취소" alt="취소 버튼"/>
	</div></div>
</form>
</section>
<section class="col-md-3"></section>
</div>
</div>
</div>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
</body>
</html>