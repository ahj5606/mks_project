<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//세션에 저장된 값 꺼냄
	Object parameter = session.getAttribute("mem_name");
	String mem_name = null;
	if(parameter!=null){
		mem_name = (String)parameter;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상단메뉴</title>
<style type="text/css">
	.container{
		padding:5px;
	}
	.navbar .navbar-brand {
	  color: #F6F6F6;
	  font-family: 'Do Hyeon', sans-serif;
	  font-size: xxx-large;
	}
	.navbar .navbar-brand:hover,
	.navbar .navbar-brand:focus {
	  color: #FFFFFF;
	  font-family: 'Do Hyeon', sans-serif;
	}
	.navbar .navbar-nav .nav-link {
	  color: #F6F6F6;
	  border-radius: .25rem;
	  margin: 0 0.25em;
	  font-family: 'Do Hyeon', sans-serif;
	  font-size: x-large;
	}
	.navbar .navbar-nav .nav-link:not(.disabled):hover,
	.navbar .navbar-nav .nav-link:not(.disabled):focus {
	  color: #FFFFFF;
	}
	.navbar .navbar-nav .nav-item.active .nav-link,
	.navbar .navbar-nav .nav-item.active .nav-link:hover,
	.navbar .navbar-nav .nav-item.active .nav-link:focus,
	.navbar .navbar-nav .nav-item.show .nav-link,
	.navbar .navbar-nav .nav-item.show .nav-link:hover,
	.navbar .navbar-nav .nav-item.show .nav-link:focus {
	  color: #FFFFFF;
	}
	.navbar .navbar-nav .nav-item.dropdown .dropdown-menu .dropdown-item{
		font-family: 'Do Hyeon', sans-serif;
	 	font-size: large;
	 	color: #353535;
	}
	.navbar .navbar-nav .nav-item.dropdown .dropdown-menu .dropdown-item:hover{
		background-color:#EAEAEA;
	}
</style>
</head>
<body>
	<!-- 최상단 메뉴 -->
	<% if(mem_name==null){// 로그인 전이니? ****%>
	<nav class="navbar navbar-expand-md navbar-dark" style="background-color: #007bff;">
		<div class="container">
	    	<div class="collapse navbar-collapse" id="navbarsExample04" >
		       	<ul class="navbar-nav ml-auto"><!-- ml-auto: 왼쪽에 마진이 자동으로 생김 -->
		        	 <li class="nav-item">
		          	 	 <a class="nav-link " href="/client/mypage/createAccount.jsp" style="font-size:large;">회원가입</a>
		         	 </li>
		         	 <li class="nav-item">
		          		  <a class="nav-link" href="/client/login/main.jsp" style="font-size:large;">로그인</a>
		          	 </li>
		        </ul>
			</div>
		</div>
    </nav>
    <%}else {// 로그인 되었니? ****%>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #007bff;">
		<div class="container">
	    	<div class="collapse navbar-collapse" id="navbarsExample04">
		       	<ul class="navbar-nav ml-auto">
		        	 <li class="nav-item">
		          	 	 <a class="nav-link " href="/client/mypage/myReservationList.jsp" style="font-size:large;">내정보</a>
		         	 </li>
		         	 <li class="nav-item">
		          		  <a class="nav-link" href="/client/login/logout.jsp" style="font-size:large;">로그아웃</a>
		          	 </li>
		        </ul>
			</div>
		</div>
    </nav>
    <%} %>
	<!-- 상단 메뉴 -->
    <nav class="navbar navbar-expand-md navbar-light" style="background-color: #007bff;">
    <div class="container">
		<a class="navbar-brand" href="/client/login/main.jsp" style="margin-right:100px">KSM 코스모 메디컬</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" 
							aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="container">
		<div class="collapse navbar-collapse" id="navbarsExample04">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" style="width:150px;" href="#" id="dropdown04" data-toggle="dropdown" 
														aria-haspopup="true" aria-expanded="false">이용안내</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="/client/info/citeIntro.jsp">사이트 소개</a>

						<a class="dropdown-item" href="/client/info/nonmemServiceIntro.jsp">비회원 서비스</a>
						<a class="dropdown-item" href="/client/info/memServiceIntro.jsp">회원 서비스</a>

					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/client/hospital/hospitalListView.jsp" style="width:150px;">제휴병원</a>
				</li>
				<li class="nav-item">
					<a class="nav-link " href="/client/healthInfo/healthInfoList.jsp" style="width:150px;">건강정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/client/board/boardList.jsp" style="width:150px;">고객참여</a>
				</li>
			</ul>
		</div>
		</div>
	</div>
    </nav>
    
</body>
</html>